import 'package:evs/Verifications/Residence_Verification/Applicant/Applicant_Neighbor_verification.dart';
import 'package:evs/Verifications/Residence_Verification/Applicant/Applicant_Profile_verification.dart';
import 'package:evs/Verifications/Residence_Verification/Applicant/Applicant_generalcomments.dart';

import 'package:flutter/material.dart';

import '../../../Module for Get Data/Inquires_response.dart';
import '../../../Widgets/Card_Widgets/Residence_customcard.dart';
import 'Applicant_Home_verification.dart';

class ApplicantResidenceverifiy extends StatefulWidget {
  ApplicantResidenceverifiy(
      {super.key,
      this.residenceVerified,
      required this.PersonType,
      required this.residenceAddress,
      required this.nearestLandmark,
      required this.NameofPerson,
      required this.verifucationID,
      required this.InquiryId});
  final List<ResidenceVerifications>? residenceVerified;
  final String PersonType;
  final String NameofPerson;
  final String residenceAddress;
  final String nearestLandmark;
  final int verifucationID;
  final int InquiryId;
  @override
  State<ApplicantResidenceverifiy> createState() =>
      _ApplicantResidenceverifiyState();
}

class _ApplicantResidenceverifiyState extends State<ApplicantResidenceverifiy> {
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
          children: [
            Residence_CustomCard(
                TypeofPerson: widget.PersonType,
                Name: widget.NameofPerson,
                Address: widget.residenceAddress,
                Landmark: widget.nearestLandmark),
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
                            builder: (context) => ApplicantHomeverification(
                                  ApplicantHomeVerified:
                                      widget.residenceVerified,
                                  NameofPerson: widget.NameofPerson,
                                  PersonType: widget.PersonType,
                                  nearestLandmark: widget.nearestLandmark,
                                  residenceAddress: widget.residenceAddress,
                                  resVerId: widget.verifucationID,
                                  Inquiryid: widget.InquiryId,
                                ))),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
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
                                  "Residence Verification",
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
                            builder: (context) => ApplicantResidenceProfile(
                                  ApplicantProfileVerified:
                                      widget.residenceVerified,
                                  NameofPerson: widget.NameofPerson,
                                  nearestLandmark: widget.nearestLandmark,
                                  PersonType: widget.PersonType,
                                  residenceAddress: widget.residenceAddress,
                                  resVerID: widget.verifucationID,
                                ))),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
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
                                  Icons.person_sharp,
                                  color: Colors.black,
                                  size: 25.0,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                const Text(
                                  "Residence Profile",
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
                            builder: (context) => ApplicantResidenceNeighbor(
                                  ApplicantNeighbourVerified:
                                      widget.residenceVerified,
                                  NameofPerson: widget.NameofPerson,
                                  PersonType: widget.PersonType,
                                  nearestLandmark: widget.nearestLandmark,
                                  residenceAddress: widget.residenceAddress,
                                  resVerID: widget.verifucationID,
                                ))),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
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
                                const SizedBox(
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
                              builder: (context) => ResidenceGeneralComment(
                                    Persontype: widget.PersonType,
                                    PersonName: widget.NameofPerson,
                                    Landmark: widget.nearestLandmark,
                                    PersonAddress: widget.residenceAddress,
                                    resVerid: widget.verifucationID,
                                  )));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
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
                                const SizedBox(
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
