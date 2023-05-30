import 'dart:io';

import 'package:evs/Screens/PreviewImage.dart';
import 'package:evs/Widgets/Card_Widgets/Salary_CustomCard.dart';
import 'package:evs/Widgets/Dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Module for Get Data/Inquires_response.dart';

class SalaryVerification extends StatefulWidget {
  SalaryVerification(
      {super.key,
      this.salaryslipverify,
      required this.NameofPerson,
      required this.NameofOffice,
      required this.landmark,
      required this.typeofPerson,
      required this.AddressofOffice});
  final List<SalarySlipVerifications>? salaryslipverify;
  final String NameofPerson;
  final String NameofOffice;
  final String landmark;
  final String typeofPerson;
  final String AddressofOffice;

  @override
  State<SalaryVerification> createState() => _SalaryVerificationState();
}

class _SalaryVerificationState extends State<SalaryVerification> {
  GlobalKey<FormState> _salarySlipformKey = GlobalKey<FormState>();
  TextEditingController slipCommentcontroller = TextEditingController();
  int? slipselectedoption;
  File? SalaryImage;
  Future<void> CaptureSalaryImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      MyDialog.show(context, 'Kindly Take image');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    } else {
      setState(() {
        SalaryImage = File(image.path);
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewImage(
                    capimages: SalaryImage,
                  )));
    }
  }

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SalarySlip_CustomCard(
                  NameofPerson: widget.NameofPerson,
                  NameofOffice: widget.NameofOffice,
                  landmark: widget.landmark,
                  typeofPerson: widget.typeofPerson,
                  AddressofOffice: widget.AddressofOffice),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                child: Form(
                  key: _salarySlipformKey,
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
                        controller: slipCommentcontroller,
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
                      const Divider(),
                      const Text("Outcome of Verification:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 24.0,
                              fontFamily: 'Calibri')),
                      RadioListTile(
                          activeColor: Color(0xff392850),
                          value: 1,
                          title: const Text(
                            "Satisfactory",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Calibri',
                                fontSize: 18.0),
                          ),
                          groupValue: slipselectedoption,
                          onChanged: (value) {
                            setState(() {
                              slipselectedoption = value;
                            });
                          }),
                      SizedBox(height: 1.0),
                      RadioListTile(
                          activeColor: Color(0xff392850),
                          value: 2,
                          title: const Text(
                            "Unsatisfactory",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Calibri',
                                fontSize: 18.0),
                          ),
                          groupValue: slipselectedoption,
                          onChanged: (value) {
                            setState(() {
                              slipselectedoption = value;
                            });
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: 120.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
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
                    width: 120.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: Color(0xff392850)),
                        onPressed: () {
                          CaptureSalaryImage();
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
              const SizedBox(
                height: 3.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
