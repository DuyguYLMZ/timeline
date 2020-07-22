import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/custom_dropdownmenu.dart';

class WABWeightCalculation extends StatefulWidget {
  GlobalKey scaffoldKey;

  WABWeightCalculation(this.scaffoldKey);

  @override
  _WABWeightCalculationState createState() {
    return _WABWeightCalculationState();
  }
}

class _WABWeightCalculationState extends State<WABWeightCalculation> {
  var currentValue = 0;
  Size size;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return body(context);
  }

  Widget body(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return _buildVerticalLayout();
    } else {
      return _buildHorizontalLayout();
    }
  }

  Widget _buildVerticalLayout() {
    return Container(
      height: size.height,
      width: size.width,
      child: Scrollbar(
          child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10, 10),
              child: Container(
                child: Column(
                  children: <Widget>[firstColumn(true), secondColumn(true)],
                ),
              ))
        ],
      )),
    );
  }

  Widget _buildHorizontalLayout() {
    return Container(
        height: size.height,
        child: Scrollbar(
            child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0, 0),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          width: size.width / 2.2, child: firstColumn(false)),
                      Container(
                          width: size.width / 2, child: secondColumn(false)),
                    ],
                  ),
                ))
          ],
        )));
  }

  Widget firstColumn(bool isVertical) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                'Meydan Sıcaklığı',
                style: normalTextStyle,
              ),
            ),
            Flexible(
              child: Container(
                width: isVertical ? size.width / 2.5 : size.width / 4,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    fillColor: white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Meydan Sıcaklığı',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                  autofocus: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomDropDownMenu(
                  dropdownValue: currentValue,
                  spinnerItems: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text('C'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text('F'),
                    ),
                  ].cast<DropdownMenuItem<int>>(),
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  }),
            )
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                'Tırmanış Gradienti',
                style: normalTextStyle,
              ),
            ),
            Flexible(
              child: Container(
                width: isVertical ? size.width / 2.5 : size.width / 4,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    fillColor: white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Tırmanış Gradienti',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                  autofocus: false,
                ),
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width / 7,
              alignment: Alignment.centerLeft,
              child: new Text(
                'Flap Durumu',
                style: normalTextStyle,
              ),
            ),
            Container(
                child: CustomDropDownMenu(
                    width: 80,
                    dropdownValue: currentValue,
                    spinnerItems: [
                      DropdownMenuItem(
                        value: 0,
                        child: Text('15'),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text('20'),
                      ),
                    ].cast<DropdownMenuItem<int>>(),
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    }))
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width / 7,
              alignment: Alignment.centerLeft,
              child: new Text(
                'Azami Kalkış Ağırlığı',
                style: normalTextStyle,
              ),
            ),
            Flexible(
              child: Container(
                width: isVertical ? size.width / 2.5 : size.width / 4,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    fillColor: white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Azami Kalkış Ağırlığı',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                  autofocus: false,
                ),
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
      ],
    );
  }

  Widget secondColumn(bool isVertical) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                'Meydan İrtifası',
                style: normalTextStyle,
              ),
            ),
            Flexible(
              child: Container(
                width: isVertical ? size.width / 2.5 : size.width / 4,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    fillColor: white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Meydan İrtifası',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                  autofocus: false,
                ),
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                'Sürüklenme Katsayısı',
                style: normalTextStyle,
              ),
            ),
            Flexible(
              child: Container(
                width: isVertical ? size.width / 2.5 : size.width / 4,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    fillColor: white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Sürüklenme Katsayısı',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                  autofocus: false,
                ),
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width / 7,
              alignment: Alignment.centerLeft,
              child: new Text(
                'Azami Yük Ağırlığı',
                style: normalTextStyle,
              ),
            ),
            Flexible(
              child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Flexible(
                    child: Container(
                      width: isVertical ? size.width / 2.5 : size.width / 4,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          fillColor: white,
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: 'Azami Yük Ağırlığı',
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                        autofocus: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ft',
                      style: normalTextStyle,
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
        Divider(color: grey, height: 25.0),
      ],
    );
  }
}
