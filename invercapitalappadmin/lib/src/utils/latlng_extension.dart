import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

extension LatLngString on LatLng {
  String Format(){
    return "${this.latitude},${this.longitude}";
  }
}