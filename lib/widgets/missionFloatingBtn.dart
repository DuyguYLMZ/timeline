import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';

class MissionFloatingBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: true ? Icon(Icons.edit) : Icon(Icons.close),
      splashColor: btnColor,
      onPressed: () {
       /*   if (isFinished) {
            isFinished = false;
          } else {
            isFinished = true;
          }*/
          (context as Element).markNeedsBuild();
      },
    );
  }
}
