import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/airport_model.dart';
import 'package:tablet_app/screens/navdb/search_screens/airport_search_screen.dart';
import 'package:tablet_app/screens/navdb/search_screens/airport_expansion_tile.dart';
import 'package:tablet_app/screens/navdb/search_screens/filter_text_field.dart';
import 'package:tablet_app/screens/navdb/search_screens/airport_expansion_tile.dart';
import 'package:tablet_app/screens/navdb/themes/navdb_add_button.dart';
import 'package:tablet_app/screens/navdb/widgets/airport_detail_widget.dart';
import 'package:tablet_app/screens/navdb/widgets/carousel_slider/carousel_slider.dart';
import 'package:tablet_app/values/tablet_theme.dart';
import '../../../values/theme.dart';

class AirportScreen extends StatefulWidget {
  static const routeName = "/airports";
  final GlobalKey scaffoldKey;

  AirportScreen(this.scaffoldKey);

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
                      flex: 3,
                      child: Text(
                        "Airport",
                        style: defaultTableWhiteTitleStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: FilterTextField(
                    icon: Icon(Icons.search),
                    height: 40.0,
                    width: 300.0,
                    isNumber: false,
                    labelText: 'Search Anything...',
                  )
              ),
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;

    return CarouselSlider(
      options: CarouselOptions(
          height: height,
          viewportFraction: 1,
          enableInfiniteScroll: false,
          reverse: true
      ),
      items: <Widget>[
        //Stack(children:
        //<Widget>[
        useMobileLayout ? _buildMobileLayout(context) : _buildTabletLayout(context),
        //AdvancedSearchSheet()
        //],
        //),
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
      ],);
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

  Widget _buildTabletLayout(context) {
    var heightListView = MediaQuery.of(context).size.height;
    var widthListView = MediaQuery.of(context).size.width;
    return Row(
      children: <Widget>[
        Container(
        height: heightListView,
        width: widthListView/2,
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
        ),
        AirportDetailWidget()
    ]
    );

  }
}

