class CasModel{

  String name;
  String type;
  String center;
  String classification;
  double lowerLimit;
  double upperLimit;

  CasModel(this.name, this.type, this.center, this.classification, this.lowerLimit, this.upperLimit);
}

final casList = [
  new CasModel('ISTANBUL TCA APP - EAST SOUTH', '', '', '', 0, 5640),
  new CasModel('ISTANBUL TCA APP - EAST CENTER', '', '', '', 0, 5640),
  new CasModel('ISTANBUL TCA APP - WEST FINAL', '', '', '', 0, 3506),
  new CasModel('ISTANBUL TCA APP - GOKCEN', '', '', '', 0, 3506),
  new CasModel('ISTANBUL TCA APP - EAST DIR', '', '', '', 0, 3506),
  new CasModel('ISTANBUL TCA APP - WEST FINAL', '', '', '', 0, 3506),
  new CasModel('CARDAK MTCA', '', '', '', 2439, 6402),
  new CasModel('CARDAK CTLZ', '', '', '', 0, 2439),
  new CasModel('ADANA MTCA', '', '', '', 914, 8536),
  new CasModel('ISTANBUL EAST LOWER SCTR', '', '', '', 0, 5030),
  new CasModel('YALOVA CTLZ', '', '', '', 0, 1524),
];

