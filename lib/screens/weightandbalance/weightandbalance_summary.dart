import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/appbar.dart';
import 'package:tablet_app/widgets/common/mainmenu_drawer.dart';


class WABSummary extends StatefulWidget {
  GlobalKey scaffoldKey;

  WABSummary(this.scaffoldKey);

  @override
  _WABSummaryState createState() {
    return _WABSummaryState();
  }
}

class _WABSummaryState extends State<WABSummary> {
  var currentValue = 0;
  int _selectedItem = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return _buildVerticalLayout();
    } else {
      return _buildHorizontalLayout();
    }
  }

  Widget _buildHorizontalLayout() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scrollbar(
      ),
    );
  }

  Widget _buildVerticalLayout() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
      ),
    );
  }
}
