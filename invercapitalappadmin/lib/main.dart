import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invercapitalappadmin/src/bloc/pages/adviser/adviser_bloc.dart';
import 'package:invercapitalappadmin/src/bloc/pages/seguimiento/bloc.dart';
import 'package:invercapitalappadmin/src/pages/Request_permission_page.dart';
import 'package:invercapitalappadmin/src/pages/SplashPageMap.dart';
import 'package:invercapitalappadmin/src/pages/admin/asesorInfo_page.dart';
import 'package:invercapitalappadmin/src/pages/admin/homeAdminPage.dart';
import 'package:invercapitalappadmin/src/pages/admin/seguimiento_page.dart';
import 'package:invercapitalappadmin/src/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AdviserBloc>(
          create: (BuildContext context) => AdviserBloc(),
        ),
        BlocProvider<SeguimientoBloc>(
          create: (BuildContext context) => SeguimientoBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(186, 40, 51,1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
        routes: {
          LoginPage.routeName: (_) => LoginPage(),
          SplashPageMap.routeName: (_) => SplashPageMap(),
          RequestPermissionPage.routeName: (_) => RequestPermissionPage(),
          AsesorInfoPage.routeName: (_) => AsesorInfoPage(),
          HomeAdminPage.routeName: (_) => HomeAdminPage(),
          SeguimientoPage.routeName: (_) => SeguimientoPage(),
        },
      ),
    );
  }
}
