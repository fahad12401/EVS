import 'package:evs/Screens/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Database/Database_Helper.dart';
import '../Module for Get Data/Login_response.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                painter: CurvePainter(),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.11,
                    ),
                    Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 0,
                          child: Container(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: IconButton(
                                padding:
                                    const EdgeInsets.only(left: 0.0, top: 9.0),
                                icon: const Icon(
                                  Icons.arrow_back_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )),
                        ),
                        Center(
                          child: const Text(
                            "P R O F I L E",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Calibri',
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    FutureBuilder<List<User>>(
                      future: DBHelper.Readresponse(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<User>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        } else if (snapshot.hasData) {
                          return ListView(
                            shrinkWrap: true,
                            children: snapshot.data!.map((dataa) {
                              firstnameInitial =
                                  dataa.firstName!.substring(0, 1);
                              lastnameInitial = dataa.lastName!.substring(0, 1);

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "${firstnameInitial}${lastnameInitial}",
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Container(
                                        color: Colors.indigo[50],
                                        height: 380.0,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13.0,
                                              right: 10.0,
                                              top: 13.0),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  const Text(
                                                    "First Name:",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Calibri',
                                                        fontSize: 18.0),
                                                  ),
                                                  const SizedBox(
                                                    width: 45.0,
                                                  ),
                                                  Text(
                                                    "${dataa.firstName ?? ''}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        fontFamily: 'Calibri',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              const Divider(),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  const Text(
                                                    "Last Name:",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Calibri',
                                                        fontSize: 18.0),
                                                  ),
                                                  const SizedBox(
                                                    width: 45.0,
                                                  ),
                                                  Text(
                                                    "${dataa.lastName ?? ''}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        fontFamily: 'Calibri',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              const Divider(),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  const Text(
                                                    "Username:",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Calibri',
                                                        fontSize: 18.0),
                                                  ),
                                                  const SizedBox(
                                                    width: 45.0,
                                                  ),
                                                  Text(
                                                    "${dataa.userName ?? ' '}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        fontFamily: 'Calibri',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              const Divider(),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  const Text(
                                                    "Branch Id:",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Calibri',
                                                        fontSize: 18.0),
                                                  ),
                                                  const SizedBox(
                                                    width: 50.0,
                                                  ),
                                                  Text(
                                                    "${dataa.branchId ?? ' '}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        fontFamily: 'Calibri',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              const Divider(),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  const Text(
                                                    "Code:",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Calibri',
                                                        fontSize: 18.0),
                                                  ),
                                                  const SizedBox(
                                                    width: 73.0,
                                                  ),
                                                  Text(
                                                    "${dataa.code ?? ' '}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        fontFamily: 'Calibri',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              const Divider(),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  const Text(
                                                    "Id:",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Calibri',
                                                        fontSize: 18.0),
                                                  ),
                                                  const SizedBox(
                                                    width: 91.0,
                                                  ),
                                                  Flexible(
                                                    fit: FlexFit.loose,
                                                    child: Text(
                                                      "${dataa.id ?? ' '}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                          fontFamily: 'Calibri',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const Divider(),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  const Text(
                                                    "Password#:",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Calibri',
                                                        fontSize: 18.0),
                                                  ),
                                                  const SizedBox(
                                                    width: 40.0,
                                                  ),
                                                  Flexible(
                                                    fit: FlexFit.loose,
                                                    child: Text(
                                                      "${dataa.passwordHash}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                          fontFamily: 'Calibri',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }).toList(),
                          );
                        } else {
                          return Text("No Data available");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? firstnameInitial;
String? lastnameInitial;
get firstName => firstnameInitial;
get lastName => lastnameInitial;
