import 'dart:async';

import 'package:evs/Screens/Home_Screen.dart';
import 'package:evs/Widgets/Animated_Widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/Logs/LoggerEmail.dart';
import '../main.dart';
import 'Login_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool? isLoggedin;
  setSharedPerference(BuildContext context) async {
    preferences = await SharedPreferences.getInstance();
    var evs = preferences!.getString("evs");
    if (evs != null && evs.isNotEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  // @override
  // void initState() {
  //   Timer(
  //       Duration(seconds: 04),
  //       () => Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => LoginScreen())));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    DateTime? currentBackpressTime;
    Future<bool> _onwillPop() {
      DateTime now = DateTime.now();
      if (currentBackpressTime == null ||
          now.difference(currentBackpressTime!) > Duration(seconds: 2)) {
        currentBackpressTime = now;
        showSnck(context, "Press back button again to exit", Colors.red);
        return Future.value(false);
      }
      return Future.value(true);
    }

    Future.delayed(Duration(seconds: 04), () {
      setSharedPerference(context);
    });
    return WillPopScope(
      onWillPop: _onwillPop,
      child: Scaffold(
        backgroundColor: Color(0xff453658),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [CustomImage(image: "assets/splashlogo.png")],
                ),
              ),
              Text(
                "Electronic Verification System",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Calibri',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
