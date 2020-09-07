import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionPage extends StatefulWidget {
  static const routeName = 'requestPermission-page';
  @override
  _RequestPermissionPageState createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage>
    with WidgetsBindingObserver {
  bool _fromSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('AppLifecycleState :::::: $state');

    if (state == AppLifecycleState.resumed && _fromSettings) {
      this._check();
    }
  }

  _check() async {
    final bool hasAccess = await Permission.locationWhenInUse.isGranted;
    if (hasAccess) {
      this._goToHome();
    }
  }

  _goToHome() {
    Navigator.pushNamed(context, 'login-page');
  }

  Future<void> _request() async {
    final PermissionStatus status =
        await Permission.locationWhenInUse.request();

    print("status: $status");

    switch (status) {
      case PermissionStatus.undetermined:
        break;
      case PermissionStatus.granted:
        this._goToHome();
        break;
      case PermissionStatus.denied:
        break;
      case PermissionStatus.restricted:
        break;
      case PermissionStatus.permanentlyDenied:
        await openAppSettings();
        _fromSettings = true;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'PERMISO REQUERIDO',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Necesitamos permisos para poder acceder a tu ubicacion',
              style: TextStyle(fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
          FlatButton(
            child: Text(
              'PERMITIR',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: this._request,
          )
        ],
      ),
    ));
  }
}
