import 'dart:io';

import 'package:evs/Screens/PreviewImage.dart';
import 'package:evs/Widgets/Card_Widgets/Office_CustomCard.dart';
import 'package:evs/Widgets/Dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Module for Get Data/Inquires_response.dart';

class OfficeNeighborVerification extends StatefulWidget {
  OfficeNeighborVerification(
      {super.key,
      this.workofficeverified,
      required this.NameofOffice,
      required this.AddressofOffice,
      required this.NameofPerson,
      required this.Landmark,
      required this.typeOfPerson});
  final List<WorkOfficeVerifications>? workofficeverified;
  final String NameofOffice;
  final String AddressofOffice;
  final String NameofPerson;
  final String Landmark;
  final String typeOfPerson;

  @override
  State<OfficeNeighborVerification> createState() =>
      _OfficeNeighborVerificationState();
}

class _OfficeNeighborVerificationState
    extends State<OfficeNeighborVerification> {
  GlobalKey<FormState> _OfficeNeighborformKey = GlobalKey<FormState>();
  GlobalKey<FormState> _neighborKnowledgeValueformKey = GlobalKey<FormState>();
  final neighborNameController = TextEditingController();
  final neighborAddressController = TextEditingController();
  final knowledgeofNeighborController = TextEditingController();
  final commentController = TextEditingController();
  final establishedController = TextEditingController();
  String neighborKnowledgeValue = '';
  File? NeighborImage;
  Future<void> CaptureNeighborImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      MyDialog.show(context, 'Kindly Take image');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    } else {
      setState(() {
        NeighborImage = File(image.path);
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewImage(
                    capimages: NeighborImage,
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
              "Neighbor/Market Check (${widget.typeOfPerson})",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Calibri',
                  fontSize: 22.0),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              OfficeCustomCard(
                  NameofOffice: widget.NameofOffice,
                  AddressofOffice: widget.AddressofOffice,
                  NameofPerson: widget.NameofPerson,
                  Landmark: widget.Landmark,
                  typeOfPerson: widget.typeOfPerson),
              Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0),
                child: Form(
                  key: _OfficeNeighborformKey,
                  child: Column(
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
                        controller: neighborNameController,
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
                        controller: neighborAddressController,
                        maxLines: 3,
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
                        "Does Neighbor know the ${widget.typeOfPerson} ?",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      Form(
                        key: _neighborKnowledgeValueformKey,
                        child: ListTileTheme(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: RadioListTile<String>(
                                      activeColor: Color(0xff392850),
                                      value: "Yes",
                                      title: Text(
                                        "Yes",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Calibri',
                                            fontSize: 18.0),
                                      ),
                                      groupValue: neighborKnowledgeValue,
                                      onChanged: (value) {
                                        setState(() {
                                          neighborKnowledgeValue = value!;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                      activeColor: Color(0xff392850),
                                      value: "No",
                                      title: Text(
                                        "No",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Calibri',
                                            fontSize: 18.0),
                                      ),
                                      groupValue: neighborKnowledgeValue,
                                      onChanged: (value) {
                                        setState(() {
                                          neighborKnowledgeValue = value!;
                                        });
                                      }),
                                ),
                              ],
                            )),
                      ),
                      TextFormField(
                        enabled: neighborKnowledgeValue == 'Yes',
                        controller: knowledgeofNeighborController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Since How Long Neighbor Knows",
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
                        "Business Established Since -Current (Market Check):",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      TextFormField(
                        controller: establishedController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Enter Business Established Here.",
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
                        "Comments Regarding the ${widget.typeOfPerson}:",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      TextFormField(
                        controller: commentController,
                        maxLines: 3,
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
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: 40.0,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                backgroundColor: Color(0xff392850)),
                            onPressed: () {},
                            child: Text(
                              "Click here. If Person is 'SALARIED PERSON'",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Calibri',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 3.0,
                      )
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
                          if (_OfficeNeighborformKey.currentState!.validate() &&
                              _neighborKnowledgeValueformKey.currentState!
                                  .validate()) {
                            CaptureNeighborImage();
                          } else {
                            MyDialog.show(context, "Kindly fill all fields");
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.of(context, rootNavigator: true).pop();
                            });
                          }
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
