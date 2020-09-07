import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AdviserEvents {}

class LoadListUser extends AdviserEvents {
  LoadListUser();
}

class MarcandoPosicionSocket extends AdviserEvents {
  final LatLng socketLocation;
  MarcandoPosicionSocket(this.socketLocation);
}

class OnMyLocationUpdate extends AdviserEvents {
  final LatLng location;

  OnMyLocationUpdate(this.location);
}

class OnGpsEnabled extends AdviserEvents {
  final bool enabled;

  OnGpsEnabled(this.enabled);
}
