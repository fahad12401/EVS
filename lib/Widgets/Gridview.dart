import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:evs/Database/Database_Helper.dart';
import 'package:evs/Screens/Inquires_Screen.dart';
import 'package:evs/Widgets/Dialogbox.dart';
import 'package:evs/Widgets/Logs/Logeger.dart';
import 'package:evs/Widgets/Logs/LoggerEmail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quickalert/quickalert.dart';
import '../Module for Get Data/Inquires_response.dart';
import '../Screens/Setting_Screen.dart';
import 'Animated_Widgets/Animated_Dialog.dart';
import 'package:http/http.dart' as http;

class GridDashboard extends StatefulWidget {
  GridDashboard({
    super.key,
  });

  @override
  State<GridDashboard> createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  bool isLoading = false;
  var color = 0xff453658;

  @override
  void initState() {
    super.initState();
  }

  // Method for getting inquiries Data
  Future getinquires() async {
    setState(() {
      isLoading = true;
    });
    if (dataa != null) {
      setState(() {
        isLoading = false;
      });
      return;
    }
    final url = Uri.parse(
        "${predefurl}Inquiry/GetInquiry?userId=${id}&residenceIds&workOfficeIds&bankStatementIds&salarySlipIds&tenantIds");
    var connectivityResult = await Connectivity().checkConnectivity();
    try {
      if (connectivityResult == ConnectivityResult.none) {
        MyDialog.show(context, "There is no internet connection!");
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context, rootNavigator: true).pop();
        });
        EVSLogger.appendLog("${connectivityResult.toString()}");
      } else {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          print(response.body);
          verificationobj = Verification.fromJson(jsonDecode(response.body));
          EVSLogger.appendLog(
              "Response of Status code ${response.statusCode.toString()}");

          if (verificationobj.Status == 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 5),
                content: Text(
                  "${verificationobj.message.toString()}",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                )));
            EVSLogger.appendLog("${verificationobj.message.toString()}");
          } else {
            dataa = verificationobj.data;
            EVSLogger.appendLog(
                "There are ${dataa!.length.toString()}Inquiries Downloaded");

            await DBHelper.CreateInquiriesResponseDB(dataa!.toList());

            DBHelper.DataResponse();

            // for (int i = 0; i < verificationobj.data!.length; i++) {
            //   Map<dynamic, dynamic> verficationMap = {
            //     'residenceverify': dataa![i].residenceVerifications,
            //     'workOfficeVerify': dataa![i].workOfficeVerifications,
            //     'bankStatementVerify': dataa![i].bankStatementVerifications,
            //     'tenantVerify': dataa![i].tenantVerifications,
            //     'salarySlipVerify': dataa![i].salarySlipVerifications,
            //   };
            // }
          }
        }
      }
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 5),
          content: Text(
            "${e.toString()}",
            style: TextStyle(color: Colors.white, fontFamily: 'Calibri'),
          )));
      EVSLogger.appendLog("${e.toString()}");
    }
    setState(() {
      isLoading = false;
    });

    return verificationobj;
  }

  @override
  Widget build(BuildContext context) {
    var shapee =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0));
    return Stack(children: [
      Column(
        children: [
          Flexible(
              child: GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: (0.6 / .6),
                  padding: const EdgeInsets.only(
                      left: 13.0, right: 13.0, top: 0.0, bottom: 15.0),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: [
                Material(
                  shape: shapee,
                  color: Color(color),
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                          width: 60.0,
                          child: Image.asset(
                            "assets/inquiry.png",
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Download Inquires",
                            style: TextStyle(
                                fontFamily: 'Calibri',
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      isLoading
                          ? null
                          : getinquires().then((result) {
                              if (result == null) {
                                getinquires().then((value) {
                                  if (value == null) {
                                    QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.error);
                                  }
                                });
                              } else {
                                if (result != null) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AnimatedDialog()));
                                }
                              }
                            });
                    },
                  ),
                ),
                Material(
                  shape: shapee,
                  color: Color(color),
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                          width: 60.0,
                          child: Image.asset(
                            "assets/syncnew.png",
                            // color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sync Inquires",
                            style: TextStyle(
                                fontFamily: 'Calibri',
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Material(
                  shape: shapee,
                  color: Color(color),
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                          width: 60.0,
                          child: Image.asset(
                            "assets/listinq.png",
                            // color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Inquiry List",
                            style: TextStyle(
                                fontFamily: 'Calibri',
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InquiresScreen()));
                    },
                  ),
                ),
                Material(
                  shape: shapee,
                  color: Color(color),
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                          width: 60.0,
                          child: Image.asset(
                            "assets/viewlog.png",
                            color: Colors.orangeAccent,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Logs",
                            style: TextStyle(
                                fontFamily: 'Calibri',
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      EVSLoggerEmail email = EVSLoggerEmail(context);
                      email.showEmailDialog();
                    },
                  ),
                ),
                Material(
                  shape: shapee,
                  color: Color(color),
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                          width: 60.0,
                          child: Image.asset(
                            "assets/update.png",
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Update Application",
                            style: TextStyle(
                                fontFamily: 'Calibri',
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Material(
                  shape: shapee,
                  color: Color(color),
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                          width: 60.0,
                          child: Image.asset(
                            "assets/chart.png",
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Status",
                            style: TextStyle(
                                fontFamily: 'Calibri',
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                )
              ])),
        ],
      ),
      if (isLoading)
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
          ),
        )
    ]);
  }
}

String id = '';
