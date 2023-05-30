import 'package:evs/Verifications/Office_Verification/Neighbor_Market_verify.dart';
import 'package:evs/Verifications/Office_Verification/Office_HR_verify.dart';
import 'package:evs/Verifications/Office_Verification/Office_business_verification.dart';
import 'package:evs/Verifications/Office_Verification/officeAddress_verification.dart';
import 'package:evs/Verifications/Office_Verification/office_general_comments.dart';
import 'package:evs/Widgets/Card_Widgets/Office_CustomCard.dart';
import 'package:flutter/material.dart';

import '../../Module for Get Data/Inquires_response.dart';

class VerificationOfOffice extends StatefulWidget {
  VerificationOfOffice(
      {super.key,
      this.workofficeverified,
      required this.NameofOffice,
      required this.AddressofOffice,
      required this.NameofPerson,
      required this.Landmark,
      required this.typeofPerson});
  final List<WorkOfficeVerifications>? workofficeverified;
  final String NameofOffice;
  final String AddressofOffice;
  final String NameofPerson;
  final String Landmark;
  final String typeofPerson;

  @override
  State<VerificationOfOffice> createState() => _VerificationOfOfficeState();
}

class _VerificationOfOfficeState extends State<VerificationOfOffice> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Color(0xff392850),
          title: Text(
            "Office/Business Verification (${widget.typeofPerson})",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Calibri',
                fontSize: 22.0),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            OfficeCustomCard(
                NameofOffice: widget.NameofOffice,
                AddressofOffice: widget.AddressofOffice,
                NameofPerson: widget.NameofPerson,
                Landmark: widget.Landmark,
                typeOfPerson: widget.typeofPerson),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OfficeAddressVerification(
                                  workofficeverified: widget.workofficeverified,
                                  AddressofOffice: widget.AddressofOffice,
                                  Landmark: widget.Landmark,
                                  NameofOffice: widget.NameofOffice,
                                  NameofPerson: widget.NameofPerson,
                                  typeOfperson: widget.typeofPerson,
                                ))),
                    child: Container(
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xff392850), width: 3.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.home_sharp,
                                  color: Colors.black,
                                  size: 25.0,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                const Text(
                                  "Office Address Verification",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontFamily: 'Calibri',
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.arrow_right_alt_outlined,
                              color: Colors.black,
                              size: 25.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Business_Office_Verification(
                                  workofficeverified: widget.workofficeverified,
                                  AddressofOffice: widget.AddressofOffice,
                                  Landmark: widget.Landmark,
                                  NameofOffice: widget.NameofOffice,
                                  NameofPerson: widget.NameofPerson,
                                  typeOfPerson: widget.typeofPerson,
                                ))),
                    child: Container(
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xff392850), width: 3.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          top: 5.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.person_sharp,
                                  color: Colors.black,
                                  size: 25.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      "Business/Work/Office",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25.0,
                                          fontFamily: 'Calibri',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "Verification (For SEB/SEP)",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25.0,
                                          fontFamily: 'Calibri',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Icon(
                              Icons.arrow_right_alt_outlined,
                              color: Colors.black,
                              size: 25.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OfficeHRVerification(
                                  workofficeverified: widget.workofficeverified,
                                  AddressofOffice: widget.AddressofOffice,
                                  Landmark: widget.Landmark,
                                  NameofOffice: widget.NameofOffice,
                                  NameofPerson: widget.NameofPerson,
                                  typeOfPerson: widget.typeofPerson,
                                ))),
                    child: Container(
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xff392850), width: 3.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.business_sharp,
                                  color: Colors.black,
                                  size: 25.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Office/HR Verification",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25.0,
                                          fontFamily: 'Calibri',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "(For Salaried Individual)",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25.0,
                                          fontFamily: 'Calibri',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Icon(
                              Icons.arrow_right_alt_outlined,
                              color: Colors.black,
                              size: 25.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OfficeNeighborVerification(
                                  workofficeverified: widget.workofficeverified,
                                  AddressofOffice: widget.AddressofOffice,
                                  Landmark: widget.Landmark,
                                  NameofOffice: widget.NameofOffice,
                                  NameofPerson: widget.NameofPerson,
                                  typeOfPerson: widget.typeofPerson,
                                ))),
                    child: Container(
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xff392850), width: 3.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.people_alt_sharp,
                                  color: Colors.black,
                                  size: 25.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                const Text(
                                  "Neighbor Check",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontFamily: 'Calibri',
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.arrow_right_alt_outlined,
                              color: Colors.black,
                              size: 25.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OfficeGeneralComment(
                                    PersonType: widget.typeofPerson,
                                    NameofPerson: widget.NameofPerson,
                                    officeAddress: widget.AddressofOffice,
                                    nearestLandmark: widget.Landmark,
                                    OfficeName: widget.NameofOffice,
                                  )));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xff392850), width: 3.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.comment_sharp,
                                  color: Colors.black,
                                  size: 25.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                const Text(
                                  "General Comments & Outcome",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontFamily: 'Calibri',
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.arrow_right_alt_outlined,
                              color: Colors.black,
                              size: 25.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
