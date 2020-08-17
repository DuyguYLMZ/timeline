import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/screens/weightandbalance/weightandbalance_fixedcargo.dart';
import 'package:tablet_app/screens/weightandbalance/weightandbalance_freecargo.dart';
import 'package:tablet_app/screens/weightandbalance/weightandbalance_palletcargo.dart';
import 'package:tablet_app/values/theme.dart';

class WABCargo extends StatefulWidget {
  GlobalKey scaffoldKey;

  WABCargo(this.scaffoldKey);

  @override
  _WABCargoState createState() {
    return _WABCargoState();
  }
}

class _WABCargoState extends State<WABCargo> {
  var currentValue = 0;
  final List<Tab> cargoTabs = <Tab>[
    Tab(text: "Palet"),
    Tab(text: "Sabit"),
    Tab(text: "Serbest"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context) {
    return DefaultTabController(
      length: cargoTabs.length,
      child: Scaffold(
        appBar: TabBar(
          tabs: cargoTabs,
          unselectedLabelColor: grey,
          labelColor: selectedBlue,
          indicatorColor: wabBackgroundColor,
        ),
        body: TabBarView(
          children: cargoTabs.map((Tab tab) {
            return Center(
              child: getTabPages(tab),
            );
          }).toList(),
        ),
      ),
    );
  }

  getTabPages(Tab tab) {
    switch (tab.text) {
      case "Palet":
        return PalletCargo();
      case "Serbest":
        return FreeCargo();
      case "Sabit":
        return FixedCargo();
      default:
        return Container();
    }
  }
}
