import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/airport_model.dart';
import 'package:tablet_app/screens/navdb/search_screens/airport_search_screen.dart';
import 'package:tablet_app/screens/navdb/search_screens/airport_expansion_tile.dart';
import 'package:tablet_app/screens/navdb/search_screens/filter_text_field.dart';
import 'package:tablet_app/screens/navdb/search_screens/airport_expansion_tile.dart';
import 'package:tablet_app/screens/navdb/themes/navdb_add_button.dart';
import 'package:tablet_app/values/tablet_theme.dart';
import '../../../values/theme.dart';

class AirportScreen extends StatefulWidget {
  static const routeName = "/airports";

  @override
  State<StatefulWidget> createState() {
    return _AirportScreenState();
  }
}

class _AirportScreenState extends State<AirportScreen>
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Airport",
                        style: defaultTableWhiteTitleStyle,
                      ),
                    ),
                    Expanded(
                        flex: 7,
                        child: FilterTextField(
                          height: 40.0,
                          width: 300.0,
                          isNumber: false,
                          labelText: 'Airport Name',
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width/2,
                  )
              ),
              Expanded(
                flex: 1,
                child: Theme(
                    data: ThemeData(
                        accentColor: Colors.blueAccent
                    ),
                    child: addButton
                ),
              )
            ]),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
   /* if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return _buildVerticalLayout();
    } else {
      return _buildVerticalLayout();
    }*/

    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;

    if (useMobileLayout) {
      return _buildMobileLayout();
    }

    return _buildTabletLayout();

  }

  Widget _buildMobileLayout() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
                      itemCount: airportList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var airportEntry = airportList[index];
                        print(airportEntry);
                        var extensionTileFontSize = 14.0;
                        return filter == null || filter == ""
                            ? airportEntry.icao.toString().startsWith('LT')
                                ? ExpansionTileWidget(
                                    extensionTileFontSize:
                                        extensionTileFontSize,
                                    airportEntry: airportEntry)
                                : new Container()
                            : airportEntry.name
                                    .toString()
                                    .contains(filter.toLowerCase())
                                ? ExpansionTileWidget(
                                    extensionTileFontSize:
                                        extensionTileFontSize,
                                    airportEntry: airportEntry)
                                : new Container();
                      })

    ));
  }

  Widget _buildTabletLayout() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: drawerBackgroundColor,
      ),
      child: Scrollbar(
        child: ListView.builder(
                  itemCount: airportList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var airportEntry = airportList[index];
                    print(airportEntry);
                    var extensionTileFontSize = 16.0;
                    return filter == null || filter == ""
                        ? airportEntry.icao.toString().startsWith('LT')
                        ? ExpansionTileWidget(
                        extensionTileFontSize:
                        extensionTileFontSize,
                        airportEntry: airportEntry)
                        : new Container()
                        : airportEntry.name
                        .toString()
                        .contains(filter.toLowerCase())
                        ? ExpansionTileWidget(
                        extensionTileFontSize:
                        extensionTileFontSize,
                        airportEntry: airportEntry)
                        : new Container();
                  }),

            ),
      );

  }


}

final addButton = AddRecordWidget();

class AddRecordWidget extends StatelessWidget {

  const AddRecordWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddButtonWidget(
      fillColor: Colors.blue,
      onPressed: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return AirportSearchScreen();
            });
      },
    );
  }
}
