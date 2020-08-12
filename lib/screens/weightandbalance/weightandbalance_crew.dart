import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablet_app/util/wabitems/WABItem.dart';
import 'package:tablet_app/util/weightandbalanceprovider.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/weightandbalance/infowidget.dart';

class WABCrew extends StatelessWidget {
  GlobalKey scaffoldKey;

  WABCrew(this.scaffoldKey);

  static List<WABItem> selectedCrewList = new List();
  WABProvider provider;
  static List crews;
  var currentValue = 0;
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    provider = Provider.of<WABProvider>(context);
    if (selectedCrewList == null || selectedCrewList.length == 0) {
      crews = provider.getCrews();
    }
    return body(context);
  }

  Widget body(BuildContext context) {
    double infoheight = size.height / 7;
    return Container(
      height: size.height,
      width: size.width,
      child: Scrollbar(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(children: crewRow()),
                ),
              ),
            ),

            Column(
              children: <Widget>[
                Divider(color: white, height: 25.0),
                infoRow(selectedCrewList, selectedCrewList, infoheight)
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> crewRow() {
    List<Row> rowList = new List<Row>();
    for (int index = 0; index < crews.length; index++) {
      rowList.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: wabBackgroundColor,
              value: crews[index].multiLoadable,
              onChanged: (bool value) {
                provider.loadCrew(index, value);
                if (selectedCrewList != null &&
                    selectedCrewList.contains(crews[index])) {
                  selectedCrewList.remove(crews[index]);
                } else {
                  selectedCrewList.add(crews[index]);
                }
              }),
          SizedBox(
            width: 20,
          ),
          Container(
            width: size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(crews[index].id),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(crews[index].weight.toString() + " kg"),
                    Text(crews[index].startArm.toString() + " mt"),
                    //   Text(crews[index].),
                  ],
                )
              ],
            ),
          )
        ],
      ));
    }
    return rowList;
  }
}
