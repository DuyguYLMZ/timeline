class WABItemLoadable {
  String _type;
  double _weight;
  double _maxWeight;
  String _dimensions;
  String _labelAlignment;
  String _isAirdropped;
  double _width;
  double _length;

  WABItemLoadable();

  String get dimensions => _dimensions;

  set dimensions(String value) {
    _dimensions = value;
    if(value != null && value != ''){
      _width = double.parse(_dimensions.split(';')[0]);
      _length = double.parse(_dimensions.split(';')[1]);
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

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  String get labelAlignment => _labelAlignment;

  set labelAlignment(String value) {
    _labelAlignment = value;
  }

  String get isAirdropped => _isAirdropped;

  set isAirdropped(String value) {
    _isAirdropped = value;
  }

  get width => _width;

  get length => _length;

  get volume => _width * _length;

}