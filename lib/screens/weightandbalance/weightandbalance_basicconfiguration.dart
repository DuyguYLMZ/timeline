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
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width / 7,
                              child: new Text(
                                'Uçak Adı',
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
                              width: MediaQuery.of(context).size.width / 7,
                              child: new Text(
                                'Yük Tipi',
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
                              width: MediaQuery.of(context).size.width / 7,
                              child: new Text(
                                'Kuyruk Numarası',
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
                              width: MediaQuery.of(context).size.width / 7,
                              child: new Text(
                                'Temel Ağırlık',
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
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'kg',
                            ),
                          ],
                        ),
                        Divider(color: grey, height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 7,
                              child: new Text(
                                'Temel Moment',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 7,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      fillColor: white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Temel Moment',
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
                                  'kg.mt',
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(color: grey, height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 7,
                              child: new Text(
                                'Temel CG',
                              ),
                            ),
                          ],
                        ),
                        Divider(color: grey, height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 7,
                              child: new Text(
                                'Temel %MAC',
                              ),
                            ),
                          ],
                        ),
                        Divider(color: grey, height: 25.0),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: new Text(
                                'Azami Taksi Ağırlığı',
                              ),
                            ),

                          ],
                        ),
                        Divider(color: grey, height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: new Text(
                                'Azami Kalkış Ağırlığı',
                              ),
                            ),
                          ],
                        ),
                        Divider(color: grey, height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: new Text(
                                'Azami Sıfır Ağırlık',
                              ),
                            ),

                          ],
                        ),
                        Divider(color: grey, height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: new Text(
                                'Azami İniş Ağırlığı',
                              ),
                            ),

                          ],
                        ),
                        Divider(color: grey, height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: new Text(
                                'CG(%MAC) Değişim Aralığı',
                              ),
                            ),

                          ],
                        ),
                        Divider(color: grey, height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: new Text(
                                'MAC',
                              ),
                            ),
                          ],
                        ),
                        Divider(color: grey, height: 25.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: new Text(
                                'LEMAC',
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomDropDownMenu(
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
                            )
                          ],
                        ),
                        Divider(color: grey, height: 25.0),
                      ],
                    ),
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
                            'Uçak Adı',
                          ),
                        ),
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: new Text(
                            'Yük Tipi',
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
                          width: MediaQuery.of(context).size.width / 3.3,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: new Text(
                            'Kuyruk Numarası',
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
                          width: MediaQuery.of(context).size.width / 3.3,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: new Text(
                            'Temel Ağırlık',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  labelText: 'Temel Ağırlık',
                                  labelStyle: TextStyle(color: Colors.blue),
                                  hintText: '50',
                                  hintStyle: TextStyle(color: grey),
                                ),
                                autofocus: false,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            new Text(
                              'kg',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: new Text(
                            'Temel Moment',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  labelText: 'Temel Moment',
                                  labelStyle: TextStyle(color: Colors.blue),
                                  hintText: '50',
                                  hintStyle: TextStyle(color: grey),
                                ),
                                autofocus: false,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            new Text(
                              'kg.mt',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: new Text(
                            'Temel CG',
                          ),
                        ),
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 3.3,
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                            child: new Text(
                              'Temel %MAC',
                            )),
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: new Text(
                            'Azami Taksi Ağırlığı',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SizedBox(
                              width: 8,
                            ),
                            new Text(
                              'kg',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 3.3,
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                            child: new Text(
                              'Azami Kalkış Ağırlığı',
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SizedBox(
                              width: 8,
                            ),
                            new Text(
                              'kg',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: new Text(
                            'Azami Sıfır Ağırlığı',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            new Text(
                              'kg',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: new Text(
                            'Azami İniş Ağırlığı',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            new Text(
                              'kg',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: new Text(
                            'CG(%MAC) Değişim Aralığı',
                          ),
                        ),
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: new Text(
                            'MAC',
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              CustomDropDownMenu(
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
                        )
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.3,
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: new Text(
                            'LEMAC',
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SizedBox(
                              width: 8,
                            ),
                            CustomDropDownMenu(
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
                      ],
                    ),
                    Divider(color: grey, height: 25.0),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
