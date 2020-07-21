import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablet_app/util/themenotifier.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/menu/menuitems/menu_button_items.dart';

import 'menu/menuitems/toolmenuitems.dart';

class AppBarButtonWidget extends StatelessWidget {
  GlobalKey scaffoldKey;
  BuildContext context;
  bool isHome = false;
  bool showCoor = true;
  bool showScaleBar = true;
  List<MenuButtonItem> menuContents;
  Function(int) onMenuItemSelected;
  AppBarButtonWidget({this.context, this.scaffoldKey,this.isHome, this.menuContents, this.onMenuItemSelected});

  @override
  Widget build(BuildContext context) {
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
            onSelected: (value) {},
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Center(
          child: PopupMenuButton(
            child: Text("Menu"),
            itemBuilder: (context) => getMenuItems(),
            onSelected:  (value){
              onMenuItemSelected(value);
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
    for (var item in menuContents) {
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

  void changeTheme() {
    if (Provider.of<ThemeNotifier>(context).getTheme() == darkTheme) {
      Provider.of<ThemeNotifier>(context).setTheme(lightTheme);
    } else {
      Provider.of<ThemeNotifier>(context).setTheme(darkTheme);
    }
  }
}
