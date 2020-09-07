import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invercapitalappadmin/src/Widgets/circle.dart';
import 'package:invercapitalappadmin/src/Widgets/icon_container.dart';
import 'package:invercapitalappadmin/src/Widgets/login_form.dart';
import 'package:invercapitalappadmin/src/utils/responsive.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsive.wp(57);
    return  Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: -pinkSize * 0.4,
                  right: -pinkSize * 0.2,
                  child: Circle(
                    size: pinkSize,
                      colors:  Color.fromRGBO(186, 40, 51,1)
                  ),
                ),
                Positioned(
                  top: -orangeSize * 0.55,
                  left: -orangeSize * 0.15,
                  child: Circle(
                    size: orangeSize,
                    colors: Color.fromRGBO(32, 93, 124,1)
                  ),
                ),
                Positioned(
                  top: pinkSize * 0.35,
                  child: Column(
                    children: <Widget>[
                      IconContainer(
                        size: responsive.wp(30),
                      ),
                      SizedBox(
                        height: responsive.dp(3),
                      ),
                      Text(
                        "Hello Again\nWelcome Back!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: responsive.dp(1.6),
                        ),
                      )
                    ],
                  ),
                ),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
onPressed: () async {
                          print("$_username $_password");
                          //await _authApi.login(_username,_password,context);
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'homeAdmin-page', (route) => false);
                        },
 */