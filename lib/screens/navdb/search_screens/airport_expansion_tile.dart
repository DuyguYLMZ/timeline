
import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    Key key,
    @required this.extensionTileFontSize,
    @required this.airportEntry,
  }) : super(key: key);

  final double extensionTileFontSize;
  final airportEntry;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
        fontSize: extensionTileFontSize,
      ),
      child: Theme(
        data: ThemeData(
            textTheme: TextTheme(subhead: TextStyle(color: Colors.white))),
        child: ExpansionTile(
          key: PageStorageKey<String>(airportEntry.name),
          title: Text('${airportEntry.name}'),
          children: <Widget>[
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
    );
  }
}

Widget getAirportExpansionTileForTablet(double extensionTileFontSize, var airportEntry){

    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
        fontSize: extensionTileFontSize,
      ),
      child: Theme(
        data: ThemeData(
            textTheme: TextTheme(subhead: TextStyle(color: Colors.white))),
        child: ExpansionTile(
          key: PageStorageKey<String>(airportEntry.name
          ),
          title: Text('${airportEntry.name}'),
          children: <Widget>[
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
    );

}

Widget getAirportExpansionTileForMobile(double extensionTileFontSize, var airportEntry){

  return DefaultTextStyle(
    style: TextStyle(
      color: Colors.white,
      fontSize: extensionTileFontSize,
    ),
    child: Theme(
      data: ThemeData(
          textTheme: TextTheme(subhead: TextStyle(color: Colors.white))),
      child: ExpansionTile(
        key: PageStorageKey<String>(airportEntry.name),
        title: Text('${airportEntry.name}'),
        children: <Widget>[
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
  );

}