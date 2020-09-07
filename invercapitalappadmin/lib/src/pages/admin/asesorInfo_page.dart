import 'package:flutter/material.dart';
import 'package:invercapitalappadmin/src/models/user.dart';
import 'package:invercapitalappadmin/src/styles/style.dart';

class AsesorInfoPage extends StatefulWidget {
  AsesorInfoPage({Key key}) : super(key: key);
  static const routeName = 'asesorInfo-page';
  @override
  _AsesorInfoPageState createState() => _AsesorInfoPageState();
}

class _AsesorInfoPageState extends State<AsesorInfoPage> {
  bool _estado = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final User dataUser = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion de Socio'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          width: size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black)
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/Avatar/socio.jpeg'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${dataUser.name}',
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('Nombre:'),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text('${dataUser.name} ${dataUser.lastName}'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('Codigo:'),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text('${dataUser.dni}'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('Estado'),
                        ),
                        Flexible(
                          flex: 5,
                          child: Switch(
                            value: _estado,
                            onChanged: (bool value) {
                              setState(() {
                                _estado = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          child: Text('Seguimiento'),
                          color: Buttons.secondary,
                          onPressed: () {
                            Navigator.pushNamed(context, 'seguimiento-page');
                          },
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        RaisedButton(
                          child: Text('Editar'),
                          color: Buttons.secondary,
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
