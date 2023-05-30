import 'dart:io';
import 'package:evs/Screens/PreviewImage.dart';
import 'package:evs/Widgets/Card_Widgets/Bank_Customcard.dart';
import 'package:evs/Widgets/Dialogbox.dart';
import 'package:evs/Widgets/Gps_Widgets/GPS.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../Module for Get Data/Inquires_response.dart';

class BankVerificationofStatment extends StatefulWidget {
  BankVerificationofStatment(
      {super.key,
      this.bankofficeverified,
      required this.NameOfBank,
      required this.NameOfPerson,
      required this.typeofPerson,
      required this.landmark});
  final List<BankStatementVerifications>? bankofficeverified;
  final String NameOfBank;
  final String NameOfPerson;
  final String typeofPerson;
  final String landmark;

  @override
  State<BankVerificationofStatment> createState() =>
      _BankVerificationofStatmentState();
}

class _BankVerificationofStatmentState
    extends State<BankVerificationofStatment> {
  GlobalKey<FormState> _BankformKey = GlobalKey<FormState>();

  TextEditingController commentcontroller = TextEditingController();
  int? selectedoption;
  String? Banklongtitude;
  String? Banklatitude;
  File? BankImage;

  @override
  void dispose() {
    commentcontroller;
    super.dispose();
  }

  Future<void> CaptureBankImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      MyDialog.show(context, 'Kindly Take image');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    } else {
      setState(() {
        BankImage = File(image.path);
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewImage(
                    capimages: BankImage,
                  )));
    }
  }
  // convertbase64(XFile? file) {
  //   final bytes = File(CapturedImage!.path).readAsBytesSync();
  //   String base64encode = base64Encode(bytes);
  //   return base64encode;
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Color(0xff392850),
          title: Text(
            "Bank Statement Verification (${widget.typeofPerson})",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Calibri',
                fontSize: 20.0),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2));
          },
          child: SingleChildScrollView(
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Bank_CustomCard(
                      NameOfBank: widget.NameOfBank,
                      NameOfPerson: widget.NameOfPerson,
                      typeofPerson: widget.typeofPerson,
                      landmark: widget.landmark),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                    child: Form(
                      key: _BankformKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text("Comments:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontFamily: 'Calibri')),
                          TextFormField(
                            controller: commentcontroller,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white54,
                                hintText: "Enter Comments Here.",
                                hintStyle: TextStyle(fontFamily: 'Calibri'),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff392850), width: 2.0))),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Kindly fill the Field";
                              }
                              return null;
                            },
                            maxLines: 5,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Text("Outcome of Verification:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontFamily: 'Calibri')),
                          FormField(
                            builder: (FormFieldState<bool> state) {
                              return Column(
                                children: <Widget>[
                                  RadioListTile(
                                      activeColor: Color(0xff392850),
                                      value: 1,
                                      title: Text(
                                        "Satisfactory",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Calibri',
                                            fontSize: 18.0),
                                      ),
                                      groupValue: selectedoption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedoption = value;
                                          print(value);
                                        });
                                      }),
                                  const SizedBox(height: 1.0),
                                  RadioListTile(
                                      activeColor: Color(0xff392850),
                                      value: 2,
                                      title: Text(
                                        "Unsatisfactory",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Calibri',
                                            fontSize: 18.0),
                                      ),
                                      groupValue: selectedoption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedoption = value;
                                        });
                                      }),
                                ],
                              );
                            },
                            validator: (value) {
                              if (value != true) {
                                return "Please select one option!";
                              } else {
                                return selectedoption.toString();
                              }
                            },
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5.0,
                          ),
                          GPSLocation(
                            newLat: Banklatitude,
                            newLong: Banklongtitude,
                          ),
                          const Divider()
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            width: 130.0,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    backgroundColor: Color(0xff392850)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Back",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Calibri',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Container(
                            height: 40.0,
                            width: 130.0,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    backgroundColor: Color(0xff392850)),
                                onPressed: () {
                                  CaptureBankImage();
                                },
                                child: const Text(
                                  "Take Image",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Calibri',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
