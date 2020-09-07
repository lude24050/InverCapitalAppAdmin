import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:invercapitalappadmin/src/models/route.dart';
import 'package:invercapitalappadmin/src/utils/latlng_extension.dart';

class RoutingApi {
  RoutingApi._internal();
  static RoutingApi get instance => RoutingApi._internal();

  final dio = Dio();

  Future<List<Route>> calculate(LatLng origin, LatLng destination) async {
    try {
      final response = await this
          .dio
          .get('https://router.hereapi.com/v8/routes', queryParameters: {
        "transportMode": "car",
        "origin": origin.Format(),
        "destination": destination.Format(),
        "return": "summary,polyline",
        "apiKey": "rmoB4viZkvR96QJw_J5OGL8d50cKBJqYe0zeBVoziDY",
        "routingMode": "fast",
        "alternatives": 1,
      });

      return (response.data['routes'] as List)
          .map((e) => Route.fromJson(e))
          .toList();
    } catch (e) {
      return null;
    }
  }
}
