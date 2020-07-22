import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablet_app/layouts/home_screen.dart';
import 'package:tablet_app/model/routepoint_model.dart';
import 'package:tablet_app/util/routemanagementprovider.dart';

import '../appbar_buttons.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final GlobalKey scaffoldKey;
  double height;
  bool isHome = false;
  PreferredSize bottomBar;

  RouteProvider provider;
  static List<String> _coordinatesList = [
    "33'54'559'K,037'58,712D",
    "Cog.00000",
    "Cog.S.00",
    "Cog.S.0",
    "Cog.",
    "Cog.d",
    "Cog.d.0",
    "Cog.d.00",
    "Cog.d.000",
    "UTM",
    "GK",
    "UPS",
    "MGRS-UPS",
    "UTM-NBC"
  ];
  static List<String> _cogList = [
    "3D",
    "Cografi Proj.",
    "Mercator",
  ];

  int _value = 0;
  int _cogvalue = 0;

  AppBarWidget({this.scaffoldKey, this.title, this.isHome});

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<RouteProvider>(context);
    return AppBar(
      centerTitle: true,
      title: Center(
          child: Row(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Visibility(visible: !isHome, child: Icon(Icons.home))),
          Expanded(child: Center(child: Text(title))),
        ],
      )),
      actions: <Widget>[
        AppBarButtonWidget(
          context: context,
          scaffoldKey: scaffoldKey,
          isHome: isHome,
        )
      ],
      bottomOpacity: 0.8,
      bottom: PreferredSize(
        child: Visibility(
          visible: provider.getdistMeasuremnet(),
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey,
            constraints: BoxConstraints.expand(height: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PopupMenuButton(
                  child: Text(_cogList[_cogvalue]),
                  itemBuilder: (context) => _getCog(context),
                  onSelected: (value) {
                    _cogvalue = value;
                    (context as Element).markNeedsBuild();
                  },
                ),
                Text("33'54'559'K,037'58,712D"),
                PopupMenuButton(
                  child: Text(_coordinatesList[_value]),
                  itemBuilder: (context) => _getCoordinates(context),
                  onSelected: (value) {
                    _value = value;
                    (context as Element).markNeedsBuild();
                  },
                ),
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(48.0),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);

  _getCoordinates(BuildContext context) {
    List<PopupMenuItem> itemList = new List<PopupMenuItem>();
    for (int i = 0; i < _coordinatesList.length; i++) {
      itemList.add(PopupMenuItem(
        value: i,
        child: Text(
          _coordinatesList[i],
        ),
      ));
    }
    return itemList;
  }

  _getCog(BuildContext context) {
    List<PopupMenuItem> itemList = new List<PopupMenuItem>();
    for (int i = 0; i < _cogList.length; i++) {
      itemList.add(PopupMenuItem(
        value: i,
        child: Text(
          _cogList[i],
        ),
      ));
    }
    return itemList;
  }
}
