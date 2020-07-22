import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/appbar.dart';
import 'package:tablet_app/widgets/common/mainmenu_drawer.dart';
import 'package:tablet_app/widgets/menu/menuitems/weightandbalance_menuitems.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/layouts/weightandbalance/weightandbalance_basicconfiguration.dart';
import 'package:tablet_app/layouts/weightandbalance/weightandbalance_cargo.dart';
import 'package:tablet_app/layouts/weightandbalance/weightandbalance_cgresult.dart';
import 'package:tablet_app/layouts/weightandbalance/weightandbalance_crew.dart';
import 'package:tablet_app/layouts/weightandbalance/weightandbalance_fuel.dart';
import 'package:tablet_app/layouts/weightandbalance/weightandbalance_seats.dart';
import 'package:tablet_app/layouts/weightandbalance/weightandbalance_summary.dart';
import 'package:tablet_app/layouts/weightandbalance/weightandbalance_weightcalculation.dart';

class WeightAndBalance extends StatefulWidget {
  GlobalKey scaffoldKey;

  WeightAndBalance(this.scaffoldKey);

  @override
  WeightAndBalanceState createState() {
    return WeightAndBalanceState();
  }
}

class WeightAndBalanceState extends State<WeightAndBalance> {
  var currentValue = 0;
  int _selectedItem = 0;
  List<Widget> sheets = [
    WABBasicConfiguration(null),
    WABWeightCalculation(null),
    WABCrew(null),
    WABSeats(null),
    WABCargo(null),
    WABFuel(null),
    WABSummary(null),
    WABCGResults(null),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isHome: false,
        scaffoldKey: widget.scaffoldKey,
        title: "WAB",
      ),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: drawerBackgroundColor, textTheme: lightTextTheme),
          child: WeightAndBalanceMenuBar()),
      drawer: MainMenuDrawer(context, widget.scaffoldKey),
      body: Center(
        child: sheets[_selectedItem],
      ),
    );
  }

  Widget WeightAndBalanceMenuBar() {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      selectedItemColor: wabBackgroundColor,
      items: getMissionConfItems(),
      currentIndex: _selectedItem,
      onTap: (value) {
        setState(() {
          _selectedItem = value;
        });
      },
    );
  }

  getMissionConfItems() {
    List<BottomNavigationBarItem> tabs = new List<BottomNavigationBarItem>();
    for (var item in WeightAndBalanceMenuItems.values) {
      tabs.add(
          BottomNavigationBarItem(title: Text(item.name), icon: item.icon));
    }
    return tabs;
  }
}
