
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/widgets/common/appbar.dart';
import 'package:tablet_app/widgets/common/mainmenu_drawer.dart';

class MissionConfiguration extends StatefulWidget {
  GlobalKey<State<StatefulWidget>> scaffoldKey;
  MissionConfiguration(this.scaffoldKey);

  @override
  MissionConfigurationState createState() {
    return  MissionConfigurationState();
  }
}

class MissionConfigurationState extends State<MissionConfiguration> {
  var page = 0;
  int currentValue = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBarWidget(
              isHome: false,
              scaffoldKey: widget.scaffoldKey,
              title: "",
            ),
            drawer: MainMenuDrawer(context,widget.scaffoldKey),
            body: Stack(
              children: <Widget>[
              ],
            )),
    );
  }
}
