import 'package:evs/Database/Database_Helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Module for Get Data/Inquires_response.dart';
import 'assigned_inq_screen.dart';

class InquiresScreen extends StatefulWidget {
  InquiresScreen({
    super.key,
  });

  @override
  State<InquiresScreen> createState() => _InquiresScreenState();
}

class _InquiresScreenState extends State<InquiresScreen> {
  TextEditingController searchcontroller = TextEditingController();
  String SearchQuery = '';

  moveIndex(List<Data> data, int index) {
    if (index >= 0 && index < data.length) {
      Data selectedData = data[index];

      if (selectedData.islongPressed) {
        // Move the item to its original index
        int originalIndex = selectedData.orignalIndex!;
        data.removeAt(index);
        data.insert(originalIndex, selectedData);
        selectedData.islongPressed = false;
        selectedData.orignalIndex = null;
      } else {
        // Move the item to the first index

        setState(() {
          selectedData.islongPressed = true;
          data.removeAt(index);
          data.insert(0, selectedData);
          selectedData.orignalIndex = index;
        });
        if (searchResult.contains(selectedData)) {
          setState(() {
            searchResult.remove(selectedData);
            searchResult.insert(0, selectedData);
          });
        }
      }
    }
  }

  @override
  void dispose() {
    searchcontroller.dispose();
    super.dispose();
  }

  List<Data> filterData(List<Data> data, String Query) {
    if (Query.isEmpty) {
      return data;
    } else {
      return data
          .where((element) =>
              element.AppName!.toLowerCase().contains(Query.toLowerCase()) ||
              element.AppCNIC!.toLowerCase().contains(Query.toLowerCase()) ||
              element.AppContact!.toLowerCase().contains(Query.toLowerCase()) ||
              element.ProductName!
                  .toLowerCase()
                  .contains(Query.toLowerCase()) ||
              element.CompanyName!.toLowerCase().contains(Query.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
          backgroundColor: Colors.white60,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff392850),
            toolbarHeight: 150.0,
            centerTitle: true,
            title: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "I N Q U I R I E S",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        fontFamily: 'Calibri'),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                    child: TextField(
                        controller: searchcontroller,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Calibri'),
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0)),
                            hintText: "Search",
                            hintStyle: TextStyle(
                                fontFamily: 'Calibri', color: Colors.white),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        onChanged: (value) {
                          setState(() {
                            SearchQuery = value;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          body: WillPopScope(
            onWillPop: () async {
              Navigator.pop(context);
              return true;
            },
            child: FutureBuilder(
                future: DBHelper.DataResponse(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
                  if (snapshot.hasData) {
                    searchResult = filterData(snapshot.data!, SearchQuery);
                  } else {
                    searchResult = [];
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.data == null) {
                    return Text(
                      "There is No Data",
                      style: TextStyle(
                          fontFamily: 'Calibri',
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: searchResult.length,
                          itemBuilder: (context, int index) {
                            return GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  moveIndex(searchResult, index);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          duration: Duration(seconds: 3),
                                          backgroundColor: Colors.deepPurple,
                                          content: Text(
                                            "Added to Top",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Calibri',
                                                fontSize: 20.0),
                                          )));
                                });
                              },
                              child: InkWell(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5.0, right: 5.0, top: 0.0),
                                  child: Card(
                                    elevation: 3.0,
                                    child: Container(
                                      height: 230.0,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 11.0,
                                          right: 5.0,
                                          top: 9.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Company Name: ",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Calibri',
                                                          fontSize: 20.0),
                                                    ),
                                                    Text(
                                                      "${searchResult[index].CompanyName}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Calibri',
                                                          fontSize: 20.0),
                                                    ),
                                                  ],
                                                ),
                                                // Icon(
                                                //   Icons.push_pin,
                                                //   color: searchResult[index]
                                                //               .islongPressed &&
                                                //           searchResult[index]
                                                //                   .orignalIndex ==
                                                //               null
                                                //       ? Colors.green
                                                //       : null,
                                                // )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Product Name:   ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Calibri',
                                                      fontSize: 20.0),
                                                ),
                                                Text(
                                                  "${searchResult[index].ProductName}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Calibri',
                                                      fontSize: 20.0),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            if (searchResult[index].AppNo ==
                                                null)
                                              Text(
                                                "Applicant No:      NA",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Calibri',
                                                    fontSize: 20.0),
                                              )
                                            else
                                              Text(
                                                "Applicant No:      ${searchResult[index].AppNo}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Calibri',
                                                    fontSize: 20.0),
                                              ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "Applicant Name:   ${searchResult[index].AppName}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Calibri',
                                                  fontSize: 20.0),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "Applicant CNIC:    ${searchResult[index].AppCNIC}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Calibri',
                                                  fontSize: 20.0),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "Applicant ContactNo:  ${searchResult[index].AppContact}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Calibri',
                                                  fontSize: 20.0),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Status:   ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Calibri',
                                                      fontSize: 20.0),
                                                ),
                                                Text(
                                                  "",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Calibri',
                                                      fontSize: 20.0),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AssignedInquiries(
                                                residenceVerify:
                                                    searchResult[index]
                                                        .residenceVerifications,
                                                Officeverification:
                                                    searchResult[index]
                                                        .workOfficeVerifications,
                                                tenantverification:
                                                    searchResult[index]
                                                        .tenantVerifications,
                                                salaryslipverification:
                                                    searchResult[index]
                                                        .salarySlipVerifications,
                                                bankverification: searchResult[
                                                        index]
                                                    .bankStatementVerifications,
                                              )));
                                },
                              ),
                            );
                          }),
                    );
                  }
                }),
          ));
    } on Exception catch (e) {
      throw e;
    }
  }
}
