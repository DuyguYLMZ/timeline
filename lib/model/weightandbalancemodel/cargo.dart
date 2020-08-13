class Cargo{
  int _id;
  String _name;
  double _weight;
  double _arm;
  double _moment;
  double _size;

  Cargo(this._name, this._weight, this._arm,this._moment);

  String get name => _name;

  void setName(String value) {
    _name = value;
  }

  double get arm => _arm;

  void setArm(double value) {
    _arm = value;
  }

  double get weight => _weight;

  void setWeight(double value) {
    _weight = value;
  }

  int get id => _id;

  void setId(int value) {
    _id = value;
  }

  double get moment => _moment;

  void setMoment(double value) {
    _moment = value;
  }

  double get size => _size;

  void setSize(double value) {
    _size = value;
  }


}