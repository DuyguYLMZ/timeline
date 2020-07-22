import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/custom_dropdownmenu.dart';

class WABBasicConfiguration extends StatefulWidget {
  GlobalKey scaffoldKey;

  WABBasicConfiguration(this.scaffoldKey);

  @override
  _WABBasicConfigurationState createState() {
    return _WABBasicConfigurationState();
  }
}

class _WABBasicConfigurationState extends State<WABBasicConfiguration> {
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
                children: [
                  Container(
                    width: size.width / 2.2,
                    child:firstColumn(false)
                  ),
                  Container(
                    width: size.width / 2,
                    child: secondColumn(false)
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
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
                  children: <Widget>[
                    firstColumn(true),
                    secondColumn(true)
                  ],
                ),
              ))
        ],
      )),
    );
  }


  Widget firstColumn(bool isVertical){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: isVertical ?size.width / 3.3: size.width / 7,
              child: new Text(
                'Uçak Adı', style: defaultWhiteStyle,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                'CN-235 Ulaştıma Uçağı', style: greyStyle,
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
              width: isVertical ?size.width / 3.3: size.width / 7,
              child: new Text(
                'Yük Tipi', style: defaultWhiteStyle,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomDropDownMenu(
                      width: 170,
                      dropdownValue: currentValue,
                      spinnerItems: [
                        DropdownMenuItem(
                          value: 0,
                          child: Text('Passenger'),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Cargo'),
                        ),
                      ].cast<DropdownMenuItem<int>>(),
                      onChanged: (value) {
                        setState(() {
                          currentValue = value;
                        });
                      })
                ],
              ),
            )
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 7,
              child: new Text(
                'Kuyruk Numarası', style: defaultWhiteStyle,
              ),
            ),
            Container(
              child: CustomDropDownMenu(
                  width: 170,
                  dropdownValue: currentValue,
                  spinnerItems: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text('1'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text('2'),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 7,
              child: new Text(
                'Temel Ağırlık', style: defaultWhiteStyle,
              ),
            ),
            Flexible(
              child: Container(
                width: size.width/4,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    fillColor: white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Temel Ağırlık',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                  autofocus: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'kg', style: defaultWhiteStyle,
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 7,
              child: new Text(
                'Temel Moment', style: defaultWhiteStyle,
              ),
            ),
            Flexible(
              child: Container(
                width: size.width/4,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    fillColor: white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Temel Moment',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                  autofocus: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'kg.mt', style: defaultWhiteStyle,
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 7,
              child: new Text(
                'Temel CG', style: defaultWhiteStyle,
              ),
            ),  Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                '10,299', style: greyStyle,
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 7,
              child: new Text(
                'Temel %MAC', style: defaultWhiteStyle,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                '27,65', style: greyStyle,
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
      ],
    );
  }
  Widget secondColumn(bool isVertical){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 5,
              child: new Text(
                'Azami Taksi Ağırlığı', style: defaultWhiteStyle,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                '16550', style: greyStyle,
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 5,
              child: new Text(
                'Azami Kalkış Ağırlığı', style: defaultWhiteStyle,
              ),
            ),  Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                '16550', style: greyStyle,
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 5,
              child: new Text(
                'Azami Sıfır Ağırlık', style: defaultWhiteStyle,
              ),
            ),  Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                '16550', style: greyStyle,
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 5,
              child: new Text(
                'Azami İniş Ağırlığı', style: defaultWhiteStyle,
              ),
            ),  Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                '16550', style: greyStyle,
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 5,
              child: new Text(
                'CG(%MAC) Değişim Aralığı', style: defaultWhiteStyle,
              ),
            ),  Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                '%16.0 - %30.0', style: greyStyle,
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 5,
              child: new Text(
                'MAC', style: defaultWhiteStyle,
              ),
            ),  Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                '2,561', style: greyStyle,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                'mt', style: greyStyle,
              ),
            ),
          ],
        ),
        Divider(color: grey, height: 25.0),
        Row(
          children: [
            Container(
              width: isVertical ?size.width / 3.3: size.width / 5,
              child: new Text(
                'LEMAC', style: defaultWhiteStyle,
              ),
            ),Container(
              alignment: Alignment.centerLeft,
              width: size.width / 7,
              child: new Text(
                '2,561', style: greyStyle,
              ),
            ),
            CustomDropDownMenu(
                width: 70,
                dropdownValue: currentValue,
                spinnerItems: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text('mt'),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Text('mt'),
                  ),
                ].cast<DropdownMenuItem<int>>(),
                onChanged: (value) {
                  setState(() {
                    currentValue = value;
                  });
                })
          ],
        ),
        Divider(color: grey, height: 25.0),
      ],
    );
  }
}
