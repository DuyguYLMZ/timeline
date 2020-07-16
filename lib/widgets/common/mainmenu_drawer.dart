import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/screens/navdb_page.dart';
import 'package:tablet_app/screens/weightandbalance/weightandbalance_screen.dart';
import 'package:tablet_app/widgets/menu/menuitems/mainmenuitems.dart';

import '../../screens/user_settings_screen.dart';

Widget MainMenuDrawer(BuildContext context, GlobalKey<State<StatefulWidget>> scaffoldKey) {
  return Drawer(
      child: ListView(
          padding: EdgeInsets.zero, children: getMainMenuDrawerItems(context,scaffoldKey)));
}

List<Widget> getMainMenuDrawerItems(BuildContext context, GlobalKey<State<StatefulWidget>> scaffoldKey) {

  Widget userInfo = GestureDetector(
    child: new Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        constraints: const BoxConstraints.expand(height: 255.0),
        child: new Center(
            child: new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: new Text(
                              "C72-TK01",
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[  new Text(
                          'Kaptan Marvel',
                        ),
                          new Text(
                            'bla bla',
                          )],
                      )

                    ])))),
    onTap: () {
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => UserSettingsScreen()));
    },
  );

  List<Widget> drawermenu = new List<Widget>();
  drawermenu.add(userInfo);
  for (var item in MainMenuItems.values) {
    drawermenu.add(ListTile(
      leading: item.icon,
      title: Text(item.name),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => getScreen(item, context,scaffoldKey)));
      },
    ));
  }

  return drawermenu;
}


 getScreen(MainMenuItems item, BuildContext context, GlobalKey<State<StatefulWidget>> scaffoldKey) {
  var className;
  switch (item) {
    case MainMenuItems.CONFIGURATION:
      className = UserSettingsScreen();
      break;
    case MainMenuItems.ROUTE_EDITOR:
      className = UserSettingsScreen();
      break;
    case MainMenuItems.WEIGHT_AND_BALANCE:
      className = WeightAndBalance(scaffoldKey);
      break;
    case MainMenuItems.MAP_MANAGEMENT:
      className = UserSettingsScreen();
      break;
    case MainMenuItems.NAVDB:
      className = NavDBPage(0, scaffoldKey);
      break;
    case MainMenuItems.OPTIONS:
      className = UserSettingsScreen();
      break;
    case MainMenuItems.SYNCHRONIZATION:
      className = UserSettingsScreen();
      break;
    case MainMenuItems.DIBIRIF:
      className = UserSettingsScreen();
      break;
    case MainMenuItems.PGP:
      className = UserSettingsScreen();
      break;
    default:
      return null;
  }

  return className;
}
