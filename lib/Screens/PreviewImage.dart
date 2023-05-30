import 'dart:io';
import 'package:flutter/material.dart';

class PreviewImage extends StatelessWidget {
  PreviewImage({super.key, required this.capimages});
  final File? capimages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xff392850),
        title: Text(
          "Image",
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
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (BuildContext ctx, index) {
                      if (capimages != null)
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: double.infinity,
                            height: 500.0,
                            margin: EdgeInsets.all(10.0),
                            child: Image.file(capimages!),
                          ),
                        );
                      else {
                        return Center(
                          child: Text(
                            "Capture Image First",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              fontFamily: 'Calibri',
                            ),
                          ),
                        );
                      }
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: 130.0,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
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
                          width: 130.0,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
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
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
