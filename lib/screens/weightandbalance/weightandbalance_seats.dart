import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablet_app/util/wabitems/WABItemSeat.dart';
import 'package:tablet_app/util/weightandbalanceprovider.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/weightpickerdialog.dart';
import 'package:tablet_app/widgets/weightandbalance/infowidget.dart';

class WABSeats extends StatelessWidget {
  GlobalKey scaffoldKey;

  WABSeats(this.scaffoldKey);

  List seatList;
  var currentValue = 0;
  var seatColor = Colors.grey;
  WABProvider provider;
  static List<WABItemSeat>  selectedIndexList = new List();

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<WABProvider>(context);
    seatList = provider.getSeats();

    return body(context);
  }


  Widget body(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double infoheight = size.height / 7;
    return Column(
      children: <Widget>[
        Flexible(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Scrollbar(
              child: seats(context),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Divider(color: white, height: 25.0),
            infoRow(selectedIndexList, selectedIndexList , infoheight)
          ],
        ),

      ],
    );
  }

  Widget seats(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 50) / 2;
    final double itemWidth = (size.width);
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Center(
        child: GridView.builder(
            itemCount: seatList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: itemWidth / itemHeight,
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 8),
            itemBuilder: (ctx, index) => Container(
              child: Card(
                child: FlatButton(
                  onLongPress: () {
                    showPickerDialog(context, index);
                  },
                  onPressed: () {
                    if (!selectedIndexList.contains(seatList[index])) {
                      selectedIndexList.add(seatList[index]);
                      provider.getSeats()[index].multiLoadable = true;
                    } else {
                      selectedIndexList.remove(seatList[index]);
                      provider.getSeats()[index].multiLoadable = false;
                    }
                    (context as Element).markNeedsBuild();
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          seatList[index].id.toString(),
                          style: normalBoldTextStyle,
                        ),
                        Text(seatList[index].weight.toString() + " kg"),
                        Text(seatList[index].startArm.toString() + " mt"),
                      ],
                    ),
                  ),
                ),
                color:  provider.getSeats()[index].multiLoadable
                    ? Colors.blue
                    : Colors.grey,
              ),
            )),
      ),
    );
  }
}
