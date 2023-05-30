import 'package:evs/Widgets/Gps_Widgets/gps_loc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GPSLocation extends StatefulWidget {
  GPSLocation({super.key, this.newLat, this.newLong});
  String? newLat;
  String? newLong;

  @override
  State<GPSLocation> createState() => _GPSLocationState();
}

class _GPSLocationState extends State<GPSLocation> {
  checkGPS() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print("GPS service is Disabled");
        }
      } else if (permission == LocationPermission.deniedForever) {
        print("GPS service is Permanently  Disabled");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "GPS service is Permanently  Disabled",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          duration: Duration(seconds: 4),
          backgroundColor: Colors.red,
        ));
      } else {
        haspermission = true;
      }
    } else {
      haspermission = true;
    }
    if (haspermission) {
      getlocation();
    } else {
      print("GPS Service is not enabled, turn on GPS location");
      showalertdialog(
          context, "GPS Service is not enabled, turn on GPS location");
    }
  }

  getlocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);

    LocationSettings locationSettings =
        LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 100);
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      print(position.latitude);
      print(position.longitude);

      setState(() {
        widget.newLong = position.longitude.toString();
        widget.newLat = position.latitude.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("GPS Location:",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 24.0,
                fontFamily: 'Calibri')),
        Text("Latitude: ${widget.newLat} \nLongtitude : ${widget.newLong}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontFamily: 'Calibri',
            )),
        const SizedBox(
          height: 3.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                height: 40,
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff392850)),
                    onPressed: () {
                      checkGPS();
                    },
                    child: Text("Get",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Calibri')))),
          ],
        ),
      ],
    );
  }
}
