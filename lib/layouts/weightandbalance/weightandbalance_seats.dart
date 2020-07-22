import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablet_app/model/weightandbalancemodel/seat.dart';
import 'package:tablet_app/util/weightandbalanceprovider.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/weightpickerdialog.dart';
import 'package:tablet_app/widgets/weightandbalance/infowidget.dart';

class WABSeats extends StatelessWidget {
  GlobalKey scaffoldKey;

  WABSeats(this.scaffoldKey);

  List<Seat> seatList;
  var currentValue = 0;
  var seatColor = Colors.grey;
  Seat seat1A = new Seat();
  Seat seat1B = new Seat();
  Seat seat1C = new Seat();
  Seat seat1D = new Seat();
  Seat seat2A = new Seat();
  Seat seat2B = new Seat();
  Seat seat2C = new Seat();
  Seat seat2D = new Seat();
  Seat seat3A = new Seat();
  Seat seat3B = new Seat();
  Seat seat3C = new Seat();
  Seat seat3D = new Seat();
  Seat seat4A = new Seat();
  Seat seat4B = new Seat();
  Seat seat4C = new Seat();
  Seat seat4D = new Seat();
  Seat seat5A = new Seat();
  Seat seat5B = new Seat();
  Seat seat5C = new Seat();
  Seat seat5D = new Seat();
  Seat seat6A = new Seat();
  Seat seat6B = new Seat();
  Seat seat6C = new Seat();
  Seat seat6D = new Seat();
  Seat seat7A = new Seat();
  Seat seat7B = new Seat();
  Seat seat7C = new Seat();
  Seat seat7D = new Seat();
  Seat seat8A = new Seat();
  Seat seat8B = new Seat();
  Seat seat8C = new Seat();
  Seat seat8D = new Seat();
  Seat seat9A = new Seat();
  Seat seat9B = new Seat();
  Seat seat9C = new Seat();
  Seat seat9D = new Seat();
  WABProvider provider;
  List<int> selectedIndexList;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<WABProvider>(context);
    selectedIndexList = provider.getSelectedSeatIndexList();
    seatList = provider.getSeatList();
    if(seatList==null || seatList.length<1){
      setSeats();
    }

    return body(context);
  }

  void setSeats() {
    seat1A.setName("1A");
    seat1A.setArm(0);
    seat1A.setWeight(0);
    seat1B.setName("1B");
    seat1B.setArm(0);
    seat1B.setWeight(0);
    seat1C.setName("1C");
    seat1C.setArm(0);
    seat1C.setWeight(0);
    seat1D.setName("1D");
    seat1D.setArm(0);
    seat1D.setWeight(0);
    seat2A.setName("2A");
    seat2A.setArm(0);
    seat2A.setWeight(0);
    seat2B.setName("2B");
    seat2B.setArm(0);
    seat2B.setWeight(0);
    seat2C.setName("2C");
    seat2C.setArm(0);
    seat2C.setWeight(0);
    seat2D.setName("2D");
    seat2D.setArm(0);
    seat2D.setWeight(0);
    seat3A.setName("3A");
    seat3A.setArm(0);
    seat3A.setWeight(0);
    seat3B.setName("3B");
    seat3B.setArm(0);
    seat3B.setWeight(0);
    seat3C.setName("3C");
    seat3C.setArm(0);
    seat3C.setWeight(0);
    seat3D.setName("3D");
    seat3D.setArm(0);
    seat3D.setWeight(0);
    seat4A.setName("4A");
    seat4A.setArm(0);
    seat4A.setWeight(0);
    seat4B.setName("4B");
    seat4B.setArm(0);
    seat4B.setWeight(0);
    seat4C.setName("4C");
    seat4C.setArm(0);
    seat4C.setWeight(0);
    seat4D.setName("4D");
    seat4D.setArm(0);
    seat4D.setWeight(0);
    seat5A.setName("5A");
    seat5A.setArm(0);
    seat5A.setWeight(0);
    seat5B.setName("5B");
    seat5B.setArm(0);
    seat5B.setWeight(0);
    seat5C.setName("5C");
    seat5C.setArm(0);
    seat5C.setWeight(0);
    seat5D.setName("5D");
    seat5D.setArm(0);
    seat5D.setWeight(0);
    seat6A.setName("6A");
    seat6A.setArm(0);
    seat6A.setWeight(0);
    seat6B.setName("6B");
    seat6B.setArm(0);
    seat6B.setWeight(0);
    seat6C.setName("6C");
    seat6C.setArm(0);
    seat6C.setWeight(0);
    seat6D.setName("6D");
    seat6D.setArm(0);
    seat6D.setWeight(0);
    seat7A.setName("7A");
    seat7A.setArm(0);
    seat7A.setWeight(0);
    seat7B.setName("7B");
    seat7B.setArm(0);
    seat7B.setWeight(0);
    seat7C.setName("7C");
    seat7C.setArm(0);
    seat7C.setWeight(0);
    seat7D.setName("7D");
    seat7D.setArm(0);
    seat7D.setWeight(0);
    seat8A.setName("8A");
    seat8A.setArm(0);
    seat8A.setWeight(0);
    seat8B.setName("8B");
    seat8B.setArm(0);
    seat8B.setWeight(0);
    seat8C.setName("8C");
    seat8C.setArm(0);
    seat8C.setWeight(0);
    seat8D.setName("8D");
    seat8D.setArm(0);
    seat8D.setWeight(0);
    seat9A.setName("9A");
    seat9A.setArm(0);
    seat9A.setWeight(0);
    seat9B.setName("9B");
    seat9B.setArm(0);
    seat9B.setWeight(0);
    seat9C.setName("9C");
    seat9C.setArm(0);
    seat9C.setWeight(0);
    seat9D.setName("9D");
    seat9D.setArm(0);
    seat9D.setWeight(0);
    addSeat();
  }
  void addSeat() {
    provider.addSeat(seat1A);
    provider.addSeat(seat2A);
    provider.addSeat(seat3A);
    provider.addSeat(seat4A);
    provider.addSeat(seat5A);
    provider.addSeat(seat6A);
    provider.addSeat(seat7A);
    provider.addSeat(seat8A);
    provider.addSeat(seat9A);

    provider.addSeat(seat1B);
    provider.addSeat(seat2B);
    provider.addSeat(seat3B);
    provider.addSeat(seat4B);
    provider.addSeat(seat5B);
    provider.addSeat(seat6B);
    provider.addSeat(seat7B);
    provider.addSeat(seat8B);
    provider.addSeat(seat9B);

    provider.addSeat(seat1C);
    provider.addSeat(seat2C);
    provider.addSeat(seat3C);
    provider.addSeat(seat4C);
    provider.addSeat(seat5C);
    provider.addSeat(seat6C);
    provider.addSeat(seat7C);
    provider.addSeat(seat8C);
    provider.addSeat(seat9C);

    provider.addSeat(seat1D);
    provider.addSeat(seat2D);
    provider.addSeat(seat3D);
    provider.addSeat(seat4D);
    provider.addSeat(seat5D);
    provider.addSeat(seat6D);
    provider.addSeat(seat7D);
    provider.addSeat(seat8D);
    provider.addSeat(seat9D);
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
            infoRow(selectedIndexList, provider.getSeatList(), infoheight)
          ],
        ),
        SizedBox(
          height: 8,
        )
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
                        if (!provider
                            .getSelectedSeatIndexList()
                            .contains(index)) {
                          provider.addSelectedSeatIndexList(index);
                        } else {
                          provider.getSelectedSeatIndexList().remove(index);
                        }
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              seatList[index].name.toString(),
                              style: normalBoldTextStyle,
                            ),
                            Text(seatList[index].weight.toString() + " kg"),
                            Text(seatList[index].arm.toString() + " mt"),
                          ],
                        ),
                      ),
                    ),
                    color: provider.getSelectedSeatIndexList().contains(index)
                        ? Colors.blue
                        : Colors.grey,
                  ),
                )),
      ),
    );
  }
}
