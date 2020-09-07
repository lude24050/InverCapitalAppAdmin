import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class SeguimientoEvents {}

class LoadListUser extends SeguimientoEvents {
  LoadListUser();
}

class MarcandoPosicionSocket extends SeguimientoEvents {
  final LatLng socketLocation;
  MarcandoPosicionSocket(this.socketLocation);
}

class OnMyLocationUpdate extends SeguimientoEvents {
  final LatLng location;

  OnMyLocationUpdate(this.location);
}

class OnGpsEnabled extends SeguimientoEvents {
  final bool enabled;

  OnGpsEnabled(this.enabled);
}
