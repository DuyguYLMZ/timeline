import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'Provider.dart';
import 'data.dart';
import 'package:provider/provider.dart';

/*class TimelinePage extends StatefulWidget  {
  TimelinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}*/

class TimelinePage extends StatelessWidget  with ChangeNotifier {
  final PageController pageController =
      PageController(initialPage: 1, keepPage: true);
  int pageIx = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Provider.of<DataProvider>(context).addDoodle(_addNewPallet());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: timelineModel(TimelinePosition.Left),
    );
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
      itemBuilder: centerTimelineBuilder,
      itemCount: doodles.length,
      physics: BouncingScrollPhysics(),
      position: position);

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final doodle = doodles[i];
    final textTheme = Theme.of(context).textTheme;
    return TimelineModel(
        FlatButton(
          onPressed: () {
              DeleteItemCustomDialogWithImage(context, doodle);

          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
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
                ],
              ),
            ),
          ),
        ),
        position:
            i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
        isFirst: i == 0,
        isLast: i == doodles.length,
        iconBackground: doodle.iconBackground,
        icon: doodle.icon);
  }
}

Doodle _addNewPallet() {
  Doodle newDoodle = new Doodle(
      name: "Duygu",
    icon: Icon(Icons.star, color: Colors.white),
      iconBackground: Colors.cyan);

  return newDoodle;
}

void DeleteItemCustomDialogWithImage(BuildContext context, Doodle doodle) {
  Dialog dialogWithImage = Dialog(
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
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ],
            ),
          ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'iptal',
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
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            color: Colors.red,
                            onPressed: () {
                             // doodles.remove(doodle);
                              Provider.of<DataProvider>(context).deleteDoodle(doodle);
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
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    ),
  );

  showDialog(
      context: context, builder: (BuildContext context) => dialogWithImage);
}
