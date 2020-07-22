import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablet_app/model/weightandbalancemodel/crew.dart';
import 'package:tablet_app/util/weightandbalanceprovider.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/weightandbalance/infowidget.dart';

class WABCrew extends StatelessWidget {
  GlobalKey scaffoldKey;

  WABCrew(this.scaffoldKey);

  WABProvider provider;
  List<bool> selectedcrew;
  List<Crew> crews;
  var currentValue = 0;
  var size;

  Crew plt = new Crew();
  Crew plt2 = new Crew();
  Crew plt3 = new Crew();
  Crew plt4 = new Crew();

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<WABProvider>(context);
    crews = provider.getCrewList();
    selectedcrew = provider.getSelectedCrewIndexList();
    size = MediaQuery.of(context).size;
    if (crews == null || crews.length < 1) {
      setCrew();
      for (int i = 0; i < crews.length; i++) {
        provider.addSelectedCrewIndexList(false);
      }
    }

    return body(context);
  }

  void setCrew() {
    plt.setName("Pilot");
    plt.setArm(111);
    plt.setWeight(111);
    plt.setMoment(111);

    plt2.setName("Pilot2");
    plt2.setArm(111);
    plt2.setWeight(111);
    plt2.setMoment(111);

    plt3.setName("Pilot3");
    plt3.setArm(111);
    plt3.setWeight(111);
    plt3.setMoment(111);

    plt4.setName("Pilot4");
    plt4.setArm(111);
    plt4.setWeight(111);
    plt4.setMoment(111);

    addSeat();
  }

  void addSeat() {
    provider.addCrew(plt);
    provider.addCrew(plt2);
    provider.addCrew(plt3);
    provider.addCrew(plt4);
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
            Container(
              height: size.height / 2.5,
              child: Column(children: crewRow()),
            ),
            Column(
              children: <Widget>[
                Divider(color: white, height: 25.0),
                infoRow(selectedcrew, provider.getCrewList(), infoheight),
                SizedBox(
                  height: 8,
                )
              ],
            )
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
              value: selectedcrew[index],
              onChanged: (bool value) {
                provider.changeSelectedCrewIndexList(index,value);
                selectedcrew[index] = value;
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
                Text(crews[index].name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(crews[index].weight.toString() + " kg"),
                    Text(crews[index].arm.toString() + " mt"),
                    Text(crews[index].moment.toString()),
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
