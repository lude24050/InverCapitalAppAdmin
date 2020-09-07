import 'package:dio/dio.dart';
import 'package:invercapitalappadmin/src/models/user.dart';

class UserApi {
  UserApi._internal();
  static UserApi get instance => UserApi._internal();

  final Dio dio = Dio();
  List<User> data;

  Future<List<User>> getUser() async {
    try {
      final response = await this.dio.get(
            "https://invercapitalbackend.herokuapp.com/user/user",
          );
      data = (response.data as List).map((e) => User.fromJson(e)).toList();

      print(data.length);
      return data;
    } catch (e) {
      print("mi error en obtener data user:  $e");
    }
  }
}

/*
 Future<void> createPartner(
    BuildContext context, {
    @required String name,
    @required String lastName,
    @required String code,
    @required String phone,
    @required String codeContrat,
    @required String location,
    @required String latitude,
    @required String longitude,
  }) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      var datos = {
        "name": name,
        "lastName": lastName,
        "code": code,
        "phone": phone,
        "code_contract": codeContrat,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
      };

      var data = json.encode(datos);

      progressDialog.show();
      final response = await this.dio.post(
            "http://192.168.1.7:5000/partner/createPartner",
            data: data,
          );
      //_partnerBloc.add(addListPartner());
      progressDialog.dismiss();
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print(e.response.data);
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

*/
