import 'dart:io';
import 'package:evs/Screens/PreviewImage.dart';
import 'package:evs/Widgets/Card_Widgets/Tenant_CustomCard.dart';
import 'package:evs/Widgets/Dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../Module for Get Data/Inquires_response.dart';
import '../../Widgets/Gps_Widgets/GPS.dart';

class VerificationofTenant extends StatefulWidget {
  VerificationofTenant(
      {super.key,
      this.tenentverify,
      required this.NameofPerson,
      required this.typeofPerson,
      required this.AddressofTenant,
      required this.Landmark});
  final List<TenantVerifications>? tenentverify;
  final String NameofPerson;
  final String typeofPerson;
  final String AddressofTenant;
  final String Landmark;

  @override
  State<VerificationofTenant> createState() => _VerificationofTenantState();
}

class _VerificationofTenantState extends State<VerificationofTenant> {
  final _tenantnamecontroller = TextEditingController();
  final tenantcontactcontroller = TextEditingController();
  final tenantcncController = TextEditingController();
  final tenantPeriodcontroller = TextEditingController();
  final tenantRentcontroller = TextEditingController();
  final tenantCommentcontroller = TextEditingController();
  GlobalKey<FormState> _tenantformKey = GlobalKey<FormState>();
  String radioselectedoption = '';
  String? TenantLatitude;
  String? TenantLongtitude;
  File? TenantImage;
  Future<void> CaptureTenantImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      MyDialog.show(context, 'Kindly Take image');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    } else {
      setState(() {
        TenantImage = File(image.path);
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewImage(
                    capimages: TenantImage,
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
            "Tenant Verification (${widget.typeofPerson})",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Calibri',
                fontSize: 20.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Tenant_Customcard(
                  NameofPerson: widget.NameofPerson,
                  typeofPerson: widget.typeofPerson,
                  AddressofTenant: widget.AddressofTenant,
                  Landmark: widget.Landmark),
              Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0),
                child: Form(
                  key: _tenantformKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Tenant Name:",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      TextFormField(
                        controller: _tenantnamecontroller,
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
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Divider(),
                      const Text(
                        "Tenant Contact No:",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      TextFormField(
                        controller: tenantcontactcontroller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Enter Number Here.",
                            hintStyle: TextStyle(fontFamily: 'Calibri'),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff392850), width: 2.0))),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Divider(),
                      const Text(
                        "Tenant CNIC:",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      TextFormField(
                        controller: tenantcncController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Enter CNIC Here.",
                            hintStyle: TextStyle(fontFamily: 'Calibri'),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff392850), width: 2.0))),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Divider(),
                      const Text(
                        "Tenancy Period:",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      TextFormField(
                        controller: tenantPeriodcontroller,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Enter Period Here.",
                            hintStyle: TextStyle(fontFamily: 'Calibri'),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff392850), width: 2.0))),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Divider(),
                      const Text(
                        "Tenant Rent:",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      TextFormField(
                        controller: tenantRentcontroller,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            hintText: "Enter Rent Here.",
                            hintStyle: TextStyle(fontFamily: 'Calibri'),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff392850), width: 2.0))),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Divider(),
                      const Text(
                        "General Comments:",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      TextFormField(
                        controller: tenantCommentcontroller,
                        maxLines: 5,
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
                          value: "Satisfactory",
                          title: const Text(
                            "Satisfactory",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Calibri',
                                fontSize: 18.0),
                          ),
                          groupValue: radioselectedoption,
                          onChanged: (value) {
                            setState(() {
                              radioselectedoption = value!;
                            });
                          }),
                      RadioListTile(
                          activeColor: Color(0xff392850),
                          value: "Unsatisfactory",
                          title: const Text(
                            "Unsatisfactory",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Calibri',
                                fontSize: 18.0),
                          ),
                          groupValue: radioselectedoption,
                          onChanged: (value) {
                            setState(() {
                              radioselectedoption = value!;
                            });
                          }),
                      SizedBox(
                        height: 5.0,
                      ),
                      Divider(),
                      GPSLocation(
                        newLat: TenantLatitude,
                        newLong: TenantLongtitude,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5.0,
                      ),
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
                          CaptureTenantImage();
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
