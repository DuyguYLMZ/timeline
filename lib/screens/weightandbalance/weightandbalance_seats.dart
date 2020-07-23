import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/weightpickerdialog.dart';
import 'package:tablet_app/widgets/weightandbalance/infowidget.dart';

class WABSeats extends StatefulWidget {
  GlobalKey scaffoldKey;

  WABSeats(this.scaffoldKey);

  @override
  _WABSeatsState createState() {
    return _WABSeatsState();
  }
}

class _WABSeatsState extends State<WABSeats> {
  var currentValue = 0;

  List<int> selectedIndexList = new List<int>();
  List<String> seatslist = [
    "1A",
    "1B",
    "1C",
    "1D",
    "2A",
    "2B",
    "2C",
    "2D",
    "3A",
    "3B",
    "3C",
    "3D",
    "4A",
    "4B",
    "4C",
    "4D",
    "5A",
    "5B",
    "5C",
    "5D",
    "6A",
    "6B",
    "6C",
    "6D",
    "7A",
    "7B",
    "7C",
    "7D",
    "8A",
    "8B",
    "8C",
    "8D",
    "9A",
    "9B",
    "9C",
    "9D",
  ];
  List<String> weightlist = [
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  " 0",
  ];
  List<String> armlist = [
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
    " 0",
  ];
  var seatColor = Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context) {
    var  size = MediaQuery.of(context).size;
    double infoheight = size.height / 7;
    return Column(
      children: <Widget>[
        Flexible(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Scrollbar(
              child: seats(),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Divider(color: white, height: 25.0),
            infoRow(selectedIndexList, weightlist, armlist, seatslist,infoheight)
          ],
        ),
        SizedBox(height: 8,)
      ],
    );
  }

  Widget seats() {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 50) / 2;
    final double itemWidth = (size.width);
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Center(
        child: GridView.builder(
            itemCount: seatslist.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: itemWidth / itemHeight,
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 8),
            itemBuilder: (ctx, index) => Container(
                  child: Card(
                    child: FlatButton(
                      onLongPress: (){
                        showPickerDialog(context, index);
                      },
                      onPressed: () {
                        setState(() {
                          if (!selectedIndexList.contains(index)) {
                            selectedIndexList.add(index);
                          } else {
                            selectedIndexList.remove(index);
                          }
                        });
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              seatslist[index].toString(),
                              style: normalBoldTextStyle,
                            ),
                            Text(weightlist[index].toString()+ " kg"),
                            Text(armlist[index].toString() + " mt"),
                          ],
                        ),
                      ),
                    ),
                    color: selectedIndexList.contains(index)
                        ? Colors.blue
                        : Colors.grey,
                  ),
                )),
      ),
    );
  }
}
