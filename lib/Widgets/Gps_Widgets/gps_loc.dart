import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

bool servicestatus = false;
bool haspermission = false;
late LocationPermission permission;
late Position position;
String long = " ";
String lat = " ";
late StreamSubscription<Position> positionStream;
bool isdownloading = false;

showalertdialog(BuildContext context, String text) {
  Widget okButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("Ok"));
  AlertDialog alertDialog = AlertDialog(
    title: Text("Warning!"),
    content: Text(text),
    actions: [okButton],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
