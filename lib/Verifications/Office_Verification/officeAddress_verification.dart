import 'dart:io';

import 'package:evs/Screens/PreviewImage.dart';
import 'package:evs/Widgets/Dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../Module for Get Data/Inquires_response.dart';
import '../../Widgets/Card_Widgets/Office_CustomCard.dart';

class OfficeAddressVerification extends StatefulWidget {
  OfficeAddressVerification(
      {super.key,
      this.workofficeverified,
      required this.NameofOffice,
      required this.AddressofOffice,
      required this.NameofPerson,
      required this.Landmark,
      required this.typeOfperson});
  final List<WorkOfficeVerifications>? workofficeverified;
  final String NameofOffice;
  final String AddressofOffice;
  final String NameofPerson;
  final String Landmark;
  final String typeOfperson;
  @override
  State<OfficeAddressVerification> createState() =>
      _OfficeAddressVerificationState();
}

class _OfficeAddressVerificationState extends State<OfficeAddressVerification> {
  GlobalKey<FormState> _OfficeAddressformKey = GlobalKey<FormState>();
  final correctAddressController = TextEditingController();
  final overallTimeController = TextEditingController();
  final newAddressController = TextEditingController();
  final reasonController = TextEditingController();
  final personCnicController = TextEditingController();
  final cnicController = TextEditingController();
  String actualAddressValue = '';
  String addressworkstateValue = '';
  String meetApplicantValue = '';
  String ifcnicValue = '';
  File? AddressImage;
  Future<void> CaptureAddressImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      MyDialog.show(context, 'Kindly Take image');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    } else {
      setState(() {
        AddressImage = File(image.path);
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewImage(
                    capimages: AddressImage,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xff392850),
        title: Text(
          "Office Address Verification (${widget.typeOfperson})",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Calibri',
              fontSize: 22.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            OfficeCustomCard(
                NameofOffice: widget.NameofOffice,
                AddressofOffice: widget.AddressofOffice,
                NameofPerson: widget.NameofPerson,
                Landmark: widget.Landmark,
                typeOfPerson: widget.typeOfperson),
            Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0),
              child: Form(
                  key: _OfficeAddressformKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Was Actual Address same as Above:",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      ListTileTheme(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: RadioListTile<String>(
                                    activeColor: Color(0xff392850),
                                    value: "Yes",
                                    title: const Text(
                                      "Yes",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Calibri',
                                          fontSize: 18.0),
                                    ),
                                    groupValue: actualAddressValue,
                                    onChanged: (value) {
                                      setState(() {
                                        actualAddressValue = value!;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: RadioListTile<String>(
                                    activeColor: Color(0xff392850),
                                    value: "No",
                                    title: const Text(
                                      "No",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Calibri',
                                          fontSize: 18.0),
                                    ),
                                    groupValue: actualAddressValue,
                                    onChanged: (value) {
                                      setState(() {
                                        actualAddressValue = value!;
                                      });
                                    }),
                              ),
                            ],
                          )),
                      TextFormField(
                        enabled: actualAddressValue == 'No',
                        controller: correctAddressController,
                        maxLines: 2,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Enter Correct Address Here.",
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
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        "Length of Time the Business/Office has been Established (Overall):",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      TextFormField(
                        controller: overallTimeController,
                        maxLines: 2,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Enter Overall Time Here.",
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
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Does the  Works at the given Address:",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      ListTileTheme(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: RadioListTile<String>(
                                    activeColor: Color(0xff392850),
                                    value: "Yes",
                                    title: const Text(
                                      "Yes",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Calibri',
                                          fontSize: 18.0),
                                    ),
                                    groupValue: addressworkstateValue,
                                    onChanged: (value) {
                                      setState(() {
                                        addressworkstateValue = value!;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: RadioListTile<String>(
                                    activeColor: Color(0xff392850),
                                    value: "No",
                                    title: const Text(
                                      "No",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Calibri',
                                          fontSize: 18.0),
                                    ),
                                    groupValue: addressworkstateValue,
                                    onChanged: (value) {
                                      setState(() {
                                        addressworkstateValue = value!;
                                      });
                                    }),
                              ),
                            ],
                          )),
                      TextFormField(
                        enabled: addressworkstateValue == 'No',
                        controller: newAddressController,
                        maxLines: 2,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Enter New Address.",
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
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Did you Meet the ${widget.typeOfperson} ?",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      ListTileTheme(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: RadioListTile<String>(
                                    activeColor: Color(0xff392850),
                                    value: "Yes",
                                    title: const Text(
                                      "Yes",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Calibri',
                                          fontSize: 18.0),
                                    ),
                                    groupValue: meetApplicantValue,
                                    onChanged: (value) {
                                      setState(() {
                                        meetApplicantValue = value!;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: RadioListTile<String>(
                                    activeColor: Color(0xff392850),
                                    value: "No",
                                    title: const Text(
                                      "No",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Calibri',
                                          fontSize: 18.0),
                                    ),
                                    groupValue: meetApplicantValue,
                                    onChanged: (value) {
                                      setState(() {
                                        meetApplicantValue = value!;
                                      });
                                    }),
                              ),
                            ],
                          )),
                      TextFormField(
                        enabled: meetApplicantValue == 'No',
                        controller: reasonController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Enter Reason For Not Available Here.",
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
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      TextFormField(
                        enabled: meetApplicantValue == 'No',
                        controller: personCnicController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Enter Met Person CNIC here.",
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
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${widget.typeOfperson} CNIC # (0/s Physically if Possible)",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      ListTileTheme(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: RadioListTile<String>(
                                    activeColor: Color(0xff392850),
                                    value: "Yes",
                                    title: const Text(
                                      "Yes",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Calibri',
                                          fontSize: 18.0),
                                    ),
                                    groupValue: ifcnicValue,
                                    onChanged: (value) {
                                      setState(() {
                                        ifcnicValue = value!;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: RadioListTile<String>(
                                    activeColor: Color(0xff392850),
                                    value: "No",
                                    title: const Text(
                                      "No",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Calibri',
                                          fontSize: 18.0),
                                    ),
                                    groupValue: ifcnicValue,
                                    onChanged: (value) {
                                      setState(() {
                                        ifcnicValue = value!;
                                      });
                                    }),
                              ),
                            ],
                          )),
                      const Divider(),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        "CNIC# :",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      TextFormField(
                        controller: cnicController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Enter Met Person CNIC here.",
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
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 3.0,
                      )
                    ],
                  )),
            ),
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
                        CaptureAddressImage();
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
            SizedBox(
              height: 3.0,
            )
          ],
        ),
      ),
    );
  }
}
