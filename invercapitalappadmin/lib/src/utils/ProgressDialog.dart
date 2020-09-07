import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Dialogs {
  static info(BuildContext context,{String title, String content}){
    showDialog(
        context: context,
      builder: (_) => CupertinoAlertDialog(
        title: title !=null ? Text(title): null,
        content: content !=null ? Text(content): null,
        actions: [
          CupertinoDialogAction(
            child: Text('Ok'),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}

class ProgressDialog {
  final BuildContext context;
  ProgressDialog(this.context);

  void show(){
    showCupertinoDialog(
        context: this.context,
        builder: (_) => Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
    );
  }

  void dismiss(){
    Navigator.pop(context);
  }
}