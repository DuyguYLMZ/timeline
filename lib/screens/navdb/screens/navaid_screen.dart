import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/navaid_model.dart';
import 'package:tablet_app/values/tablet_theme.dart';

import '../../../values/theme.dart';
import '../../../values/theme.dart';

class NavaidScreen extends StatefulWidget {
  static const routeName = "/navaids";

  @override
  _NavaidScreenState createState() => _NavaidScreenState();
}

class _NavaidScreenState extends State<NavaidScreen>
    with WidgetsBindingObserver {
//  WidgetsBindingObserver starts listening in the initState method.
  int currentValue = 0;

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
          "Navaids",
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
        return buildNavaidTabletHorizontalLayout(context, navaidList, drawerBackgroundColor);
      }
    }

  }



  Widget _buildTableVerticalLayout() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
            itemCount: navaidList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: extensionTileFontSize,
                ),
                child: Theme(
                  data: ThemeData(
                      textTheme:
                      TextTheme(subhead: TextStyle(color: Colors.white))),
                  child: ExpansionTile(
                    key: PageStorageKey<String>(navaidList[index].identifier),
                    title: Text('${navaidList[index].identifier}'),
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: extensionTileFontSize,
                                  ),
                                  Text('Identifier: ${navaidList[index].identifier}'),
                                  SizedBox(
                                    height: extensionTileFontSize,
                                  ),
                                  Text(
                                      'Name: ${navaidList[index].name}'),
                                  SizedBox(
                                    height: extensionTileFontSize,
                                  ),
                                  Text(
                                      'Navaid Type: ${navaidList[index].navaidType}'),
                                  SizedBox(
                                    height: extensionTileFontSize,
                                  ),
                                ],
                              ),
                            ),

                          ]),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _buildVerticalLayout() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
            itemCount: navaidList.length,
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
                      textTheme:
                      TextTheme(subhead: TextStyle(color: Colors.white))),
                  child: ExpansionTile(
                    key: PageStorageKey<String>(navaidList[index].identifier),
                    title: Text('${navaidList[index].identifier}'),
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: extensionTileFontSize,
                                  ),
                                  Text('Identifier: ${navaidList[index].identifier}'),
                                  SizedBox(
                                    height: extensionTileFontSize,
                                  ),
                                  Text(
                                      'Name: ${navaidList[index].name}'),
                                  SizedBox(
                                    height: extensionTileFontSize,
                                  ),
                                  Text(
                                      'Navaid Type: ${navaidList[index].navaidType}'),
                                  SizedBox(
                                    height: extensionTileFontSize,
                                  ),
                                ],
                              ),
                            ),

                          ]),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

Widget buildNavaidTabletHorizontalLayout(context, navaidList, color){
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: color,
    ),
    child: Scrollbar(
      child: ListView.builder(
          itemCount: navaidList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: extensionTileFontSize,
              ),
              child: Theme(
                data: ThemeData(
                    textTheme:
                    TextTheme(subhead: TextStyle(color: Colors.white))),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  key: PageStorageKey<String>(navaidList[index].identifier),
                  title: Text('${navaidList[index].identifier}'),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(extensionTileFontSize),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                'Identifier: ${navaidList[index].identifier}'),
                            SizedBox(width: extensionTileFontSize,),
                            Text(
                                'Name: ${navaidList[index].name}'),
                            SizedBox(width: extensionTileFontSize,),
                            Text(
                                'Navaid Type: ${navaidList[index].navaidType}'),
                            SizedBox(width: extensionTileFontSize,),

                          ]),
                    ),
                  ],
                ),
              ),
            );
          }),
    ),
  );
}