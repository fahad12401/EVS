import 'dart:async';
import 'dart:io';
import 'package:evs/Widgets/Logs/Gmailsender.dart';
import 'package:evs/Widgets/Logs/Logeger.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import '../../Module for Get Data/Login_response.dart';

class EVSLoggerEmail {
  BuildContext context;
  EVSLoggerEmail(
    this.context,
  );

  Future<void> showEmailDialog() async {
    String logs = await readLogFile();

    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('EVS Logs',
            style: TextStyle(
              fontFamily: 'Calibri',
            )),
        content: SingleChildScrollView(
            child: Text(
          "${logs.toString()}",
          style: TextStyle(fontFamily: 'Calibri'),
        )),
        actions: [
          TextButton(
            child: Text(
              'EMAIL LOGS',
              style: TextStyle(fontFamily: 'Calibri'),
            ),
            onPressed: () async {
              await sendEmail(await logs.toString());
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> sendEmail(String body) async {
    String appVersion = await getAppVersion();
    try {
      GMailSender sender =
          GMailSender('icilpakistan.ho@gmail.com', 'apcfnhsuvlrtfxmi', context);
      sender.sendMail(
          "EVS LOG from AppVersion:" +
              appVersion +
              "  Username=" +
              GetUsername() +
              "   UserID=" +
              GetUserID() +
              "   TABLET",
          body,
          'icilpakistan.ho@gmail.com',
          'shahzaib@iciltek.com');
    } on IOException catch (e) {
      EVSLogger.appendLog(
          "EVSLogger- IOException  SentEmail():  " + e.toString() + "");
    } on OutOfMemoryError catch (e) {
      EVSLogger.appendLog(
          "EVSLogger- RuntimeException  SentEmail():  " + e.toString() + "");
    } on Exception catch (e) {
      EVSLogger.appendLog(
          "EVSLogger- Exception SentEmail():  " + e.toString() + "");

      throw e;
    }
  }

  Future<String> readLogFile() async {
    Directory? directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/logs.txt');
    String contents = '';

    try {
      if (await file.exists()) {
        contents = await file.readAsString();
      } else {
        EVSLogger.appendLog("The Log file doesn't Exist");
      }
    } catch (e) {
      EVSLogger.appendLog(
          'EVSLogger- Exception readLogFile(): ${e.toString()}');
    }
    return contents.toString();
  }
}

String GetUsername() {
  String username = loginresponse.user!.userName.toString();
  return username;
}

String GetUserID() {
  String userid = loginresponse.user!.id.toString();
  return userid;
}

Future<String> getAppVersion() async {
  String result = '';
  try {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (packageInfo.version != null && packageInfo.version.isNotEmpty) {
      result = packageInfo.version;
    }
  } catch (e) {
    print(e.toString());
  }
  return result.toString();
}

void showSnck(BuildContext context, text, Color clr) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 5),
      backgroundColor: clr,
      content: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontFamily: 'Calibri', fontSize: 22.0),
      )));
}
