import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/runway_model.dart';

import '../../../values/theme.dart';


class RunwayScreen extends StatefulWidget {
  static const routeName = "/runways";
  @override
  State<StatefulWidget> createState() {
    return _RunwayScreenState();
  }
}

class _RunwayScreenState extends State<RunwayScreen>  with WidgetsBindingObserver {
//  WidgetsBindingObserver starts listening in the initState method.

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;
    if(useMobileLayout){
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Runways",
            style: defaultWhiteTitleStyle,
          ),
        ),
        body: body(context),
      );
    }else{
      return Scaffold(
        appBar: AppBar(
          leading: new Container(),
          title: Text(
            "Runways",
            style: defaultWhiteTitleStyle,
          ),
        ),
        body: _buildTabletLayout(),
      );
    }

  }

  Widget body(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;

    if (useMobileLayout) {
      return _buildMobileLayout();
    }

    return _buildTabletLayout();
  }


  Widget _buildMobileLayout() {
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
            itemCount: runwayList.length,
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
                    key: PageStorageKey<String>(runwayList[index].identifier),
                    title: Text('${runwayList[index].identifier}'),
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
                                  Text('Airport Identifier: ${runwayList[index].airportIdentifier}'),
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Airport Name: ${runwayList[index].airportName}'),
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Length: ${runwayList[index].length}'),
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Width: ${runwayList[index].width}'),
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
                                  Text('Slope TDZ: ${runwayList[index]
                                      .slopeTdz}'),
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Surface Composition: ${runwayList[index]
                                      .surfaceComposition}'),
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

  Widget _buildTabletLayout() {
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
            itemCount: runwayList.length,
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
                    key: PageStorageKey<String>(runwayList[index].identifier),
                    title: Text('${runwayList[index].identifier}'),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: extensionTileFontSize,),
                                    Text('Airport Identifier: ${runwayList[index].airportIdentifier}'),
                                    SizedBox(height: extensionTileFontSize,),
                                    Text('Airport Name: ${runwayList[index].airportName}'),
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
                                    Text('Length: ${runwayList[index].length}'),
                                    SizedBox(height: extensionTileFontSize,),
                                    Text('Width: ${runwayList[index].width}'),
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
                                    Text('Slope TDZ: ${runwayList[index]
                                        .slopeTdz}'),
                                    SizedBox(height: extensionTileFontSize,),
                                    Text('Surface Composition: ${runwayList[index]
                                        .surfaceComposition}'),
                                    SizedBox(height: extensionTileFontSize,),
                                  ],
                                ),
                              ),
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
}
