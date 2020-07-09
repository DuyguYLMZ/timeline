import 'package:tablet_app/screens/navdb/widgets/carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/airway_model.dart';
import 'package:tablet_app/screens/navdb/search_screens/advanced_search_bottom_sheet.dart';
import 'package:tablet_app/screens/navdb/search_screens/filter_text_field.dart';
import 'package:tablet_app/screens/navdb/widgets/airway_detail_widget.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/values/tablet_theme.dart';



class AirwayScreen extends StatefulWidget {
  static const routeName = "/airways";
  @override
  State<StatefulWidget> createState() {
    return _AirwayScreenState();
  }
}

class _AirwayScreenState extends State<AirwayScreen>
    with WidgetsBindingObserver {
//  WidgetsBindingObserver starts listening in the initState method.
  TextEditingController controller = new TextEditingController();
  String filter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: useMobileLayout,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text(
                  "Airways",
                  style: defaultWhiteTitleStyle,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: FilterTextField(
                    isNumber: true,
                    width: 60,
                    height: 40,
                  )),
            ]),
      ),
      body: CarouselSlider(
          options: CarouselOptions(
              height: height,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              reverse: true
          ),
          items: <Widget>[
            Stack(children:
            <Widget>[
              useMobileLayout ? _buildMobileLayout(context) : _buildTabletLayout(context),
              AdvancedSearchSheet()
            ],

            ),
            new Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/turkiye.png'),
                    fit: BoxFit.fill,
                  ),
                )

            )
          ],),
      );

  }

  Widget _buildTabletLayout(context) {
    var height2 = MediaQuery.of(context).size.height;
    var width2 = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: <Widget>[
          Container(
              height: height2,
              width: width2 / 2,
              decoration: BoxDecoration(
                color: drawerBackgroundColor,
              ),
              child: Scrollbar(
                child: ListView.builder(
                    itemCount: airwayList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return filter == null || filter == ""
                          ? DefaultTextStyle(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: extensionTileFontSize,
                              ),
                              child: Theme(
                                data: ThemeData(
                                    textTheme: TextTheme(
                                        subhead: TextStyle(
                                            color: Colors.white,
                                            fontSize: listHeadSize))),
                                child: ExpansionTile(
                                  key: PageStorageKey<String>(
                                      airwayList[index].identifier),
                                  title:
                                      Text('${airwayList[index].identifier}'),
                                  initiallyExpanded: true,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: extensionTileFontSize),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                      'Airway Identifier: ${airwayList[index].identifier}'),
                                                  SizedBox(
                                                    height:
                                                        extensionTileFontSize,
                                                  ),
                                                  Text(
                                                      'Level: ${airwayList[index].level}'),
                                                  SizedBox(
                                                    height:
                                                        extensionTileFontSize,
                                                  ),
                                                  Text(
                                                      'Direction Restriction: ${airwayList[index].directionRestriction}'),
                                                  SizedBox(
                                                    height:
                                                        extensionTileFontSize,
                                                  ),
                                                  Text(
                                                      'Type: ${airwayList[index].type}'),
                                                  SizedBox(
                                                    height:
                                                        extensionTileFontSize,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                      'Minimum Altitude: ${airwayList[index].minAltitude}'),
                                                  SizedBox(
                                                    height:
                                                        extensionTileFontSize,
                                                  ),
                                                  Text(
                                                      'Maximum Altitude: ${airwayList[index].maxAltitude}'),
                                                  SizedBox(
                                                    height:
                                                        extensionTileFontSize,
                                                  ),
                                                  Text(
                                                      'Start Waypoint: ${airwayList[index].startWaypoint}'),
                                                  SizedBox(
                                                    height:
                                                        extensionTileFontSize,
                                                  ),
                                                  Text(
                                                      'End Waypoint: ${airwayList[index].endWaypoint}'),
                                                  SizedBox(
                                                    height:
                                                        extensionTileFontSize,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : airwayList[index]
                                  .identifier
                                  .toLowerCase()
                                  .contains(filter.toLowerCase())
                              ? DefaultTextStyle(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: extensionTileFontSize,
                                  ),
                                  child: Theme(
                                    data: ThemeData(
                                        textTheme: TextTheme(
                                            subhead: TextStyle(
                                                color: Colors.white))),
                                    child: ExpansionTile(
                                      key: PageStorageKey<String>(
                                          airwayList[index].identifier),
                                      title: Text(
                                          '${airwayList[index].identifier}'),
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: extensionTileFontSize),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                          'Airport Identifier: ${airwayList[index].identifier}'),
                                                      SizedBox(
                                                        height:
                                                            extensionTileFontSize,
                                                      ),
                                                      Text(
                                                          'Level: ${airwayList[index].level}'),
                                                      SizedBox(
                                                        height:
                                                            extensionTileFontSize,
                                                      ),
                                                      Text(
                                                          'Direction Restriction: ${airwayList[index].directionRestriction}'),
                                                      SizedBox(
                                                        height:
                                                            extensionTileFontSize,
                                                      ),
                                                      Text(
                                                          'Minimum Altitude: ${airwayList[index].minAltitude}'),
                                                      SizedBox(
                                                        height:
                                                            extensionTileFontSize,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                          'Maximum Altitude: ${airwayList[index].maxAltitude}'),
                                                      SizedBox(
                                                        height:
                                                            extensionTileFontSize,
                                                      ),
                                                      Text(
                                                          'Start Waypoint: ${airwayList[index].startWaypoint}'),
                                                      SizedBox(
                                                        height:
                                                            extensionTileFontSize,
                                                      ),
                                                      Text(
                                                          'End Waypoint: ${airwayList[index].endWaypoint}'),
                                                      SizedBox(
                                                        height:
                                                            extensionTileFontSize,
                                                      ),
                                                      Text(
                                                          'Type: ${airwayList[index].type}'),
                                                      SizedBox(
                                                        height:
                                                            extensionTileFontSize,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : new Container();
                    }),
              )),
          AirwayDetailWidget()
        ],
      ),
    );
  }

  Widget _buildMobileLayout(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
            itemCount: airwayList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var extensionTileFontSize = 14.0;
              return filter == null || filter == ""
                  ? DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: extensionTileFontSize,
                      ),
                      child: Theme(
                        data: ThemeData(
                            textTheme: TextTheme(
                                subhead: TextStyle(color: Colors.white))),
                        child: ExpansionTile(
                          key: PageStorageKey<String>(
                              airwayList[index].identifier),
                          title: Text('${airwayList[index].identifier}'),
                          initiallyExpanded: true,
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(left: extensionTileFontSize),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                              'Airport Identifier: ${airwayList[index].identifier}'),
                                          SizedBox(
                                            height: extensionTileFontSize,
                                          ),
                                          Text(
                                              'Level: ${airwayList[index].level}'),
                                          SizedBox(
                                            height: extensionTileFontSize,
                                          ),
                                          Text(
                                              'Direction Restriction: ${airwayList[index].directionRestriction}'),
                                          SizedBox(
                                            height: extensionTileFontSize,
                                          ),
                                          Text(
                                              'Minimum Altitude: ${airwayList[index].minAltitude}'),
                                          SizedBox(
                                            height: extensionTileFontSize,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                              'Maximum Altitude: ${airwayList[index].maxAltitude}'),
                                          SizedBox(
                                            height: extensionTileFontSize,
                                          ),
                                          Text(
                                              'Start Waypoint: ${airwayList[index].startWaypoint}'),
                                          SizedBox(
                                            height: extensionTileFontSize,
                                          ),
                                          Text(
                                              'End Waypoint: ${airwayList[index].endWaypoint}'),
                                          SizedBox(
                                            height: extensionTileFontSize,
                                          ),
                                          Text(
                                              'Type: ${airwayList[index].type}'),
                                          SizedBox(
                                            height: extensionTileFontSize,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    )
                  : airwayList[index]
                          .identifier
                          .toLowerCase()
                          .contains(filter.toLowerCase())
                      ? DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: extensionTileFontSize,
                          ),
                          child: Theme(
                            data: ThemeData(
                                textTheme: TextTheme(
                                    subhead: TextStyle(color: Colors.white))),
                            child: ExpansionTile(
                              key: PageStorageKey<String>(
                                  airwayList[index].identifier),
                              title: Text('${airwayList[index].identifier}'),
                              children: <Widget>[
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                                'Airport Identifier: ${airwayList[index].identifier}'),
                                            SizedBox(
                                              height: extensionTileFontSize,
                                            ),
                                            Text(
                                                'Level: ${airwayList[index].level}'),
                                            SizedBox(
                                              height: extensionTileFontSize,
                                            ),
                                            Text(
                                                'Direction Restriction: ${airwayList[index].directionRestriction}'),
                                            SizedBox(
                                              height: extensionTileFontSize,
                                            ),
                                            Text(
                                                'Minimum Altitude: ${airwayList[index].minAltitude}'),
                                            SizedBox(
                                              height: extensionTileFontSize,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                                'Maximum Altitude: ${airwayList[index].maxAltitude}'),
                                            SizedBox(
                                              height: extensionTileFontSize,
                                            ),
                                            Text(
                                                'Start Waypoint: ${airwayList[index].startWaypoint}'),
                                            SizedBox(
                                              height: extensionTileFontSize,
                                            ),
                                            Text(
                                                'End Waypoint: ${airwayList[index].endWaypoint}'),
                                            SizedBox(
                                              height: extensionTileFontSize,
                                            ),
                                            Text(
                                                'Type: ${airwayList[index].type}'),
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
                        )
                      : new Container();
            }),
      ),
    );
  }
}
