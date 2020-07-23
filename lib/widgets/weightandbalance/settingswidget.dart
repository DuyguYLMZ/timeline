import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/strings.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/menu/menuitems/settingsmenuitems.dart';

class SettingsWidget extends StatelessWidget {
  bool compass = false;
  bool airways = false;
  double _value = 0;

  bool isCompass = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
            child: Row(
          children: <Widget>[
            Text(Strings.OPACITIES, style: defaultWhiteStyle),
            Slider(
              activeColor:wabBackgroundColor,
              min: 0,
              max: 100,
              value: _value,
              onChanged: (value) {
                (context as Element).markNeedsBuild();
                _value = value;
              },
            )
          ],
        )),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Scrollbar(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(8),
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start ,
                        children: <Widget>[
                          Container(
                            width: 97,
                            height: 60,
                            child: RaisedButton(
                              color: btnColor,
                              onPressed: () {
                                (context as Element).markNeedsBuild();
                              },
                              animationDuration: Duration(seconds: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text(Strings.COMPASS, style: defaultWhiteStyle)],
                              ),
                            ),
                          ),
                          Container(
                            width: 97,
                            height: 60,
                            child: RaisedButton(
                              color: btnColor,
                              onPressed: () {
                                (context as Element).markNeedsBuild();
                              },
                              animationDuration: Duration(seconds: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text(Strings.DEFAULT_SCALE, style: defaultWhiteStyle)],
                              ),
                            ),
                          ),
                          Container(
                            width: 97,
                            height: 60,
                            child: RaisedButton(
                              color: btnColor,
                              onPressed: () {
                                (context as Element).markNeedsBuild();
                              },
                              animationDuration: Duration(seconds: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text(Strings.AIRLINE, style: defaultWhiteStyle)],
                              ),
                            ),
                          ),
                          Container(
                            width: 97,
                            height: 60,
                            child: RaisedButton(
                              color: btnColor,
                              onPressed: () {
                                (context as Element).markNeedsBuild();
                              },
                              animationDuration: Duration(seconds: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text(Strings.MAP_PROJECTION, style: defaultWhiteStyle)],
                              ),
                            ),
                          ),
                          Container(
                            width: 97,
                            height: 60,
                            child: RaisedButton(
                              color: btnColor,
                              onPressed: () {
                                (context as Element).markNeedsBuild();
                              },
                              animationDuration: Duration(seconds: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text(Strings.COORDINATES_GRID, style: defaultWhiteStyle)],
                              ),
                            ),
                          ),
                          Container(
                            width: 97,
                            height: 60,
                            child: RaisedButton(
                              color: btnColor,
                              onPressed: () {
                                (context as Element).markNeedsBuild();
                              },
                              animationDuration: Duration(seconds: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Flexible(child: Text(Strings.COORDINATES_FORMAT, style: defaultWhiteStyle))],
                              ),
                            ),
                          ),
                          Container(
                            width: 97,
                            height: 60,
                            child: RaisedButton(
                              color: btnColor,
                              onPressed: () {
                                (context as Element).markNeedsBuild();
                              },
                              animationDuration: Duration(seconds: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text(Strings.DIRECTION_REFERENCE, style: defaultWhiteStyle)],
                              ),
                            ),
                          ),
                          Container(
                            width: 97,
                            height: 60,
                            child: RaisedButton(
                              color: btnColor,
                              onPressed: () {
                                (context as Element).markNeedsBuild();
                              },
                              animationDuration: Duration(seconds: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text(Strings.SHOW_SCALE_BAR, style: defaultWhiteStyle)],
                              ),
                            ),
                          ),
                          Container(
                            width: 97,
                            height: 60,
                            child: RaisedButton(
                              color: btnColor,
                              onPressed: () {
                                (context as Element).markNeedsBuild();
                              },
                              animationDuration: Duration(seconds: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text(Strings.SHOW_COORDINATES, style: defaultWhiteStyle)],
                              ),
                            ),
                          ),
                          Container(
                            width: 97,
                            height: 60,
                            child: RaisedButton(
                              color: btnColor,
                              onPressed: () {
                                (context as Element).markNeedsBuild();
                              },
                              animationDuration: Duration(seconds: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[Text(Strings.DARK_THEME, style: defaultWhiteStyle)],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
