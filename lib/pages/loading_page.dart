import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:map/helpers/helpers.dart';
import 'package:map/pages/access_gps_page.dart';
import 'package:map/pages/map_page.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Geolocator.isLocationServiceEnabled()) {
        Navigator.pushReplacement(
            context, navigatorMapFadeIn(context, MapPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGpsLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          );
        },
      ),
    );
  }

  Future checkGpsLocation(BuildContext context) async {
    final premissGps = await Permission.location.isGranted;
    final gpsActive = await Geolocator.isLocationServiceEnabled();
    if (premissGps && gpsActive) {
      Navigator.pushReplacement(
          context, navigatorMapFadeIn(context, MapPage()));
      return '';
    } else if (!premissGps) {
      Navigator.pushReplacement(
          context, navigatorMapFadeIn(context, AccessGpsPage()));
      return 'Es necesario el permiso de GPS';
    } else {
      return 'Active el GPS';
    }

    // Navigator.pushReplacement(
    //     context, navigatorMapFadeIn(context, AccessGpsPage()));
    // Navigator.pushReplacement(context, navigatorMapFadeIn(context, MapPage()));
  }
}
