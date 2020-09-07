import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:invercapitalappadmin/src/bloc/pages/seguimiento/bloc.dart';
import 'package:invercapitalappadmin/src/bloc/pages/seguimiento/seguimiento_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_bloc/flutter_bloc.dart';

class SocketClient {

  SocketClient._internal();
  static SocketClient _instance = SocketClient._internal();
  static SocketClient get instance => _instance;

  IO.Socket _socket;
  SeguimientoBloc _seguimientoBloc = SeguimientoBloc();



  connect(BuildContext context) {
    final SeguimientoBloc counterBloc = context.bloc<SeguimientoBloc>();
    this._socket =
        IO.io('https://invercapitalbackend.herokuapp.com/', <String, dynamic>{
      'transports': ['websocket'],
    });
    this._socket.on('connect', (data) {

      print('🎃 connected');

    });
    this._socket.on('connect_error', (data) {
      print('🎃 connect_error $data');
    });
    this._socket.on('error', (data) {
      print('🎃 error $data');
    });
    this._socket.on('disconnect', (data) {
      print('🎃 disconnect $data');
    });
    this._socket.on('push-location', (data) {
      final LatLng posi = LatLng(data["latitud"], data["longitud"]);
      print(posi);
      counterBloc.add(MarcandoPosicionSocket(posi));
    });
  }


  disconnect() {
    if (this._socket != null) {
      this._socket.disconnect();
      this._socket = null;
    }
  }
}
