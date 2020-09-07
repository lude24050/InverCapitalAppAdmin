import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invercapitalappadmin/src/api/user_api.dart';
import 'package:invercapitalappadmin/src/bloc/pages/seguimiento/bloc.dart';
import 'package:invercapitalappadmin/src/models/user.dart';
import 'package:invercapitalappadmin/src/utils/extras.dart';
import 'package:invercapitalappadmin/src/utils/socket_client.dart';
import 'package:location_permissions/location_permissions.dart';

class SeguimientoBloc extends Bloc<SeguimientoEvents, SeguimientoState> {
  UserApi _partnerApi = UserApi.instance;
  final Completer<Marker> _myPositionMarker = Completer();
  Geolocator _geolocator = Geolocator();
  final LocationPermissions _locationPermissions = LocationPermissions();
  Completer<GoogleMapController> _completer = Completer();

  final LocationOptions _locationOptions = LocationOptions(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );

  StreamSubscription<Position> _subscription;
  StreamSubscription<ServiceStatus> _subscriptionGpsStatus;

  SeguimientoBloc() {
    this._init();
  }

  @override
  Future<void> close() async {
    _subscription?.cancel();
    _subscriptionGpsStatus?.cancel();

    super.close();
  }

  _init() async {
    this._loadCarPin();

    _subscription = _geolocator.getPositionStream(_locationOptions).listen(
          (Position position) async {
        if (position != null) {
          final newPosition = LatLng(position.latitude, position.longitude);
          add(OnMyLocationUpdate(newPosition,),);
        }
      },
    );
  }

  void setMapController(GoogleMapController controller) {
    if (_completer.isCompleted) {
      _completer = Completer();
    }
    _completer.complete(controller);
  }

  Future<GoogleMapController> get mapController async {
    return await _completer.future;
  }

  _loadCarPin() async {
    final Uint8List bytes =
        await loadAsset('assets/marker/car-pin.png', width: 40);
    final marker = Marker(
      markerId: MarkerId('my_position_marker'),
      icon: BitmapDescriptor.fromBytes(bytes),
      anchor: Offset(0.5, 0.5),
    );
    this._myPositionMarker.complete(marker);
  }

  @override
  Stream<SeguimientoState> mapEventToState(SeguimientoEvents event) async* {
    if (event is MarcandoPosicionSocket) {
      yield* this._mapLocationSocket(event);
    } else if (event is OnMyLocationUpdate) {
      yield* this._mapOnMyLocationUpdate(event);
    } else if (event is OnGpsEnabled) {
      yield this.state.copyWith(gpsEnabled: event.enabled);
    }
  }

  Stream<SeguimientoState> _mapOnMyLocationUpdate(OnMyLocationUpdate event) async* {

    if (this.state.myLocation == null) {
      yield this.state.copyWith(
            loading: false,
            myLocation: event.location,
          );
    } else {
      yield this.state.copyWith(
            myLocation: event.location,

          );
    }
  }
  goToMyPosition() async {
    if (this.state.myLocation != null) {
      final CameraUpdate cameraUpdate =
          CameraUpdate.newLatLng(this.state.locationAdviser);
      await (await mapController).animateCamera(cameraUpdate);
    }
  }

  Stream<SeguimientoState> _mapLocationSocket(MarcandoPosicionSocket event) async* {
    final markers = Map<MarkerId, Marker>.from(this.state.markers);

    double rotation = 0;
    LatLng lastPosition = this.state.locationAdviser;
    if (lastPosition != null) {
      rotation = getCoordsRotation(event.socketLocation, lastPosition);
    }

    final Marker myPositionMarker =
    (await this._myPositionMarker.future).copyWith(
      positionParam: event.socketLocation,
      rotationParam: rotation,
    );

    markers[myPositionMarker.markerId] = myPositionMarker;

    if (this.state.locationAdviser == null) {
      yield this.state.copyWith(
        locationAdviser: event.socketLocation,
        markers: markers
      );
      print('hjaceindo socket event : ${event.socketLocation}');
    } else {
      yield this.state.copyWith(
        locationAdviser: event.socketLocation,
          markers: markers
      );
      print('hjaceindo socket event : ${event.socketLocation}');
    }

  }

  @override
  // TODO: implement initialState
  SeguimientoState get initialState => SeguimientoState.initialState;
}
