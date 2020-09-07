import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:invercapitalappadmin/src/utils/ProgressDialog.dart';

class AuthApi {
  AuthApi._internal();
  static AuthApi get instance => AuthApi._internal();

  final Dio dio = Dio();

  Future<void> login(
      String username, String password, BuildContext context) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      var datos = {"username": username, "password": password};

      var data = json.encode(datos);

      progressDialog.show();
      final response = await this.dio.post(
        "https://invercapitalbackend.herokuapp.com/user/login",
        data: {"username": username, "password": password},
      );
      if (response.statusCode == 200) {
        print(response.data);
      }
      progressDialog.dismiss();

      Navigator.pushNamedAndRemoveUntil(context, 'homeAdmin-page', (route) => false);
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print("error en login ${e.response.data}");
        Dialogs.info(
          context,
          title: 'Error',
          content: e.response.data['message'],
        );
      } else {
        print(e);
      }
    }
  }
}
