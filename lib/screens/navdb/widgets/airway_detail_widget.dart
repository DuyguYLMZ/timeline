import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/airway_model.dart';
import 'package:tablet_app/screens/navdb/models/waypoint_model.dart';
import 'package:tablet_app/screens/navdb/screens/waypoint_screen.dart';
import 'package:tablet_app/values/tablet_theme.dart';

class AirwayDetailWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _AirwayDetailWidgetState();
  }
}

class _AirwayDetailWidgetState extends State<AirwayDetailWidget>{

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
      length: 1,
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
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('${airwayList[0].identifier}',style: TextStyle(fontSize: 18.0),),
                                SizedBox(height: extensionTileFontSize,),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        '${airwayList[0].startWaypoint}'),
                                    Icon(Icons.arrow_forward, color: Colors.black,),
                                    Text('${airwayList[0].endWaypoint}')
                                  ],
                                ),
                                SizedBox(height: extensionTileFontSize,),
                                Text('Level: ${airwayList[0].level == 'L' ? 'Low': 'High'}'),
                                SizedBox(height: extensionTileFontSize,),
                                Text('Direction Restriction: ${airwayList[0].directionRestriction}'),
                                SizedBox(height: extensionTileFontSize,),

                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: extensionTileFontSize,),
                                SizedBox(height: extensionTileFontSize,),
                                Text('Type: ${airwayList[0].type}'),
                                SizedBox(height: extensionTileFontSize,),
                                Text('Minimum Altitude: ${airwayList[0].minAltitude}'),
                                SizedBox(height: extensionTileFontSize,),
                                Text('Maximum Altitude: ${airwayList[0].maxAltitude}'),
                                SizedBox(height: extensionTileFontSize,),
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                ),

              PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: TabBar(
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: Colors.grey[700]
                    ),
                    tabs: [
                      Tab(text: 'Waypoint',),
                    ]
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                        child: buildTableHorizontalLayout(context, Colors.grey[700], waypoints)
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

final waypoints = [
  new WaypointModel('LATGA','LATGA',<String>['T363','T365']),
  new WaypointModel('ESB','ESB',<String>['T363','T367']),
];
