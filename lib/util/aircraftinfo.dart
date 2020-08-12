
class AircraftInfo{
  String _loadType;

  double _baseWeight;

  double _baseMoment;

  double _maxTaxiWeight;
  double _taxiWeight;
  double _instantMaxTaxiWeight;

  double _maxTakeOffWeight;
  double _takeOffWeight;
  double _instantMaxTakeOffWeight;

  double _maxZerofuelWeight;
  double _zerofuelWeight;
  double _instantMaxZerofuelWeight;

  double _maxLandingWeight;
  double _landingWeight;
  double _instantMaxLandingWeight;

  double _grossWeight;
  double _operationalEmptyWeight;

  double _minMacPercentage;

  double _maxMacPercentage;

  double _lemac;

  double _mac;

  String _weightUnit;

  String _armUnit;

  String _momentUnit;

  String _lemacUnit;

  String _macUnit;

  double _acLength;

  double _acWingSpan;
  double _flapsDownToUpMomentChange;
  double _gearsDownToUpMomentChange;
  String _fuelLoadCalculator;

  String _fuelTankValidator;

  String _armamentValidator;

  double _instantMoment;
  double _instantWeight;
  double _instantCG;
  double _macPercent;

  AircraftInfo();

  String get armamentValidator => _armamentValidator;

  set armamentValidator(String value) {
    _armamentValidator = value;
  }

  String get fuelTankValidator => _fuelTankValidator;

  set fuelTankValidator(String value) {
    _fuelTankValidator = value;
  }

  String get fuelLoadCalculator => _fuelLoadCalculator;

  set fuelLoadCalculator(String value) {
    _fuelLoadCalculator = value;
  }

  double get gearsDownToUpMomentChange => _gearsDownToUpMomentChange;

  set gearsDownToUpMomentChange(double value) {
    _gearsDownToUpMomentChange = value;
  }

  double get flapsDownToUpMomentChange => _flapsDownToUpMomentChange;

  set flapsDownToUpMomentChange(double value) {
    _flapsDownToUpMomentChange = value;
  }

  double get acWingSpan => _acWingSpan;

  set acWingSpan(double value) {
    _acWingSpan = value;
  }

  double get acLength => _acLength;

  set acLength(double value) {
    _acLength = value;
  }

  String get macUnit => _macUnit;

  set macUnit(String value) {
    _macUnit = value;
  }

  String get lemacUnit => _lemacUnit;

  set lemacUnit(String value) {
    _lemacUnit = value;
  }

  String get momentUnit => _momentUnit;

  set momentUnit(String value) {
    _momentUnit = value;
  }

  String get armUnit => _armUnit;

  set armUnit(String value) {
    _armUnit = value;
  }

  String get weightUnit => _weightUnit;

  set weightUnit(String value) {
    _weightUnit = value;
  }

  double get mac => _mac;

  set mac(double value) {
    _mac = value;
  }

  double get lemac => _lemac;

  set lemac(double value) {
    _lemac = value;
  }

  double get maxMacPercentage => _maxMacPercentage;

  set maxMacPercentage(double value) {
    _maxMacPercentage = value;
  }

  double get minMacPercentage => _minMacPercentage;

  set minMacPercentage(double value) {
    _minMacPercentage = value;
  }

  double get maxLandingWeight => _maxLandingWeight;

  set maxLandingWeight(double value) {
    _maxLandingWeight = value;
  }

  double get maxZerofuelWeight => _maxZerofuelWeight;

  set maxZerofuelWeight(double value) {
    _maxZerofuelWeight = value;
  }


  double get maxTakeOffWeight => _maxTakeOffWeight;

  set maxTakeOffWeight(double value) {
    _maxTakeOffWeight = value;
  }

  double get maxTaxiWeight => _maxTaxiWeight;

  set maxTaxiWeight(double value) {
    _maxTaxiWeight = value;
  }

  double get baseMoment => _baseMoment;

  set baseMoment(double value) {
    _baseMoment = value;
  }

  double get baseWeight => _baseWeight;

  set baseWeight(double value) {
    _baseWeight = value;
  }

  String get loadType => _loadType;

  set loadType(String value) {
    _loadType = value;
  }

  double get landingWeight => _landingWeight;

  set landingWeight(double value) {
    _landingWeight = value;
  }

  double get zerofuelWeight => _zerofuelWeight;

  set zerofuelWeight(double value) {
    _zerofuelWeight = value;
  }

  double get takeOffWeight => _takeOffWeight;

  set takeOffWeight(double value) {
    _takeOffWeight = value;
  }

  double get taxiWeight => _taxiWeight;

  set taxiWeight(double value) {
    _taxiWeight = value;
  }

  double get grossWeight => _grossWeight;

  set grossWeight(double value) {
    _grossWeight = value;
  }

  double get operationalEmptyWeight => _operationalEmptyWeight;

  set operationalEmptyWeight(double value) {
    _operationalEmptyWeight = value;
  }

  double get instantCG => _instantMoment / _instantWeight;

  set instantCG(double value) {
    _instantCG = value;
  }

  double get instantWeight => _instantWeight;

  set instantWeight(double value) {
    _instantWeight = value;
  }

  double get instantMoment => _instantMoment;

  set instantMoment(double value) {
    _instantMoment = value;
  }

  double get macPercent => _macPercent;

  set macPercent(double value) {
    _macPercent = value;
  }

  double get instantMaxLandingWeight => _instantMaxLandingWeight;

  set instantMaxLandingWeight(double value) {
    _instantMaxLandingWeight = value;
  }

  double get instantMaxZerofuelWeight => _instantMaxZerofuelWeight;

  set instantMaxZerofuelWeight(double value) {
    _instantMaxZerofuelWeight = value;
  }

  double get instantMaxTakeOffWeight => _instantMaxTakeOffWeight;

  set instantMaxTakeOffWeight(double value) {
    _instantMaxTakeOffWeight = value;
  }

  double get instantMaxTaxiWeight => _instantMaxTaxiWeight;

  set instantMaxTaxiWeight(double value) {
    _instantMaxTaxiWeight = value;
  }


}