import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashPageMap extends StatefulWidget {
  static const routeName = 'splash-page';
  @override
  _SplashPageMapState createState() => _SplashPageMapState();
}

class _SplashPageMapState extends State<SplashPageMap>
    with AfterLayoutMixin<SplashPageMap> {
  @override
  void afterFirstLayout(BuildContext context) {
    this._check();
  }

  _check() async {
    final bool hasAccess = await Permission.locationWhenInUse.isGranted;
    if (hasAccess) {
      Navigator.pushNamed(context, 'login-page');
    } else {
      Navigator.pushNamed(context, 'requestPermission-page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
