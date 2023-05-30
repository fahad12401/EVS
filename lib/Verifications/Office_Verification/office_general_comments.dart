import 'package:evs/Widgets/Card_Widgets/Office_CustomCard.dart';
import 'package:flutter/material.dart';
import '../../../Widgets/Gps_Widgets/GPS.dart';

class OfficeGeneralComment extends StatefulWidget {
  final String PersonType;
  final String NameofPerson;
  final String officeAddress;
  final String nearestLandmark;
  final String OfficeName;

  const OfficeGeneralComment({
    super.key,
    required this.PersonType,
    required this.NameofPerson,
    required this.officeAddress,
    required this.nearestLandmark,
    required this.OfficeName,
  });

  @override
  State<OfficeGeneralComment> createState() => _OfficeGeneralCommentState();
}

class _OfficeGeneralCommentState extends State<OfficeGeneralComment> {
  GlobalKey<FormState> _CommentformKey = GlobalKey<FormState>();
  TextEditingController commentcontroller = TextEditingController();
  int? selectedoption;
  String? Banklongtitude;
  String? Banklatitude;
  @override
  void dispose() {
    commentcontroller;
    super.dispose();
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
            "General Comments & Outcome of Verification (${widget.PersonType})",
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
                  OfficeCustomCard(
                      NameofOffice: widget.OfficeName,
                      AddressofOffice: widget.officeAddress,
                      NameofPerson: widget.NameofPerson,
                      Landmark: widget.nearestLandmark,
                      typeOfPerson: widget.PersonType),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                    child: Form(
                      key: _CommentformKey,
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
                          const Divider(),
                          const SizedBox(
                            height: 5.0,
                          ),
                          GPSLocation(
                            newLat: Banklatitude,
                            newLong: Banklongtitude,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15.0,
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
                            onPressed: () {},
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Calibri',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
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
