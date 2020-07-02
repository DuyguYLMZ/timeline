import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/appbar.dart';
import 'package:tablet_app/widgets/common/custom_dropdownmenu.dart';
import 'package:tablet_app/widgets/common/mainmenu_drawer.dart';


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
  int _selectedItem = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3.3,
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                              child: new Text(
                                'Meydan Sıcaklığı',

                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 7,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        fillColor: white,
                                        filled: true,
                                        border: OutlineInputBorder(),
                                        labelText: 'Temel Ağırlık',
                                        labelStyle: TextStyle(color: Colors.grey),
                                        hintText: '50',
                                        hintStyle: TextStyle(color: grey),
                                      ),
                                      autofocus: false,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomDropDownMenu(
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
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(color: grey,height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3.3,
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                              child: new Text(
                                'Tırmanış Gradienti',

                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 7,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  labelText: 'Temel Ağırlık',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  hintText: '50',
                                  hintStyle: TextStyle(color: grey),
                                ),
                                autofocus: false,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: grey,height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3.3,
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                              child: new Text(
                                'Flap Durumu',

                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomDropDownMenu(
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
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(color: grey,height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3.3,
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                              child: new Text(
                                'Azami Kalkış Ağırlığı',

                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 7,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  labelText: 'Temel Ağırlık',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  hintText: '50',
                                  hintStyle: TextStyle(color: grey),
                                ),
                                autofocus: false,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: grey,height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 3.3,
                                padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                                child: new Text(
                                  'Meydan İrtifası',

                                )),
                            Container(
                              width: MediaQuery.of(context).size.width / 7,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  labelText: 'Temel Ağırlık',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  hintText: '50',
                                  hintStyle: TextStyle(color: grey),
                                ),
                                autofocus: false,
                              ),
                            ),
                            Flexible(
                              child: SizedBox(
                                width: 8,
                              ),
                            ),
                            CustomDropDownMenu(
                                dropdownValue: currentValue,
                                spinnerItems: [
                                  DropdownMenuItem(
                                    value: 0,
                                    child: Text(''),
                                  ),
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text(''),
                                  ),
                                ].cast<DropdownMenuItem<int>>(),
                                onChanged: (value) {
                                  setState(() {
                                    currentValue = value;
                                  });
                                }),
                            new Flexible(
                                child: new Container(
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'ft',

                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        Divider(color: grey,height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3.3,
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                              child: new Text(
                                'Sürüklenme Katsayısı',

                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 7,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  labelText: 'Temel Ağırlık',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  hintText: '50',
                                  hintStyle: TextStyle(color: grey),
                                ),
                                autofocus: false,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: grey,height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3.3,
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                              child: new Text(
                                'Azami Yük Ağırlığı',

                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width / 7,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          fillColor: white,
                                          filled: true,
                                          border: OutlineInputBorder(),
                                          labelText: 'Temel Ağırlık',
                                          labelStyle: TextStyle(color: Colors.grey),
                                          hintText: '50',
                                          hintStyle: TextStyle(color: grey),
                                        ),
                                        autofocus: false,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'ft',

                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }

  Widget _buildHorizontalLayout() {
    return Container(
        height: MediaQuery.of(context).size.height,
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
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width:
                                        MediaQuery.of(context).size.width / 7,
                                        child: new Text(
                                          'Meydan Sıcaklığı',

                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width / 7,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  fillColor: white,
                                                  filled: true,
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Temel Ağırlık',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  hintText: '50',
                                                  hintStyle: TextStyle(color: grey),
                                                ),
                                                autofocus: false,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            CustomDropDownMenu(
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
                                                })
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(color: grey,height: 25.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width:
                                        MediaQuery.of(context).size.width / 7,
                                        child: new Text(
                                          'Tırmanış Gradienti',

                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width / 7,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            fillColor: white,
                                            filled: true,
                                            border: OutlineInputBorder(),
                                            labelText: 'Temel Ağırlık',
                                            labelStyle: TextStyle(color: Colors.grey),
                                            hintText: '50',
                                            hintStyle: TextStyle(color: grey),
                                          ),
                                          autofocus: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(color: grey,height: 25.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width / 7,
                                        alignment: Alignment.centerLeft,
                                        child: new Text(
                                          'Flap Durumu',

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
                                  Divider(color: grey,height: 25.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width / 7,
                                        alignment: Alignment.centerLeft,
                                        child: new Text(
                                          'Azami Kalkış Ağırlığı',

                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width / 7,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            fillColor: white,
                                            filled: true,
                                            border: OutlineInputBorder(),
                                            labelText: 'Temel Ağırlık',
                                            labelStyle: TextStyle(color: Colors.grey),
                                            hintText: '50',
                                            hintStyle: TextStyle(color: grey),
                                          ),
                                          autofocus: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(color: grey,height: 25.0),
                                ],
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width:
                                        MediaQuery.of(context).size.width / 7,
                                        child: new Text(
                                          'Meydan İrtifası',

                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width / 7,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  fillColor: white,
                                                  filled: true,
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Temel Ağırlık',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  hintText: '50',
                                                  hintStyle: TextStyle(color: grey),
                                                ),
                                                autofocus: false,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            CustomDropDownMenu(
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
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'ft',

                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(color: grey,height: 25.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width:
                                        MediaQuery.of(context).size.width / 7,
                                        child: new Text(
                                          'Sürüklenme Katsayısı',

                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width / 7,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            fillColor: white,
                                            filled: true,
                                            border: OutlineInputBorder(),
                                            labelText: 'Temel Ağırlık',
                                            labelStyle: TextStyle(color: Colors.grey),
                                            hintText: '50',
                                            hintStyle: TextStyle(color: grey),
                                          ),
                                          autofocus: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(color: grey,height: 25.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width / 7,
                                        alignment: Alignment.centerLeft,
                                        child: new Text(
                                          'Azami Yük Ağırlığı',

                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width / 7,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      fillColor: white,
                                                      filled: true,
                                                      border: OutlineInputBorder(),
                                                      labelText: 'Temel Ağırlık',
                                                      labelStyle: TextStyle(color: Colors.grey),
                                                      hintText: '50',
                                                      hintStyle: TextStyle(color: grey),
                                                    ),
                                                    autofocus: false,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  'ft',

                                                ),
                                              ]),
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(color: grey,height: 25.0),
                                ],
                              )),
                        ],
                      ),
                    ))
              ],
            )));
  }
}
