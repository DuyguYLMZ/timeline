
import 'WABItemLoadable.dart';

class WABItem{
  String _type;
  String _id;
  double _weight = 0;
  double _maxWeight;
  String _location;
  String _dimension;
  String _labelAlignment;
  double _startArm;
  double _endArm;
  bool _multiLoadable = false;
  double _y;
  double _x;

  WABItem();

  List<WABItemLoadable> _validItems = new List<WABItemLoadable>();


  String get labelAlignment => _labelAlignment;

  set labelAlignment(String value) {
    _labelAlignment = value;
  }

  String get dimension => _dimension;

  set dimension(String value) {
    _dimension = value;
  }

  String get location => _location;

  set location(String value) {
    _location = value;
    if(value != null && value !=''){
      _x = double.parse(_location.split(';')[0]);
      _y = double.parse(_location.split(';')[1]);
    }
  }

  double get maxWeight => _maxWeight;

  set maxWeight(double value) {
    _maxWeight = value;
  }

  double get weight => _weight;

  set weight(double value) {
    _weight = value;
  }

  String get id=> _id;

  set id(String value) {
    _id = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  double get endArm => _endArm;

  set endArm(double value) {
    _endArm = value;
  }

  double get startArm => _startArm;

  set startArm(double value) {
    _startArm = value;
  }

  bool get multiLoadable => _multiLoadable;

  set multiLoadable(bool value) {
    _multiLoadable = value;
  }

  List<WABItemLoadable> get validItems => _validItems;

  double get y => _y;

  double get x => _x;
}