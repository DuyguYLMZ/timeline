class CGModel {
  String valueName;
  double valueWeight;
  String valueWeightUnit;
  double valueFWDown;
  double valueFWUp;
  CGModel({
    this.valueName,
    this.valueWeight,
    this.valueWeightUnit,
    this.valueFWDown,
    this.valueFWUp,
  });

  Map<String,dynamic> get map {
    return {
      "valueName": valueName,
      "valueWeight":valueWeight,
      "valueWeightUnit": valueWeightUnit,
      "valueFWDown": valueFWDown,
      "valueFWUp": valueFWUp,
    };
  }
  void set name(String valueName) {
    this.valueName = valueName;
  }

  void set weight(double weight) {
    this.valueWeight = weight;
  }

  void set weightUnit(String weightUnit) {
    this.valueWeightUnit = weightUnit;
  }

  void set fwDown(double fwDown) {
    this.valueFWDown = fwDown;
  }

  void set fwUP(double fwUp) {
    this.valueFWUp = fwUp;
  }

  String get name {
    return valueName;
  }

  double get weight {
    return valueWeight;
  }

  String get weightUnit {
    return valueWeightUnit;
  }

  double get fwDown {
    return valueFWDown;
  }

  double get fwUp {
    return valueFWUp;
  }

}
