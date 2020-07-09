import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/waypoint_model.dart';

import '../../../values/theme.dart';


class WaypointScreen extends StatefulWidget {

  static const routeName = "/waypoints";
  @override
  _WaypointScreenState createState() => _WaypointScreenState();
}

class _WaypointScreenState extends State<WaypointScreen> with WidgetsBindingObserver{

  //  WidgetsBindingObserver starts listening in the initState method.

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Waypoints",
          style: defaultWhiteTitleStyle,
        ),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;
    if(useMobileLayout){
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        return _buildVerticalLayout();
      } else {
        return _buildVerticalLayout();
      }
    }else{
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        return _buildTableVerticalLayout();
      } else {
        return buildTableHorizontalLayout(context, drawerBackgroundColor, waypointList);
      }
    }
  }


  Widget _buildVerticalLayout() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
            itemCount: waypointList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var extensionTileFontSize = 14.0;
              return DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: extensionTileFontSize,
                ),
                child: Theme(
                  data: ThemeData(
                      textTheme: TextTheme(
                          subhead: TextStyle(
                              color: Colors.white
                          ))
                  ),
                  child: ExpansionTile(
                    key: PageStorageKey<String>(waypointList[index].identifier),
                    title: Text('${waypointList[index].identifier}'),
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Identifier: ${waypointList[index].identifier}'),
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Name: ${waypointList[index].name}'),
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Airway Identifiers: ${waypointList[index].airwayIdentifiers}'),
                                  SizedBox(height: extensionTileFontSize,),
                                ],
                              ),
                            ),
                          ]
                      ),

                    ],

                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _buildTableVerticalLayout() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
            itemCount: waypointList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var extensionTileFontSize = 14.0;
              return DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: extensionTileFontSize,
                ),
                child: Theme(
                  data: ThemeData(
                      textTheme: TextTheme(
                          subhead: TextStyle(
                              color: Colors.white
                          ))
                  ),
                  child: ExpansionTile(
                    key: PageStorageKey<String>(waypointList[index].identifier),
                    title: Text('${waypointList[index].identifier}'),
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Identifier: ${waypointList[index].identifier}'),
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Name: ${waypointList[index].name}'),
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Airway Identifiers: ${waypointList[index].airwayIdentifiers}'),
                                  SizedBox(height: extensionTileFontSize,),
                                ],
                              ),
                            ),
                          ]
                      ),

                    ],

                  ),
                ),
              );
            }),
      ),
    );
  }


}
Widget buildTableHorizontalLayout(context, backgroundColor, waypointList) {
  return Container(
    height: MediaQuery
        .of(context)
        .size
        .height,
    width: MediaQuery
        .of(context)
        .size
        .width,
    decoration: BoxDecoration(
      color: backgroundColor,
    ),
    child: Scrollbar(
      child: ListView.builder(
          itemCount: waypointList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var extensionTileFontSize = 16.0;
            return DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: extensionTileFontSize,
              ),
              child: Theme(
                data: ThemeData(
                    textTheme: TextTheme(
                        subhead: TextStyle(
                            color: Colors.white
                        ))
                ),
                child: ExpansionTile(
                  key: PageStorageKey<String>(waypointList[index].identifier),
                  title: Text('${waypointList[index].identifier}'),
                  initiallyExpanded: true,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(extensionTileFontSize),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('Identifier: ${waypointList[index].identifier}'),
                                SizedBox(width: extensionTileFontSize,),
                                Text('Name: ${waypointList[index].name}'),
                              ],
                            ),
                            SizedBox(height: extensionTileFontSize,),
                            Text('Airway Identifiers: ${waypointList[index].airwayIdentifiers}'),
                          ]
                      ),
                    ),

                  ],

                ),
              ),
            );
          }),
    ),
  );
}
