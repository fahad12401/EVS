import 'dart:io';

import 'package:evs/Database/Database_Helper.dart';
import 'package:evs/Module%20For%20Post%20Data/Post_inquires_model..dart';
import 'package:evs/Screens/PreviewImage.dart';
import 'package:evs/Widgets/Card_Widgets/Residence_customcard.dart';
import 'package:evs/Widgets/Dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Module for Get Data/Inquires_response.dart';

class ApplicantHomeverification extends StatefulWidget {
  ApplicantHomeverification(
      {super.key,
      this.ApplicantHomeVerified,
      required this.PersonType,
      required this.NameofPerson,
      required this.residenceAddress,
      required this.nearestLandmark,
      required this.resVerId,
      required this.Inquiryid});
  final List<ResidenceVerifications>? ApplicantHomeVerified;
  final String PersonType;
  final String NameofPerson;
  final String residenceAddress;
  final String nearestLandmark;
  final int resVerId;
  final int Inquiryid;

  @override
  State<ApplicantHomeverification> createState() =>
      _ApplicantHomeverificationState();
}

class _ApplicantHomeverificationState extends State<ApplicantHomeverification> {
  final _ApplicanthomeformKey = GlobalKey<FormState>();
  final ApplicantpersonNameController = TextEditingController();
  final ApplicantpersonRelationController = TextEditingController();
  final ApplicantcorrectAddressController = TextEditingController();
  final ApplicantpermanentAddressController = TextEditingController();
  final ApplicantphonenumberController = TextEditingController();
  final ApplicantyearsController = TextEditingController();
  final ApplicantcnicController = TextEditingController();
  String ApplicantMeetvalue = '';
  String ApplicantConfirmAddressValue = '';
  String ApplicantGivenAddressValue = '';
  bool showTextfield = false;
  File? HomeImage;
  Future<void> CaptureHomeImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      MyDialog.show(context, 'Kindly Take image');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    } else {
      setState(() {
        HomeImage = File(image.path);
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewImage(
                    capimages: HomeImage,
                  )));
    }
  }

  saveresDetails() {
    ResidenceDetail residenceD = ResidenceDetail(
        ResidenceDetailId: widget.resVerId.toString(),
        IsApplicantAvailable: ApplicantMeetvalue.toString(),
        NameOfPersonToMet: ApplicantpersonNameController.text.toString(),
        RelationWithApplicant:
            ApplicantpersonRelationController.text.toString(),
        CorrectAddress: ApplicantConfirmAddressValue.toString(),
        PhoneNo: ApplicantphonenumberController.text.toString(),
        LivesAtGivenAddress: ApplicantGivenAddressValue.toString(),
        PermanentAddress: ApplicantpermanentAddressController.text.toString(),
        SinceHowintLiving: ApplicantyearsController.text.toString(),
        CNICNo: ApplicantcnicController.text.toString(),
        PersonType: widget.PersonType,
        InquiryId: widget.Inquiryid.toString());
    residencedetail = residenceD;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff392850),
        title: Text(
          "Residence Verification (${widget.PersonType})",
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
            Residence_CustomCard(
                TypeofPerson: widget.PersonType,
                Name: widget.NameofPerson,
                Address: widget.residenceAddress,
                Landmark: widget.nearestLandmark),
            Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0),
              child: Form(
                child: Column(
                  key: _ApplicanthomeformKey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Did you Meet the ${widget.PersonType}?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    ListTileTheme(
                      dense: true,
                      child: Row(
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
                                  groupValue: ApplicantMeetvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      ApplicantMeetvalue = value!;
                                    });
                                  })),
                          Expanded(
                              child: RadioListTile(
                                  activeColor: Color(0xff392850),
                                  value: "No",
                                  title: const Text(
                                    "No",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Calibri',
                                        fontSize: 18.0),
                                  ),
                                  groupValue: ApplicantMeetvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      ApplicantMeetvalue = value!;
                                    });
                                  })),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      enabled: ApplicantMeetvalue == 'No',
                      controller: ApplicantpersonNameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          hintText: "Enter Name of Person to Met Here",
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
                      height: 5.0,
                    ),
                    TextFormField(
                      enabled: ApplicantMeetvalue == 'No',
                      controller: ApplicantpersonRelationController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          hintText: "Enter Relation of Person Here.",
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
                      "Was Actual Address same as Above?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    ListTileTheme(
                      dense: true,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: RadioListTile(
                                  activeColor: Color(0xff392850),
                                  value: "Yes",
                                  title: const Text(
                                    "Yes",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Calibri',
                                        fontSize: 18.0),
                                  ),
                                  groupValue: ApplicantConfirmAddressValue,
                                  onChanged: (value) {
                                    setState(() {
                                      ApplicantConfirmAddressValue = value!;
                                    });
                                  })),
                          Expanded(
                              child: RadioListTile(
                                  activeColor: Color(0xff392850),
                                  value: "No",
                                  title: const Text(
                                    "No",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Calibri',
                                        fontSize: 18.0),
                                  ),
                                  groupValue: ApplicantConfirmAddressValue,
                                  onChanged: (value) {
                                    setState(() {
                                      ApplicantConfirmAddressValue = value!;
                                    });
                                  })),
                        ],
                      ),
                    ),
                    TextFormField(
                      enabled: ApplicantConfirmAddressValue == 'No',
                      maxLines: 4,
                      controller: ApplicantcorrectAddressController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          hintText: "Enter Correct Address here.",
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
                      "Phone No.",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ApplicantphonenumberController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          hintText: "Enter Phone Number.",
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
                      "Does ${widget.PersonType} Lives at the given Address?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    ListTileTheme(
                      dense: true,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: RadioListTile(
                                  activeColor: Color(0xff392850),
                                  value: "Yes",
                                  title: const Text(
                                    "Yes",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Calibri',
                                        fontSize: 18.0),
                                  ),
                                  groupValue: ApplicantGivenAddressValue,
                                  onChanged: (value) {
                                    setState(() {
                                      ApplicantGivenAddressValue = value!;
                                    });
                                  })),
                          Expanded(
                              child: RadioListTile(
                                  activeColor: Color(0xff392850),
                                  value: "No",
                                  title: const Text(
                                    "No",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Calibri',
                                        fontSize: 18.0),
                                  ),
                                  groupValue: ApplicantGivenAddressValue,
                                  onChanged: (value) {
                                    setState(() {
                                      ApplicantGivenAddressValue = value!;
                                    });
                                  })),
                        ],
                      ),
                    ),
                    TextFormField(
                      enabled: ApplicantGivenAddressValue == 'No',
                      maxLines: 4,
                      controller: ApplicantpermanentAddressController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          hintText: "Enter Permanent Address here.",
                          hintStyle: TextStyle(fontFamily: 'Calibri'),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff392850), width: 2.0))),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Since How Long ${widget.PersonType} is Living on the same Address?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ApplicantyearsController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          hintText: "Enter Years here.",
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
                      "CNIC #",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ApplicantcnicController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          hintText: "Enter CNIC Number.",
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
                    const Divider()
                  ],
                ),
              ),
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
                        saveresDetails();
                        DBHelper.createResidenceFieldsData(residencedetail)
                            .then((value) => print("Success"))
                            .catchError((error) => print(error));
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
            const Divider()
          ],
        ),
      ),
    );
  }
}
