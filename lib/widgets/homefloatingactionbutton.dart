import 'package:flutter/material.dart';
import 'package:tablet_app/widgets/weightandbalance/chartswidget.dart';
import 'package:tablet_app/widgets/weightandbalance/mapwidget.dart';
import 'package:tablet_app/widgets/weightandbalance/settingswidget.dart';
import 'package:tablet_app/widgets/weightandbalance/weatherwidget.dart';

import 'fabcircularmenu.dart';

class HomeFloatingActionButton extends StatefulWidget {

  @override
  HomeFloatingActionButtonState createState() => HomeFloatingActionButtonState();
}

class HomeFloatingActionButtonState extends State<HomeFloatingActionButton> {
  bool showFab = true;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return showFab
        ? Builder(
            builder: (context) => FabCircularMenu(
              alignment: Alignment.bottomRight,
              ringDiameter: 400.0,
              ringWidth: 100.0,
              fabSize: 64.0,
              fabElevation: 8.0,
              fabMargin: const EdgeInsets.all(16.0),
              animationDuration: const Duration(milliseconds: 800),
              animationCurve: Curves.easeInOutCirc,
              onDisplayChange: (isOpen) {},
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    sheetPage(4);
                  },
                  shape: CircleBorder(),
                  child: Icon(Icons.settings),
                ),
                RawMaterialButton(
                  onPressed: () {
                    sheetPage(3);
                  },
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(24.0),
                  child: Icon(Icons.wb_cloudy),
                ),
                RawMaterialButton(
                  onPressed: () {
                    sheetPage(2);
                  },
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(24.0),
                  child: Icon(Icons.multiline_chart),
                ),
                RawMaterialButton(
                  onPressed: () {
                    sheetPage(1);
                  },
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(24.0),
                  child: Icon(Icons.map),
                ),
              ],
            ),
          )
        : Container();
  }

  void showFloatingActionButton(bool value) {
    setState(() {
      showFab = value;
    });
  }

  sheetPage(int index) {
    var bottomSheetController = showBottomSheet(
        context: context,
        builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Scrollbar(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    whichWidget(index),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ));

    showFloatingActionButton(false);
    bottomSheetController.closed.then((value) {
      showFloatingActionButton(true);
    });
  }

  whichWidget(int index) {
    switch (index) {
      case 1:
        return MapWidget();
      case 2:
        return ChartWidget();
      case 3:
        return WeatherWidget();
      case 4:
        return SettingsWidget();
    }
  }
}
