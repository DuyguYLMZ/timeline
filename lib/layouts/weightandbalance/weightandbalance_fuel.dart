import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/model/weightandbalancemodel/Fuel.dart';
import 'package:tablet_app/values/strings.dart';
import 'package:tablet_app/values/theme.dart';
import 'package:tablet_app/widgets/common/custom_dropdownmenu.dart';

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
  Color _animatedColorManu = Colors.grey;
  bool _isAnimatedAuto = true;
  bool _isAnimatedManu = false;
  double _animatedWidthAuto;
  double _animatedWidthManu;
  double _iconHeightAuto = 20.0;
  double _iconWidthAuto = 180.0;
  double _iconHeightManu = 20.0;
  double _iconWidthManu = 180.0;
  bool _isVisible = true;
  bool _isVertical = true;
  static Fuel fuel1 = new Fuel("Left - Aux Tank", 10, 2.0, 20);
  static Fuel fuel2 = new Fuel("Left - Main Tank", 10, 2.5, 25);
  static Fuel fuel3 = new Fuel("Right - Main Tank", 10, 2.2, 22);
  static Fuel fuel4 = new Fuel("Right - Aux Tank", 10, 1.0, 10);
  List<Fuel> fuelTankList = [fuel1, fuel2, fuel3, fuel4];
  List<FocusNode> focusToggle;
  List<bool> isSelected = [true, false];

  bool isVisible = true;
  bool isVolume = false;
  bool isWeight = true;

  String fuel;

  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();

  @override
  void initState() {
    super.initState();
    focusToggle = [focusNodeButton1, focusNodeButton2];
  }

  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return _body(context, size);
  }

  Widget _body(BuildContext context, Size size) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      _isVertical = true;
      return _buildVerticalLayout(context, size);
    } else {
      _isVertical = false;
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
        alignment: WrapAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _upToDateInfo(),
                      _mode(),
                      _calculateFuel()
                    ],
                  ),
                  Container(
                    width: size.width,
                    child: _totalInfoWidget(),
                  )
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: size.width,
                      height: size.height / 3,
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((15))),
                        child: ListView(
                          padding: EdgeInsets.all(8.0),
                          children: fuelTankList
                              .map((data) => ListTile(
                                    title: Text(data.name),
                                    subtitle: Text(data.weight.toString() +
                                        " lbs" +
                                        "\t\t" +
                                        data.arm.toString() +
                                        " mt" +
                                        "\t\t" +
                                        data.moment.toString() +
                                        " kg.mt"),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
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
      height: size.height,
      child: Wrap(
          spacing: 10,
          runSpacing: 10,
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[_upToDateInfo(), _mode()],
                    ),
                    _totalInfoWidget(),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          height: size.height / 2,
                          child: Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular((15))),
                            child: ListView(
                              padding: EdgeInsets.all(8.0),
                              children: fuelTankList
                                  .map((data) => ListTile(
                                title: Text(data.name),
                                subtitle: Text(
                                    data.weight.toString() +
                                        " lbs" +
                                        "\t\t" +
                                        data.arm.toString() +
                                        " mt" +
                                        "\t\t" +
                                        data.moment.toString() +
                                        " kg.mt"),
                              ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]),
    );
  }

  _totalInfoWidget() {
    return Container(
      margin: EdgeInsets.all(8),
      width: _isVertical ? size.width : size.width / 2,
      height: 210,
      child: Card(
        elevation: 20,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular((15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.local_florist),
                      Text("Toplam"),
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
            ),
          ],
        ),
      ),
    );
  }

  _upToDateInfo() {
    return Container(
      margin: EdgeInsets.all(8),
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

  _mode() {
    return Container(
      margin: EdgeInsets.all(20),
      width: 200,
      height: 210,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            margin: const EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(26.0),
              ),
              color: _animatedColorAuto,
            ),
            duration: Duration(seconds: 0),
            curve: Curves.fastOutSlowIn,
            child: AnimatedContainer(
              width: _autoBtnWidth(),
              duration: Duration(seconds: 0),
              curve: Curves.fastOutSlowIn,
              alignment: _alignment,
              child: AnimatedContainer(
                  duration: Duration(seconds: 0),
                  curve: Curves.fastOutSlowIn,
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Otomatik"),
                        onPressed: () {
                          _changeButton(0);
                        },
                      ),
                      /* Visibility(
                        visible: _isAnimatedAuto,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 120),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  ToggleButtons(
                                    color: white,
                                    selectedColor: Colors.amberAccent,
                                    fillColor: Colors.blueAccent,
                                    splashColor: Colors.blue,
                                    highlightColor: grey,
                                    borderColor: white,
                                    borderWidth: 1.5,
                                    selectedBorderColor: selectedColor,
                                    renderBorder: true,
                                    borderRadius:
                                    BorderRadius.circular(8.0),
                                    disabledColor: Colors.blueGrey,
                                    disabledBorderColor: Colors.blueGrey,
                                    focusColor: Colors.white70,
                                    focusNodes: focusToggle,
                                    children: <Widget>[
                                      Container(
                                          width: (MediaQuery.of(context)
                                              .size
                                              .width -
                                              36) /
                                              5,
                                          child: new Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              new Text(
                                                "Ağırlık",
                                                style: defaultWhiteStyle,
                                              )
                                            ],
                                          )),
                                      Container(
                                          width: (MediaQuery.of(context)
                                              .size
                                              .width -
                                              36) /
                                              5,
                                          child: new Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              new Text("Hacim",
                                                  style:
                                                  defaultWhiteStyle)
                                            ],
                                          )),
                                    ],
                                    isSelected: isSelected,
                                    onPressed: (int index) {
                                      setState(() {
                                        for (int i = 0;
                                        i < isSelected.length;
                                        i++) {
                                          isSelected[i] = i == index;
                                        }
                                        if (isSelected[0]) {
                                          isWeight = true;
                                          isVolume = false;
                                        } else {
                                          isWeight = false;
                                          isVolume = true;
                                        }
                                      });
                                    },
                                  ),
                                ],
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
                                        TextField(
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                            EdgeInsets.all(8),
                                            fillColor: white,
                                            filled: true,
                                            border: OutlineInputBorder(),
                                            hintStyle: TextStyle(
                                                color: Colors.grey),
                                          ),
                                          autofocus: false,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: grey,height: 8.0),
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
                                  Flexible(
                                    child: Container(
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          TextField(
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                              EdgeInsets.all(8),
                                              fillColor: white,
                                              filled: true,
                                              border: OutlineInputBorder(),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey),
                                            ),
                                            autofocus: false,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                           Visibility(
                                             visible: isWeight,
                                                child: Container(
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  CustomDropDownMenu(
                                                      dropdownValue:
                                                      currentValue,
                                                      spinnerItems: [
                                                        DropdownMenuItem(
                                                          value: 0,
                                                          child: Text(
                                                              'lbs'),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: 1,
                                                          child: Text(
                                                              'kg'),
                                                        ),
                                                      ].cast<
                                                          DropdownMenuItem<
                                                              int>>(),
                                                      onChanged:
                                                          (value) {
                                                        setState(() {
                                                          currentValue =
                                                              value;
                                                        });
                                                      })
                                                ],
                                            ),
                                          ),),
                                          Visibility(
                                            visible: isVolume,
                                            child: Text(
                                              "lt",
                                              style:
                                              defaultWhiteBigStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
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
                                    onPressed: () {
                                      setState(() {});
                                    },
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
                                ],
                              )
                            ],
                          ),
                        ),
                      ),*/
                    ],
                  )),
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 0),
            curve: Curves.fastOutSlowIn,
            child: AnimatedContainer(
              width: _manuBtnWidth(),
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
                      _changeButton(1);
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void _changeButton(int buttonIndex) {
    setState(() {
      if (buttonIndex == 0) {
        _isAnimatedManu = false;
        _isAnimatedAuto = true;
      } else {
        _isAnimatedManu = true;
        _isAnimatedAuto = false;
      }
      _manuelBtn();
      _autoBtn();
    });
  }

  void _manuelBtn() {
    _isAnimatedManu
        ? _alignment = Alignment.topCenter
        : _alignment = Alignment.center;
    _isAnimatedManu ? _animatedWidthManu = 200.0 : _animatedWidthManu = 400.0;
    _isAnimatedManu
        ? _animatedColorManu = Colors.lightBlue
        : _animatedColorManu = Colors.grey;
  }

  void _autoBtn() {
    _isAnimatedAuto
        ? _alignment = Alignment.topCenter
        : _alignment = Alignment.center;
    _isAnimatedAuto ? _animatedWidthAuto = 200.0 : _animatedWidthAuto = 400.0;
    _isAnimatedAuto
        ? _animatedColorAuto = Colors.lightBlue
        : _animatedColorAuto = Colors.grey;
  }

  double _manuBtnWidth() {
    return _isAnimatedManu ? _iconWidthManu = 175.0 : _iconWidthManu = 160.0;
  }

  double _autoBtnWidth() {
    return _isAnimatedAuto ? _iconWidthAuto = 175.0 : _iconWidthAuto = 160.0;
  }

  _automatic() {
    return Container(
      margin: EdgeInsets.all(8),
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

  _calculateFuel() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.all(8),
        width: 270,
        height: 210,
        child: Card(
          elevation: 20,
          child:Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(Strings.VOLUME, style: defaultWhiteStyle),
                Slider(
                  activeColor: wabBackgroundColor,
                  min: 0,
                  max: 100,
                  value: 10,
                  onChanged: (value) {
                    (context as Element).markNeedsBuild();

                  },
                )

              ],
            ),

          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular((15))),
        ),
      ),
    );
  }

/* testtt(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: _flexFactor1,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: GestureDetector(
                      child: Container(
                        child: Center(
                          child: Text(
                            'sssss',
                          ),
                        ),
                        margin: const EdgeInsets.all(10.0),
                        color: const Color(0xFF673ab7),
                        width: 10.0,
                        height: 10.0,
                      ),
                      onTap: () => setState(() {
                        _flexFactor1++;
                      }),
                    ),
                  ),
                ),
                Expanded(
                  flex: _flexFactor2,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: GestureDetector(
                      child: Container(
                        child: Center(
                          child: Text(
                            'aaa',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        margin: const EdgeInsets.all(10.0),
                        color: const Color(0xFF009688),
                        width: 48.0,
                        height: 48.0,
                      ),
                      onTap: () => setState(() {
                        _flexFactor2++;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }*/
}
