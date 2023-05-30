import 'dart:io';

import 'package:evs/Screens/PreviewImage.dart';
import 'package:evs/Widgets/Card_Widgets/Residence_customcard.dart';
import 'package:evs/Widgets/Dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Module for Get Data/Inquires_response.dart';

class ApplicantResidenceNeighbor extends StatefulWidget {
  ApplicantResidenceNeighbor(
      {super.key,
      this.ApplicantNeighbourVerified,
      required this.PersonType,
      required this.NameofPerson,
      required this.residenceAddress,
      required this.nearestLandmark,
      required this.resVerID});
  final List<ResidenceVerifications>? ApplicantNeighbourVerified;
  final String PersonType;
  final String NameofPerson;
  final String residenceAddress;
  final String nearestLandmark;
  final int resVerID;
  @override
  State<ApplicantResidenceNeighbor> createState() =>
      _ApplicantResidenceNeighborState();
}

class _ApplicantResidenceNeighborState
    extends State<ApplicantResidenceNeighbor> {
  final _ApplicantNeighborformKey = GlobalKey<FormState>();
  final ApplicantNeighborNameController = TextEditingController();
  final ApplicantneighborAddressController = TextEditingController();
  final ApplicantneighborTimePeriodController = TextEditingController();
  final ApplicantneighborCommentController = TextEditingController();
  String ApplicantNeighborknowsvalue = '';
  File? ResidenceNeighborImage;
  Future<void> CaptureRNeighborImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      MyDialog.show(context, 'Kindly Take image');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    } else {
      setState(() {
        ResidenceNeighborImage = File(image.path);
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewImage(
                    capimages: ResidenceNeighborImage,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff392850),
        title: Text(
          "Neighbor Check (${widget.PersonType})",
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
                  key: _ApplicantNeighborformKey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Neighbor's Name:",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    TextFormField(
                      controller: ApplicantNeighborNameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          hintText: "Enter Name Here.",
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
                      "Neighbor's Address:",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    TextFormField(
                      maxLines: 2,
                      controller: ApplicantneighborAddressController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          hintText: "Enter Address Here.",
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
                      "Does Neighbor know the ${widget.PersonType} ?",
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
                                  groupValue: ApplicantNeighborknowsvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      ApplicantNeighborknowsvalue = value!;
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
                                  groupValue: ApplicantNeighborknowsvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      ApplicantNeighborknowsvalue = value!;
                                    });
                                  }),
                            ),
                          ],
                        )),
                    TextFormField(
                      enabled: ApplicantNeighborknowsvalue == 'Yes',
                      controller: ApplicantneighborTimePeriodController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          hintText: "Enter Address Here.",
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
                      "Comments Regarding the ${widget.PersonType}:",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    TextFormField(
                      maxLines: 2,
                      controller: ApplicantneighborTimePeriodController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          hintText: "Enter Comment Here.",
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
                  ],
                ),
              ),
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
                        CaptureRNeighborImage();
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
    );
  }
}
