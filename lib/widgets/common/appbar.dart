import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/home_screen.dart';
import 'package:tablet_app/widgets/menu/menuitems/menu_button_items.dart';

import '../appbar_buttons.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final GlobalKey scaffoldKey;
  double height;
  bool isHome = false;
  List<MenuButtonItem> menuContents;
  Function(int) onMenuItemSelected;

  AppBarWidget({this.scaffoldKey, this.title, this.isHome, this.menuContents, this.onMenuItemSelected}) /*: assert(title != null)*/;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Center(
            child: Row(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Icon(Icons.home)),
            Expanded(child: Center(child: Text(title))),
          ],
        )),
        actions: <Widget>[
          AppBarButtonWidget(
            context: context,
            scaffoldKey: scaffoldKey,
            isHome: isHome,
            menuContents: menuContents,
            onMenuItemSelected: onMenuItemSelected,
          )
        ]);
    ;
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
