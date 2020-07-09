import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/cas_model.dart';

DefaultTextStyle getExpansionTileForMobile(double extensionTileFontSize, int index) {
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
        key: PageStorageKey<String>(casList[index].name),
        title: Text('${casList[index].name}'),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: extensionTileFontSize),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Name: ${casList[index].name}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Type: ${casList[index].type}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Center: ${casList[index].center}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Classification: ${casList[index].classification}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Lower Limit: ${casList[index].lowerLimit}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Upper Limit: ${casList[index].upperLimit}'),
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
}

DefaultTextStyle getExpansionTileForTablet(double extensionTileFontSize, int index) {
  return DefaultTextStyle(
    style: TextStyle(
      color: Colors.white,
      fontSize: extensionTileFontSize,
    ),
    child: Theme(
      data: ThemeData(
          textTheme: TextTheme(
              subhead: TextStyle(
                color: Colors.white,
                fontSize: extensionTileFontSize,
              ))
      ),
      child: ExpansionTile(
        key: PageStorageKey<String>(casList[index].name),
        title: Text('${casList[index].name}'),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: extensionTileFontSize),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Name: ${casList[index].name}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Type: ${casList[index].type}'),
                        SizedBox(height: extensionTileFontSize,),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Center: ${casList[index].center}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Classification: ${casList[index].classification}'),
                        SizedBox(height: extensionTileFontSize,),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Lower Limit: ${casList[index].lowerLimit}'),
                        SizedBox(height: extensionTileFontSize,),
                        Text('Upper Limit: ${casList[index].upperLimit}'),
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
}