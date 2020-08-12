import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/model/weightandbalancemodel/fuel.dart';
import 'package:tablet_app/values/strings.dart';
import 'package:tablet_app/values/theme.dart';

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
  double _iconWidthAuto = 180.0;
  double _iconWidthManu = 180.0;
  static double _densityValue = 0;
  static double _quantityValue = 0;
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _upToDateInfo(),
                      _calculateFuel(),
                    ],
                  ),
                  Container(
                    width: size.width,
                    child: _totalInfoWidget(),
                  )
                ],
              ),
              _tankList(),
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
                    _upToDateInfo(),
                    _totalInfoWidget(),
                  ],
                ),
                Expanded(
                  child: Container(
                      width: size.width,
                      height: size.height,
                      child: Column(
                        children: <Widget>[
                          _calculateFuel(),
                          _tankList(),
                        ],
                      )),
                )
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
      width: _isVertical ? 270 : size.width / 2,
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
      margin: EdgeInsets.all(8),
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
                        child: Text(Strings.AUTOMATIC),
                        onPressed: () {
                          _changeButton(0);
                        },
                      ),
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
                    child: Text(Strings.MANUEL),
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

  _calculateFuel() {
    return Flexible(
      child: Container(
          margin: EdgeInsets.all(8),
          width: size.width,
          height: 210,
          child: Card(
            elevation: 20,
            child: Row(
              children: <Widget>[_mode(), _automaticFuel()],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular((15))),
          )),
    );
  }

  _automaticFuel() {
    return Flexible(
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.hue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(Strings.FUEL_DENSITY, style: defaultWhiteStyle),
                Flexible(
                  child: Slider(
                    activeColor: wabBackgroundColor,
                    min: 0,
                    max: 100,
                    value: _densityValue,
                    onChanged: _isAnimatedManu
                        ? null
                        : (value) {
                      _densityValue = value;
                      (context as Element).markNeedsBuild();
                    },
                  ),
                ),
                Text(_densityValue.ceil().toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(Strings.FUEL_QUANTITY, style: defaultWhiteStyle),
                Flexible(
                  child: Slider(
                    activeColor: wabBackgroundColor,
                    min: 0,
                    max: 100,
                    value: _quantityValue,
                    onChanged: _isAnimatedManu
                        ? null
                        : (value) {
                      _quantityValue = value;
                      (context as Element).markNeedsBuild();
                    },
                  ),
                ),
                Text(_quantityValue.ceil().toString())
              ],
            ),
            new RaisedButton(
                onPressed: _isAnimatedManu ? null : () {},
                child: Text(Strings.LOAD_FUEL)),
            new RaisedButton(
                onPressed: _isAnimatedManu ? null : () {},
                child: Text(Strings.LOAD_ALL_FUEL)),
          ],
        ),
      ),
    );
  }

  _tankList() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: size.width,
            height: size.height / 2,
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
                  subtitle: Row(
                    children: <Widget>[
                      _isAnimatedAuto
                          ? Text(data.weight.toString())
                          : Container(
                        width: 100,
                        height: 20,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: data.weight.toString()),
                        ),
                      ),
                      Text(" lbs\t\t" +
                          data.arm.toString() +
                          " mt\t\t" +
                          data.moment.toString() +
                          " kg.mt"),
                    ],
                  ),
                ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
