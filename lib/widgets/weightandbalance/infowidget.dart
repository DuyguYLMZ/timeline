import 'package:flutter/material.dart';
import 'package:tablet_app/model/weightandbalancemodel/seat.dart';
import 'package:tablet_app/values/theme.dart';

Widget infoRow(List itemlist, List modelList,double height) {
  return Container(
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
      height: height,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.local_florist),
                      Text("Toplam "),
                      Text(itemlist.length.toString())
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.local_florist),
                      Text("Ağırlık"),
                      totalWeight(modelList)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.local_florist),
                      Text("Moment"),
                      Text(itemlist.length.toString())
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.local_florist),
                      Text("Ortalama Arm"),
                      averageArm(modelList)
                    ],
                  ),
                ],
              ),
            ],
          )));
}

totalWeight(List weightlist) {
  double total = 0;
  for (int i = 0; i < weightlist.length; i++) {
    total += weightlist[i].weight;
  }
  return Text(total.toString());
}

averageArm(List armlist) {
  double total = 0;
  double averagearm = 0;
  if (armlist != null) {
    for (int i = 0; i < armlist.length; i++) {
      total += armlist[i].startArm;
    }
    averagearm = total / armlist.length;
  }
  return Text(averagearm.toString());
}
