import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/appbar.dart';
import 'package:tablet_app/widgets/common/mainmenu_drawer.dart';

class WABFuel extends StatefulWidget {
  GlobalKey scaffoldKey;

  WABFuel(this.scaffoldKey);

  @override
  _WABFuelState createState() {
    return _WABFuelState();
  }
}

class _WABFuelState extends State<WABFuel> {
  var currentValue = 0;
  List<FocusNode> mod;
  TabController controller;
  List<bool> isAutomatic = [true, false];
  FocusNode atoumatic = FocusNode();
  FocusNode manuel = FocusNode();
  Alignment _alignment = Alignment.center;
  Color _animatedColorAuto = Colors.blue;
  bool _isAnimatedAuto = false;
  double _animatedWidthAuto = 400.0;
  double _iconHeightAuto = 20.0;
  double _iconWidthAuto = 180.0;
  Color _animatedColorManu = Colors.blue;
  bool _isAnimatedManu = false;
  double _animatedWidthManu = 400.0;
  double _iconHeightManu = 20.0;
  double _iconWidthManu = 180.0;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return body(context, size);
  }

  Widget body(BuildContext context, Size size) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return _buildVerticalLayout(context, size);
    } else {
      return _buildHorizontalLayout(context, size);
    }
  }

  Widget _buildVerticalLayout(BuildContext context, Size size) {
    return Container(
      width: size.width,
      height: size.height,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start ,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[upToDateInfo(), mode()],
                    ),
                    Container(
                      width: size.width,
                      child: totalInfoWidget(),
                    )
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalLayout(BuildContext context, Size size) {
    return Container(
      width: size.width,
      height: size.width,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start ,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[upToDateInfo(), mode()],
                    ),
                    totalInfoWidget(),
                  ],
                ),
              ),
              automatic()
            ],
          ),
        ],
      ),
    );
  }

  totalInfoWidget() {
    return Container(
      margin: EdgeInsets.all(20),
      width: 500,
      height: 210,
      child: Card(
        elevation: 20,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular((15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const ListTile(
              title: Text(
                "Toplam Bilgiler",
                style: defaultWhiteTitleStyle,
              ),
            ),
            Divider(
              thickness: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.local_florist),
                    Text("Toplam Uçuş Ekibi"),
                    Text("5")
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.local_florist),
                    Text("Ağırlık"),
                    Text("5")
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.local_florist),
                    Text("Moment"),
                    Text("5")
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.local_florist),
                    Text("Ortalama Arm"),
                    Text("5")
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  upToDateInfo() {
    return Container(
      margin: EdgeInsets.all(20),
      width: 270,
      height: 210,
      child: Card(
        elevation: 20,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const ListTile(
              leading: Icon(
                Icons.info,
              ),
              title: Text("Güncel Bilgiler"),
            ),
            Divider(
              thickness: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Azami Yakıt Ağırlığı:",
                        style: defaultWhiteBigStyle,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "5000,45 kg",
                        style: defaultWhiteBigStyle,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sıfır Yakıt Ağırlığı:",
                        style: defaultWhiteBigStyle,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "13270 kg",
                        style: defaultWhiteBigStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular((15))),
      ),
    );
  }

  mode() {
    return Container(
      margin: EdgeInsets.all(20),
      width: 200,
      height: 210,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(26.0),
              ),
              color: _animatedColorAuto,
            ),
            duration: Duration(seconds: 0),
            curve: Curves.fastOutSlowIn,
            child: AnimatedContainer(
              height: _iconHeightAuto,
              width: _iconWidthAuto,
              duration: Duration(seconds: 0),
              curve: Curves.fastOutSlowIn,
              alignment: _alignment,
              child: AnimatedContainer(
                  duration: Duration(seconds: 0),
                  curve: Curves.fastOutSlowIn,
                  child: FlatButton(
                    child: Text("Otomatik"),
                    onPressed: () {
                      changeButton(0);
                    },
                  )),
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 0),
            curve: Curves.fastOutSlowIn,
            child: AnimatedContainer(
              height: _iconHeightManu,
              width: _iconWidthManu,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(26.0),
                ),
                color: _animatedColorManu,
              ),
              duration: Duration(seconds: 0),
              curve: Curves.fastOutSlowIn,
              alignment: _alignment,
              child: AnimatedContainer(
                  duration: Duration(seconds: 0),
                  curve: Curves.fastOutSlowIn,
                  child: FlatButton(
                    child: Text("Manuel"),
                    onPressed: () {
                      changeButton(1);
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void changeButton(int buttonIndex) {
    if (buttonIndex == 0) {
      _isAnimatedManu = true;
      _isAnimatedAuto = false;
    } else {
      _isAnimatedManu = false;
      _isAnimatedAuto = true;
    }
    manuelBtn();
    autoBtn();

    setState(() {});
  }

  void manuelBtn() {
    _animatedWidthManu == 400.0
        ? _isAnimatedManu = true
        : _isAnimatedManu = false;
    _isAnimatedManu
        ? _alignment = Alignment.topCenter
        : _alignment = Alignment.center;
    _isAnimatedManu ? _animatedWidthManu = 200.0 : _animatedWidthManu = 400.0;
    _isAnimatedManu
        ? _animatedColorManu = Colors.lightBlue
        : _animatedColorManu = Colors.grey;
    _isAnimatedManu ? _iconWidthManu = 175.0 : _iconWidthManu = 160.0;
    _isAnimatedManu ? _iconHeightManu = 50.0 : _iconHeightManu = 50.0;
  }

  void autoBtn() {
    _animatedWidthAuto == 400.0
        ? _isAnimatedAuto = true
        : _isAnimatedAuto = false;
    _isAnimatedAuto
        ? _alignment = Alignment.topCenter
        : _alignment = Alignment.center;
    _isAnimatedAuto ? _animatedWidthAuto = 200.0 : _animatedWidthAuto = 400.0;
    _isAnimatedAuto
        ? _animatedColorAuto = Colors.lightBlue
        : _animatedColorAuto = Colors.grey;
    _isAnimatedAuto ? _iconWidthAuto = 175.0 : _iconWidthAuto = 160.0;
    _isAnimatedAuto ? _iconHeightAuto = 50.0 : _iconHeightAuto = 50.0;
  }

  automatic() {
    return Flexible(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Scrollbar(
            child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    isVisible
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 5.0),
                                color: grey,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Yakıt Dağılımı',
                                  style: defaultWhiteBigStyle,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 5.0),
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(0.0),
                                  ),
                                  border: Border.all(
                                    color: grey,
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.3,
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 0.0, 20.0, 0.0),
                                          child: new Text(
                                            'Yakıt Yoğunluğu',
                                            style: defaultWhiteStyle,
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 8,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(color: grey, height: 8.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.3,
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 0.0, 20.0, 0.0),
                                          child: new Text(
                                            'Yakıt Miktarı',
                                            style: defaultWhiteStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        RaisedButton(
                                          color: Colors.white70,
                                          splashColor: selectedColor,
                                          animationDuration:
                                              Duration(seconds: 5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(13.0),
                                            side:
                                                BorderSide(color: Colors.black),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Yakıtı Dağıt"),
                                            ],
                                          ),
                                          onPressed: () {},
                                        ),
                                        RaisedButton(
                                          color: Colors.white70,
                                          splashColor: selectedColor,
                                          animationDuration:
                                              Duration(seconds: 5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(13.0),
                                            side:
                                                BorderSide(color: Colors.black),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Maks. Yakıtı Dağıt"),
                                            ],
                                          ),
                                          onPressed: () {
                                            setState(() {});
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 5.0),
                      color: grey,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Yakıt Tankı',
                        style: defaultWhiteBigStyle,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 5.0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0.0),
                          ),
                          border: Border.all(
                            color: white,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LH - Fuel Tank',
                              style: greyBigStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Hacim",
                                    style: defaultWhiteBigStyle,
                                  ),
                                  Text(
                                    "457 lt",
                                    style: defaultWhiteBigStyle,
                                  ),
                                ]),
                            Divider(color: grey, height: 20.0),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ağırlık",
                                    style: defaultWhiteBigStyle,
                                  ),
                                  Row(children: [
                                    Text(
                                      " kg /",
                                      style: defaultWhiteBigStyle,
                                    ),
                                    Text(
                                      " lbs",
                                      style: defaultWhiteBigStyle,
                                    )
                                  ]),
                                ]),
                            Divider(color: grey, height: 20.0),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Arm",
                                    style: defaultWhiteBigStyle,
                                  ),
                                  Text(
                                    "4,57 mt",
                                    style: defaultWhiteBigStyle,
                                  ),
                                ]),
                            Divider(color: grey, height: 20.0),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Moment",
                                    style: defaultWhiteBigStyle,
                                  ),
                                  Text(
                                    "2224,57 kg.mt",
                                    style: defaultWhiteBigStyle,
                                  ),
                                ]),
                          ],
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 5.0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0.0),
                          ),
                          border: Border.all(
                            color: white,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'RH - Fuel Tank',
                              style: greyBigStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Hacim",
                                    style: defaultWhiteBigStyle,
                                  ),
                                  Text(
                                    "457 lt",
                                    style: defaultWhiteBigStyle,
                                  ),
                                ]),
                            Divider(color: grey, height: 20.0),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ağırlık",
                                    style: defaultWhiteBigStyle,
                                  ),
                                  Row(children: [
                                    Text(
                                      " kg/ ",
                                      style: defaultWhiteBigStyle,
                                    ),
                                    Text(
                                      " lbs",
                                      style: defaultWhiteBigStyle,
                                    )
                                  ]),
                                ]),
                            Divider(color: grey, height: 20.0),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Arm",
                                    style: defaultWhiteBigStyle,
                                  ),
                                  Text(
                                    "4,57 mt",
                                    style: defaultWhiteBigStyle,
                                  ),
                                ]),
                            Divider(color: grey, height: 20.0),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Moment",
                                    style: defaultWhiteBigStyle,
                                  ),
                                  Text(
                                    "2224,57 kg.mt",
                                    style: defaultWhiteBigStyle,
                                  ),
                                ]),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 5.0),
                      color: grey,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Ara Toplam Bilgileri',
                        style: defaultWhiteBigStyle,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 0, 5.0),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0.0),
                        ),
                        border: Border.all(
                          color: white,
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ])),
      ),
    );
  }
}
