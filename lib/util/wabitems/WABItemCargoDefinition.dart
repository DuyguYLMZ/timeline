
class WABItemCargoDefinition {
  String _suitablePlaceChecker;
  double _maxLoadableLength;
  double _maxLoadableWidth;
  double _lockStep;
  double _startX;
  double _startY;
  double _rampArm;
  double _maxLengthForRamp;
  double _maxWidthForRamp;
  double _maxWeightForRamp;
  String _id;
  double _maxWeight;

  WABItemCargoDefinition();

  double get maxWeight => _maxWeight;

  set maxWeight(double value) {
    _maxWeight = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  double get maxWeightForRamp => _maxWeightForRamp;

  set maxWeightForRamp(double value) {
    _maxWeightForRamp = value;
  }

  double get maxWidthForRamp => _maxWidthForRamp;

  set maxWidthForRamp(double value) {
    _maxWidthForRamp = value;
  }

  double get maxLengthForRamp => _maxLengthForRamp;

  set maxLengthForRamp(double value) {
    _maxLengthForRamp = value;
  }

  double get rampArm => _rampArm;

  set rampArm(double value) {
    _rampArm = value;
  }

  double get startY => _startY;

  set startY(double value) {
    _startY = value;
  }

  double get startX => _startX;

  set startX(double value) {
    _startX = value;
  }

  double get lockStep => _lockStep;

  set lockStep(double value) {
    _lockStep = value;
  }

  double get maxLoadableWidth => _maxLoadableWidth;

  set maxLoadableWidth(double value) {
    _maxLoadableWidth = value;
  }

  double get maxLoadableLength => _maxLoadableLength;

  set maxLoadableLength(double value) {
    _maxLoadableLength = value;
  }

  String get suitablePlaceChecker => _suitablePlaceChecker;

  set suitablePlaceChecker(String value) {
    _suitablePlaceChecker = value;
  }


}