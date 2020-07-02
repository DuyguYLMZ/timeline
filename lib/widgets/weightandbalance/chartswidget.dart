import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/strings.dart';
import 'package:tablet_app/values/theme.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[NavigaitonChartsWidget(),  Divider(color: grey, height: 25.0), GeneralChartsWidget()],
    );
  }

  NavigaitonChartsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(Strings.NAVIGATION_CHARTS, style: defaultWhiteStyle),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: <Widget>[
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text("Meydanlar", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text("Satellite", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[ Text("DTED", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text("Meydanlar", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text("Satellite", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[ Text("DTED", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text("Meydanlar", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text("Satellite", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[ Text("DTED", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text("Meydanlar", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text("Satellite", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                  Container(
                    width: 97,
                    height: 60,
                    child: RaisedButton(
                      color: btnColor,
                      splashColor: selectedColor,
                      onPressed: () {},
                      animationDuration: Duration(seconds: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(13.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[ Text("DTED", style: defaultWhiteStyle)],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  GeneralChartsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(Strings.GENERAL_CHARTS, style: defaultWhiteStyle),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(child: Wrap(            spacing: 10,
              runSpacing: 10,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start ,children: <Widget>[Container(
              width: 97,
              height: 60,
              child: RaisedButton(
                color: btnColor,
                splashColor: selectedColor,
                onPressed: () {},
                animationDuration: Duration(seconds: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(13.0),
                  side: BorderSide(color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ Text("Cartographic", style: defaultWhiteStyle)],
                ),
              ),
            ),
              Container(
                width: 97,
                height: 60,
                child: RaisedButton(
                  color: btnColor,
                  splashColor: selectedColor,
                  onPressed: () {},
                  animationDuration: Duration(seconds: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(13.0),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ Text("Satellite", style: defaultWhiteStyle)],
                  ),
                ),
              ),
              Container(
                width: 97,
                height: 60,
                child: RaisedButton(
                  color: btnColor,
                  splashColor: selectedColor,
                  onPressed: () {},
                  animationDuration: Duration(seconds: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(13.0),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ Text("DTED", style: defaultWhiteStyle)],
                  ),
                ),
              ),],),)
          ],
        ),
      ],
    );
  }
}
