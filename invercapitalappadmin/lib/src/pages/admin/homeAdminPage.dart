import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invercapitalappadmin/src/bloc/pages/adviser/bloc.dart';

class HomeAdminPage extends StatefulWidget {
  HomeAdminPage({Key key}) : super(key: key);
  static const routeName = 'homeAdmin-page';
  @override
  _HomeAdminPageState createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  final AdviserBloc _partnerBloc = AdviserBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _partnerBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Asesores'),
          actions: [
            PopupMenuButton(
              onSelected: (result) {
                switch (result) {
                  case 'perfil':
                    {
                      print('vamos al perfil');
                    }
                    break;

                  case 'estado':
                    {
                      print('vamos al estado');
                    }
                    break;

                  case 'addSocio':
                    {
                      Navigator.pushNamed(context, 'addSocio-page');
                    }
                    break;
                }
              },
              icon: Icon(Icons.menu),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  value: 'perfil',
                  child: Text('Perfil'),
                ),
                PopupMenuItem(
                  value: 'estado',
                  child: Text('Estado'),
                ),
                PopupMenuItem(
                  value: 'addSocio',
                  child: Text('Agregar Socio'),
                ),
              ],
            )
          ],
        ),
        body: Container(child: BlocBuilder<AdviserBloc, AdviserState>(
          builder: (_, state) {
            if (state.loading == true) {
              return CircularProgressIndicator();
            }
            return RefreshIndicator(
              onRefresh: () async {
                _partnerBloc.add(LoadListUser());
              },
              child: ListView.builder(
                itemCount: state.user.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('${state.user[index].name}'),
                    subtitle: Text('${state.user[index].dni}'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.pushNamed(context, 'asesorInfo-page',
                          arguments: state.user[index]);
                    },
                  );
                },
              ),
            );
          },
        )),
      ),
    );
  }
}
