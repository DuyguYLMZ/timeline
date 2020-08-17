import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablet_app/util/palletcargoprovider.dart';
import 'package:tablet_app/util/timeline.dart';
import 'package:tablet_app/util/timeline_model.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/numberpicker.dart';

import '../../model/weightandbalancemodel/palletcargo_model.dart';

class PalletCargo extends StatefulWidget {
  PalletCargo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<PalletCargo> {
  final PageController pageController =
      PageController(initialPage: 1, keepPage: true);
  int pageIx = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<PalletCargoProvider>(context).addDoodle(_addNewPallet());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey,
      ),
      body: timelineModel(TimelinePosition.Center),
    );
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
      itemBuilder: centerTimelineBuilder,
      itemCount: doodles.length,
      physics: BouncingScrollPhysics(),
      position: position);

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final doodle = doodles[i];

    return TimelineModel(
        FlatButton(
          onPressed: () {
            _deleteItem(context, doodle);
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: palletDetails(doodle)),
            ),
          ),
        ),
        position: TimelineItemPosition.left,
        isFirst: i == 0,
        isLast: i == doodles.length,
        iconBackground: doodle.iconBackground,
        icon: doodle.icon);
  }

  palletDetails(Doodle doodle) {
    final textTheme = Theme.of(context).textTheme;
    return <Widget>[
      const SizedBox(
        height: 8.0,
      ),
      Text(
        doodle.name,
        style: textTheme.title,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 8.0,
      ),
      Text(
        "Ağırlık : "+ doodle.weight.toString(),
        style: textTheme.body2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 8.0,
      ),
      Text(
        "Arm : "+doodle.arm.toString(),
        style: textTheme.body2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 8.0,
      ),
      Text(
        "Başlangıç Noktası : "+doodle.initialPoint.toString(),
        style: textTheme.body2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 8.0,
      ),
      Text(
        "Bitiş noktası : "+doodle.finishPoint.toString(),
        style: textTheme.body2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 8.0,
      ),
      Text(
        "Uzunluk : "+doodle.length.toString(),
        style: textTheme.body2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 8.0,
      ),
      Text(
        "Genişlik : "+doodle.width.toString(),
        style: textTheme.body2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 8.0,
      ),
      Text(
       "Moment : "+ doodle.moment.toString(),
        style: textTheme.body2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 8.0,
      ),
      Text(
        "Atılabilir : " + doodle.throwout.toString(),
        style: textTheme.body2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 8.0,
      ),
    ];
  }
}

Doodle _addNewPallet() {
  Doodle newDoodle = new Doodle(
      name: "Duygu",
      weight: 1,
      arm: 2,
      initialPoint: 3,
      finishPoint: 4,
      length: 2,
      width: 3,
      moment: 4,
      throwout: false,
      icon: Icon(Icons.star, color: Colors.white),
      iconBackground: Colors.cyan);

  return newDoodle;
}

void _deleteItem(BuildContext context, Doodle doodle) {
  showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: Stack(
                  children: <Widget>[
                    palletInfoWidget(context, doodle),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.red,
                                      onPressed: () {
                                        Provider.of<PalletCargoProvider>(
                                                context)
                                            .deleteDoodle(doodle);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Sil',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.blue,
                                      onPressed: () {
                                        // doodles.remove(doodle);
                                        Provider.of<PalletCargoProvider>(
                                                context)
                                            .deleteDoodle(doodle);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Kaydet',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Align(
                      // These values are based on trial & error method
                      alignment: Alignment(1.05, -1.05),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.close,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
}

Widget palletInfoWidget(BuildContext context, Doodle doodle) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: drawerBackgroundColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.all(8),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5.0,
                  offset: Offset(0.0, 0.75))
            ],
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              doodle.name.toString(),
              style: defaultWhiteTitleStyle,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 7,
                      child: new Text(
                        "Ağırlık  : ",
                        style: defaultWhiteBigStyle,
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [],
                      ),
                    )
                  ],
                ),
                Divider(color: grey, height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 7,
                      child: new Text(
                        "Arm : ",
                        style: defaultWhiteBigStyle,
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [],
                      ),
                    )
                  ],
                ),
                Divider(color: grey, height: 25.0),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 7,
                      child: new Text(
                        "Başlangıç Nok. : ",
                        style: defaultWhiteBigStyle,
                      ),
                    ),
                  ],
                ),
                Divider(color: grey, height: 25.0),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 7,
                      child: new Text(
                        "Bitiş Nok. : ",
                        style: defaultWhiteBigStyle,
                      ),
                    ),
                  ],
                ),
                Divider(color: grey, height: 25.0),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 7,
                      child: new Text(
                        "Uzunluk : ",
                        style: defaultWhiteBigStyle,
                      ),
                    ),
                  ],
                ),
                Divider(color: grey, height: 25.0),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 7,
                      child: new Text(
                        "Genişlik : ",
                        style: defaultWhiteBigStyle,
                      ),
                    ),
                  ],
                ),
                Divider(color: grey, height: 25.0),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 7,
                      child: new Text(
                        "Moment : ",
                        style: defaultWhiteBigStyle,
                      ),
                    ),
                  ],
                ),
                Divider(color: grey, height: 25.0),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 7,
                      child: new Text(
                        "Atılacak : ",
                        style: defaultWhiteBigStyle,
                      ),
                    ),
                  ],
                ),
                Divider(color: grey, height: 25.0),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
