import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/appbar.dart';
import 'package:tablet_app/widgets/common/mainmenu_drawer.dart';
import 'package:tablet_app/widgets/weightandbalance/infowidget.dart';

class WABCrew extends StatefulWidget {
  GlobalKey scaffoldKey;

  WABCrew(this.scaffoldKey);

  @override
  _WABCrewState createState() {
    return _WABCrewState();
  }
}

class _WABCrewState extends State<WABCrew> {
  var currentValue = 0;

  List crews = new List<String>();
  List crewsWeight = new List<String>();
  List crewsArm = new List<String>();
  List crewsmoment = new List<String>();
  List selectedcrew = new List<bool>();


  @override
  void initState() {
    super.initState();

    crews.add("Pilot");
    crews.add("Pilot2");
    crews.add("Pilot3");
    crews.add("Pilot4");
    crewsWeight.add("111");
    crewsWeight.add("112");
    crewsWeight.add("113");
    crewsWeight.add("114");
    crewsArm.add("111");
    crewsArm.add("112");
    crewsArm.add("113");
    crewsArm.add("114");
    crewsmoment.add("111 kg.mt");
    crewsmoment.add("112 kg.mt");
    crewsmoment.add("113 kg.mt");
    crewsmoment.add("114 kg.mt");
    selectedcrew.add(false);
    selectedcrew.add(false);
    selectedcrew.add(false);
    selectedcrew.add(false);
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context) {
    var  size = MediaQuery.of(context).size;
    double infoheight = size.height / 7;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Column(children: crewRow()),
            ),
            Column(
              children: <Widget>[
                Divider(color: white, height: 25.0),
                /*Container(
                  margin: EdgeInsets.all(10),
                    decoration: new BoxDecoration(
                       borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                      color: wabBackgroundColor,
                      border: Border.all(
                        color: grey,
                        width: 1,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 7,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        infoRow(crews, crewsWeight, crewsArm, crewsmoment),
                      ],
                    )))*/
                infoRow(crews, crewsWeight, crewsArm, crewsmoment, infoheight),
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
              value: selectedcrew[index],
              onChanged: (bool value) {
                setState(() {
                  selectedcrew[index] = value;
                });
              }),
          SizedBox(
            width: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(crews[index]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(crewsWeight[index] + " kg"),
                    Text(crewsArm[index] + " mt"),
                    Text(crewsmoment[index]),
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
