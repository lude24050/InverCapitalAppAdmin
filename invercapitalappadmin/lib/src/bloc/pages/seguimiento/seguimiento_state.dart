import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:invercapitalappadmin/src/models/user.dart';

class SeguimientoState extends Equatable {
  final List<User> user;
  final bool loading, gpsEnabled;
  final Map<MarkerId, Marker> markers;
  final LatLng locationAdviser, myLocation;

  SeguimientoState(
      {this.gpsEnabled,
      this.myLocation,
      this.user,
      this.loading,
      this.markers,
      this.locationAdviser});

  static SeguimientoState get initialState => new SeguimientoState(
      user: List(),
      loading: true,
      markers: Map(),
      locationAdviser:null,
      myLocation: null,
      gpsEnabled: true);

  SeguimientoState copyWith({
    LatLng locationAdviser,
    LatLng myLocation,
    bool gpsEnabled,
    bool loading,
    List user,
    Map<MarkerId, Marker> markers,
  }) {
    return SeguimientoState(
        myLocation: myLocation ?? this.myLocation,
        gpsEnabled: gpsEnabled ?? this.gpsEnabled,
        loading: loading ?? this.loading,
        markers: markers ?? this.markers,
        user: user ?? this.user,
        locationAdviser: locationAdviser ?? this.locationAdviser);
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [user, loading, markers, locationAdviser, myLocation, gpsEnabled];
}
