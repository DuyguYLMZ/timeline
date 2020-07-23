class Seat{
  int _id;
  String _name;
  double _weight;
  double _arm;

  Seat();

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

}