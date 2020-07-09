import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tablet_app/screens/navdb/screens/airport_comm.dart';
import 'package:tablet_app/screens/navdb/screens/airport_screen.dart';
import 'package:tablet_app/screens/navdb/screens/airway_screen.dart';
import 'package:tablet_app/screens/navdb/screens/cas_screen.dart';
import 'package:tablet_app/screens/navdb/screens/dbselection_page.dart';
import 'package:tablet_app/screens/navdb/screens/firuir_screen.dart';
import 'package:tablet_app/screens/navdb/screens/navaid_screen.dart';
import 'package:tablet_app/screens/navdb/screens/ras_saa_screen.dart';
import 'package:tablet_app/screens/navdb/screens/runway_screen.dart';
import 'package:tablet_app/screens/navdb/screens/waypoint_screen.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/screens/navdb/models/drawer_item.dart';

import 'collapsible_widget.dart';

class NavDBPage extends StatefulWidget {
  static const routeName = "/navdb";
  final int pageindex;

  const NavDBPage({this.pageindex});

  @override
  NavdbPageState createState() {
    return new NavdbPageState();
  }
}

class NavdbPageState extends State<NavDBPage> {

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;

    if(useMobileLayout){
      /*return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: new AppBar(
            elevation: 0.0,
            backgroundColor: backgroundColor,
            // leading: new Text("Weight&Balance"),
            title: Center(
              child: Text('NavDB Management'),
            ),
          ),
          body: Theme(
            data: ThemeData(
                textTheme: TextTheme(
                    subtitle: TextStyle(fontSize: 22.0)

                )
            ),
            child: Stack(
              children: <Widget>[
                CollapsibleDrawer(this, widget.pageindex)
              ],
            ),
          ));*/
    }else{

      final widgetOptions = [
        new DatabaseSelection(),
        new AirportScreen(),
        new AircommScreen(),
        new RunwayScreen(),
        new AirwayScreen(),
        new NavaidScreen(),
        new WaypointScreen(),
        new FirUirScreen(),
        new CasScreen(),
        new RasSaaScreen(),
      ];
      List<BottomNavigationBarItem> barItems = [];
      for(int i = 0; i < drawerItems.length; i++){
        barItems.add(BottomNavigationBarItem(
            icon: Icon(drawerItems[i].icon),
            title: Text(drawerItems[i].title),
            backgroundColor: drawerBackgroundColor
        ));
      }
      return Scaffold(
        appBar: AppBar(
          title: Text('NavDB Management'),
        ),
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: barItems,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.shifting,
          backgroundColor: drawerBackgroundColor,
          onTap: onItemTapped,
        ),
      );
    }
  }


  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
