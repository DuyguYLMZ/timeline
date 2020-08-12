import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/navdb/models/drawer_item.dart';
import 'package:tablet_app/screens/navdb/screens/navdb_page.dart';
import 'package:tablet_app/widgets/commonmobile/collapsing_list_tile_widget.dart';
import '../../../values/theme.dart';


class CollapsibleDrawer extends StatefulWidget {

  int pageIndex;
  NavdbPageState navdbState;



  CollapsibleDrawer(this.navdbState, this.pageIndex);

  @override
  CollapsibleDrawerState createState() {
    return new CollapsibleDrawerState(navdbState);
  }
}

class CollapsibleDrawerState extends State<CollapsibleDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 40;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  double position;
  static bool isFirst = true;
  NavdbPageState parent;



  CollapsibleDrawerState(this.parent);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    var selectedIndex = widget.pageIndex;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget, selectedIndex),
    );
  }

  Widget getWidget(context, widget, int selectedIndex) {

    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            CollapsingListTile(
              title: 'C72',
              icon: Icons.local_airport,
              animationController: _animationController,
            ),
            Divider(
              color: Colors.grey,
              height: 40.0,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(height: 12.0);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        print('set state $counter');
                        this.parent.setState(() {

                          print('set state inner $counter');
                                /*Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          NavdbRubberBottomSheet(context, counter),
                                    ));*/
                        });
                      });
                    },
                    isSelected: selectedIndex == counter,
                    title: drawerItems[counter].title,
                    icon: drawerItems[counter].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: drawerItems.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: selectedColor,
                size: 28.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
