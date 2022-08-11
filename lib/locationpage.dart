/*
 * Test already sucessful! 
 * 
 */

import 'package:data_connected/main.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'util.dart';

class Locationpage extends StatefulWidget {
  const Locationpage({Key? key}) : super(key: key);

  @override
  State<Locationpage> createState() => _LocationpageState();
}

class _LocationpageState extends State<Locationpage> {
  double _latitude = 0;
  double _longtitude = 0;
  var _altitude = "";
  var _speed = "";
  var _address = "";

  void _compareDistance() async {
    //need transfer the merhcant location data to here
    var merchantLatitude = -42.900261666666665;
    var merchantLongtitude = 147.32494333333332;

    await _updatePosition();

    var distance = Geolocator.distanceBetween(
            merchantLatitude, merchantLongtitude, _latitude, _longtitude) /
        1000;

    if (distance < 0.035 && distance > -0.35) {
      debug_print("arrived and get the order in queue!");
    } else {
      showAlert(context, "NOTICE");
    }
  }

  Future<void> _updatePosition() async {
    Position pos = await _determinePosition();
    List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState(() {
      _latitude = pos.latitude;
      _longtitude = pos.longitude;
      _altitude = pos.altitude.toString();
      _speed = pos.speed.toString();

      _address = pm[0].toString();
    });
  }

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service are disabled!');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions!');
    }
    return await Geolocator.getCurrentPosition();
    //Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
  }

  @override
  void initState() {
    super.initState();
    _compareDistance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Your last know location is: '),
            Text(
              "Latitude: " + _latitude.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Longtitude: " + _longtitude.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Altitude: " + _altitude,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Latitude: " + _latitude.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Speed " + _speed,
              style: Theme.of(context).textTheme.headline5,
            ),
            const Text('Address: '),
            Text(_address),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _compareDistance,
        tooltip: 'Get GPS position',
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }

  Future<dynamic> showAlert(BuildContext context, String s) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return alertWindow(context, s);
        });
  }

  AlertDialog alertWindow(BuildContext context, String s) {
    String str = "You are not arrived";

    return AlertDialog(
      title: Text(s),
      content: Text(str),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const MyApp()))
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
