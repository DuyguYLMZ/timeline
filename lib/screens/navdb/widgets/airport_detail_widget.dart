import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/airport_model.dart';
import 'package:tablet_app/screens/navdb/screens/navaid_screen.dart';
import 'package:tablet_app/screens/navdb/screens/runway_screen.dart';
import 'package:tablet_app/screens/navdb/screens/airport_comm.dart';
import 'package:tablet_app/values/tablet_theme.dart';

class AirportDetailWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _AirportDetailWidgetState();
  }
}

class _AirportDetailWidgetState extends State<AirportDetailWidget>{

  AirportModel airportEntry = airportList[0];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return DefaultTabController(
      length: 3,
      child: DefaultTextStyle(
        style: TextStyle( color: Colors.black),
        child: Container(
          height: height,
          width:  width / 2,
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              Ink(
                color: Colors.grey[200],
                child: Padding(
                  padding: EdgeInsets.all(extensionTileFontSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: extensionTileFontSize,
                      ),
                      Text('${airportEntry.name}', style: TextStyle(fontSize: 16),),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(extensionTileFontSize),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: extensionTileFontSize,
                                    ),
                                    Text('Icao: ${airportEntry.icao}'),
                                    SizedBox(
                                      width: extensionTileFontSize,
                                    ),
                                    Text('Short Name:'),
                                    SizedBox(
                                      width: extensionTileFontSize,
                                    ),
                                    Text('Type: ${airportEntry.type}'),
                                    SizedBox(
                                      width: extensionTileFontSize,
                                    ),
                                    Text('Longest Runway: ${airportEntry.elev}'),
                                    SizedBox(
                                      width: extensionTileFontSize,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),

              PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: Material(
                  color: Colors.grey[700],
                  child: TabBar(
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                          color: Colors.blue
                      ),
                      tabs: [
                        Tab(text: 'Airport Communication'),
                        Tab(text: 'Runway'),
                        Tab(text: 'Navaid')
                      ]
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                        child: buildAircommTableLayout(context, airportEntry.airportComms, Colors.grey[700])
                    ),
                    Container(
                        child: buildRunwayTabletLayout(context, airportEntry.airportRunways, Colors.grey[700])
                    ),
                    Container(
                        child: buildNavaidTabletHorizontalLayout(context, airportEntry.airportNavaids, Colors.grey[700])
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
