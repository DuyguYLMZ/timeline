import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  final Function onPressed;
  final Color fillColor;


  const AddButtonWidget({Key key, this.onPressed, this.fillColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 50.0,
    height: 50.0,

    child: new RawMaterialButton(
    shape: new CircleBorder(
    ),
    elevation: 0.5,
      fillColor: fillColor,
    child: Icon(
    Icons.add,
      color: Colors.white,
    ),
    onPressed: onPressed
    ));
  }
}