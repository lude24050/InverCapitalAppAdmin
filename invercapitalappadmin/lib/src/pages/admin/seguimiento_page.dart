import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:invercapitalappadmin/src/bloc/pages/adviser/bloc.dart';
import 'package:invercapitalappadmin/src/bloc/pages/seguimiento/bloc.dart';
import 'package:invercapitalappadmin/src/utils/socket_client.dart';

class SeguimientoPage extends StatefulWidget {
  SeguimientoPage({Key key}) : super(key: key);

  static const routeName = 'seguimiento-page';
  @override
  _SeguimientoPageState createState() => _SeguimientoPageState();
}

class _SeguimientoPageState extends State<SeguimientoPage> {
  SeguimientoBloc _seguimientoBloc = SeguimientoBloc();

  @override
  void initState() {
    SocketClient.instance.connect(context);
    super.initState();
  }
  @override
  void dispose() {
    SocketClient.instance.disconnect();
    _seguimientoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SeguimientoBloc, SeguimientoState>(
          builder: (BuildContext context, state) {
        print('mi laoding ${state.loading}');
        print('mi markers ${state.markers}');
        if (state.loading) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        }
        print("mi location seguimeinto :${state.myLocation}");
        print('mi location adviser ${state.locationAdviser}');
          final CameraPosition initialPosition = CameraPosition(
            target: state.myLocation,
            zoom: 15,
          );
          return Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GoogleMap(
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      mapType: MapType.normal,
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                      markers: state.markers.values.toSet(),
                      initialCameraPosition: initialPosition,
                      onMapCreated: (GoogleMapController controller) {
                        this._seguimientoBloc.setMapController(controller);
                      },
                    ),
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: FloatingActionButton(
                        onPressed: () => _seguimientoBloc.goToMyPosition(),
                        child: Icon(
                          Icons.gps_fixed,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
      });
  }
}
