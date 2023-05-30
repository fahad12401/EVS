import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

class MyDialog {
  static Future<void> show(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Set to false if you want to prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            message,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Calibri',
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
        );
      },
    ).then((value) => null); // use .then to dismiss dialog box
  }
}

// // To call the dialog:
// MyDialog.show(context, "Hello, World!");

// // To show dialog for 2 seconds:
// Future.delayed(Duration(seconds: 2), () {
//   Navigator.of(context, rootNavigator: true).pop();
// });

class TextFileViewer extends StatelessWidget {
  const TextFileViewer({super.key, required this.filePath});
  final String filePath;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Logs"),
      content: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: File(filePath).readAsString(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error loading file');
                  }
                  return Text(snapshot.data ?? '');
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text("Close"))
      ],
    );
  }
}
