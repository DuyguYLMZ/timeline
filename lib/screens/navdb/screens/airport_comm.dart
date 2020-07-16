import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/aircomm_model.dart';

import '../../../values/theme.dart';
import '../../../values/theme.dart';


class AircommScreen extends StatefulWidget {
  static const routeName = "/aircomms";

  @override
  State<StatefulWidget> createState() {
    return _AircommScreenState();
  }
}

class _AircommScreenState extends State<AircommScreen>  with WidgetsBindingObserver {
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
            "Airport Communication",
            style: defaultWhiteTitleStyle,
          ),
        ),
        body: _buildMobileLayout(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: new Container(),
          title: Text(
            "Airport Communication",
            style: defaultWhiteTitleStyle,
          ),
        ),
        body: buildTableLayout(context, aircommList, drawerBackgroundColor),
      );
    }

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
            itemCount: aircommList.length,
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
                    key: PageStorageKey<String>(aircommList[index].airportIdentifier),
                    title: Text('${aircommList[index].airportIdentifier}'),
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
                                  Text('Airport Identifier: ${aircommList[index].airportIdentifier}'),
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Airport Name: ${aircommList[index].airportName}'),
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Communication Type: ${aircommList[index].commType}'),
                                  SizedBox(height: extensionTileFontSize,),
                                  Text('Transmit Frequency: ${aircommList[index].transmitFreq}'),
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

Widget buildAircommTableLayout(context, aircommList, color) {
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
      color: color,
    ),
    child: Scrollbar(
      child: ListView.builder(
          itemCount: aircommList.length,
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
                  initiallyExpanded: true,
                  key: PageStorageKey<String>(aircommList[index].airportIdentifier),
                  title: Text('${aircommList[index].airportIdentifier}'),
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
                                Text('Airport Identifier: ${aircommList[index].airportIdentifier}'),
                                SizedBox(height: extensionTileFontSize,),
                                Text('Airport Name: ${aircommList[index].airportName}'),
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
                                Text('Communication Type: ${aircommList[index].commType}'),
                                SizedBox(height: extensionTileFontSize,),
                                Text('Transmit Frequency: ${aircommList[index].transmitFreq}'),
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

buildTableLayout(context, aircommList, color) {

  const rowTextStyle = TextStyle(color: Colors.white, fontSize: 14);

  List<DataRow> tableRowList = [];
  for(var i = 0; i< aircommList.length; i++){
    tableRowList.add(DataRow(
      cells: <DataCell>[
        DataCell(Text('${aircommList[i].airportIdentifier}', style: rowTextStyle)),
        DataCell(Text('${aircommList[i].airportName}', style: rowTextStyle)),
        DataCell(Text('${aircommList[i].commType}', style: rowTextStyle)),
        DataCell(Text('${aircommList[i].transmitFreq}', style: rowTextStyle)),
      ],
    ));
  }

  const headerStyle = TextStyle(
      fontStyle: FontStyle.italic, color: Colors.white, fontSize: 16);
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
      color: color,
    ),
    child: Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.white,
      ),
      child: Scrollbar(
        child:   DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Airport Identifier',
                  style: headerStyle,
                ),
              ),
              DataColumn(
                label: Text(
                  'Airport Name',
                  style: headerStyle,
                ),
              ),
              DataColumn(
                label: Text(
                  'Communication Type',
                  style: headerStyle,
                ),
              ),
              DataColumn(
                label: Text(
                  'Transmit Frequency',
                  style: headerStyle,
                ),
              ),
            ],
            rows: tableRowList
        ),
      ),
    ),
  );
}