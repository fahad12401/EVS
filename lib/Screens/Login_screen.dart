import 'dart:convert';
import 'package:evs/Database/DBCreate.dart';
import 'package:evs/Database/Database_Helper.dart';
import 'package:evs/Widgets/Animated_Widgets/animated_popup.dart';
import 'package:evs/Widgets/Logs/Logeger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../Module for Get Data/Login_response.dart';
import '../Widgets/Logs/LoggerEmail.dart';
import '../main.dart';
import 'Setting_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  ButtonState state = ButtonState.init;
  final _formkey = GlobalKey<FormState>();
  bool _obsecuretext = true;
  bool isLoading = false;
  DateTime? currentBackpressTime;

  // ***************************************/////////////
  // ***************************************/////////////

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

  // ***************************************/////////////
  // ***************************************/////////////
  Future<LoginResponse> Login() async {
    setState(() {
      isLoading = true;
    });
    String _username = _emailcontroller.text;
    String _password = _passwordcontroller.text;

    String primaryurl =
        "${predefurl}Account/LoginTab?UserName=${_username}&Password=${_password}";
    try {
      final response = await http.get(Uri.parse(primaryurl));

      if (response.statusCode == 200) {
        print(response.body);
        loginresponse = LoginResponse.fromJson(jsonDecode(response.body));

        DBHelper.createUserinfoDB(loginresponse);
        DBHelper.Readresponse();

        EVSLogger.appendLog(
            "Response from Api ${response.statusCode.toString()}");

        if (loginresponse.user != null) {
          EVSLogger.appendLog("Login Response of the user is Successful");

          if (_username != " " && _password != " ") {
            // preferences = await SharedPreferences.getInstance();

            // preferences!.setString("evs", "${login.user!.id.toString()}");

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Animatedcheck(
                          Dialogname: 'Login Successfully!',
                          color: Colors.green,
                          icon: Icons.check,
                        )));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Please Enter Correct Email or Password",
              style:
                  TextStyle(fontFamily: 'Calibri', fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ));
        }
      } else if (response.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Status: 404 Not Found",
            style:
                TextStyle(fontFamily: 'Calibri', fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ));
        EVSLogger.appendLog("Found Error ${response.statusCode.toString()}");
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "${e} or There is no internet connection!",
          style: TextStyle(fontFamily: 'Calibri', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
      EVSLogger.appendLog("${e}");
      throw e;
    }
    setState(() {
      isLoading = false;
    });
    return loginresponse;
  }

  void _toggle() {
    setState(() {
      _obsecuretext = !_obsecuretext;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isInit = isAnimating || state == ButtonState.init;
    final isDone = state == ButtonState.completed;

    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: WillPopScope(
        onWillPop: _onwillPop,
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 110.0, bottom: 0.0),
                  child: Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: const AssetImage('assets/icil.png'))),
                  ),
                ),
                const Text(
                  "Electronic Verification System",
                  style: TextStyle(
                    fontFamily: 'Calibri',
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
                  child: Column(
                    children: <Widget>[
                      Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _emailcontroller,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white54,
                                    prefixIcon: Icon(
                                      Icons.email_sharp,
                                      color: Color(0xff453658),
                                    ),
                                    hintText: "Enter Email",
                                    hintStyle: TextStyle(fontFamily: 'Calibri'),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(28, 63, 175, 1),
                                            width: 2.0))),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Please Enter Email";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                controller: _passwordcontroller,
                                obscureText: _obsecuretext,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white54,
                                    prefixIcon: Icon(
                                      Icons.key_sharp,
                                      color: Color(0xff453658),
                                    ),
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(fontFamily: 'Calibri'),
                                    suffixIcon: IconButton(
                                        onPressed: _toggle,
                                        icon: Icon(
                                          _obsecuretext
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.blueGrey,
                                        )),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(28, 63, 175, 1),
                                            width: 2.0))),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Please Enter Password";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 18.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Settings()));
                              },
                              icon: const Icon(
                                Icons.settings,
                                color: Colors.black54,
                                size: 25.0,
                              ),
                              label: const Text(
                                "Setting",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontFamily: 'Calibri',
                                    color: Colors.black54),
                              )),
                          Container(
                              height: 50,
                              width: 150,
                              child: isLoading
                                  ? null
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder(),
                                          backgroundColor: Color(
                                            (0xff453658),
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Sign in",
                                            style: TextStyle(
                                                fontFamily: 'Calibri',
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Icon(Icons.arrow_forward_sharp)
                                        ],
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          if (_formkey.currentState!
                                              .validate()) {
                                            Login();
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  "Please Fill Login Details"),
                                              duration: Duration(seconds: 2),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ));
                                          }
                                        });
                                      },
                                    )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            if (isLoading)
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: SpinKitFadingCircle(
                    color: Colors.black,
                    size: 40.0,
                  ),
                ),
              )
          ]),
        ),
      ),
    );
  }
}

bool isAnimating = true;

enum ButtonState { init, submitting, completed }
