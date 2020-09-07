/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invercapitalapp/src/bloc/pages/home/bloc.dart';

class CenteredMarket extends StatelessWidget {
  final String label;

  const CenteredMarket({Key key, this.label = ''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        return Transform.translate(
          offset: Offset(0, -26),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 40,
                constraints: BoxConstraints(maxWidth: 250),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Stack(alignment: Alignment.center, children: [
                  if (state.reverseGeocodeTask != null) ...[
                    if (state.reverseGeocodeTask.place != null)
                      AutoSizeText(
                        state.reverseGeocodeTask.place.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 10,
                      )
                    else
                      SizedBox(width: 20, child: CupertinoActivityIndicator()),
                  ] else
                    SizedBox(width: 10),
                ]),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 4)
                    ]),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 4,
                    height: 20,
                    color: Colors.white,
                  ),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 4)
                        ]),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

*/
