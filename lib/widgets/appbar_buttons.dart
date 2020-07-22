import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablet_app/model/routepoints_model.dart';
import 'package:tablet_app/util/routemanagementprovider.dart';
import 'package:tablet_app/util/weightandbalanceprovider.dart';
import 'package:tablet_app/widgets/menu/menuitems/appbarmenubuttonitems.dart';

import 'menu/menuitems/toolmenuitems.dart';

class AppBarButtonWidget extends StatelessWidget {
  GlobalKey scaffoldKey;
  BuildContext context;
  bool isHome = false;
  bool showCoor = true;
  bool showScaleBar = true;
  RoutePoints points;

  RouteProvider provider;

  AppBarButtonWidget({this.context, this.scaffoldKey, this.isHome});

  @override
  Widget build(BuildContext context) {
    provider =   Provider.of<RouteProvider>(context);
    points = new RoutePoints();
    return AppBarButton();
  }

  AppBarButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: PopupMenuButton(
            child: Text("Tools"),
            itemBuilder: (context) => getToolsItems(context),
            onSelected: (value) {
              switch (value) {
                case 0:
                  return;
                case 1:
                  return;
                case 2:
                  _distMeasurement();
                  return;
              }
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Center(
          child: PopupMenuButton(
            child: Text("Menu"),
            itemBuilder: (context) => getMenuItems(),
            onSelected: (value) {
              switch (value) {
                case 1:
                  _newMission();
                  return;
                case 2:
                  _clearMission();
                  return;
              }
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  List<Widget> getMenuItems() {
    List<PopupMenuItem> itemList = new List<PopupMenuItem>();
    for (var item in AppbarMenuButtonItemsEnum.values) {
      itemList.add(PopupMenuItem(
        value: item.id,
        child: Text(
          item.name,
        ),
      ));
    }
    return itemList;
  }

  List<Widget> getToolsItems(BuildContext context) {
    List<PopupMenuItem> itemList = new List<PopupMenuItem>();
    for (var item in ToolMenuItemsEnum.values) {
      itemList.add(PopupMenuItem(
        value: item.id,
        child: Text(
          item.name,
        ),
      ));
    }
    return itemList;
  }

  void _newMission() {
    provider.setMission(true);
    provider.setEditMission(true);
  }

  void _clearMission() {

        provider.markerList
        .clear();
    if (points != null) {
      points.removeAllPoint();
    }
  }

  void _distMeasurement() {
    if(provider.getdistMeasuremnet()){
      provider.setdistMeasuremnet(false);
    }else{
      provider.setdistMeasuremnet(true);
    }

  }
}

