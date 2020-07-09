class RasSaaModel{

  String identifier;
  String name;
  String type;
  String validFrom;
  String validTo;
  double lowerLimit;
  double upperLimit;
  
  RasSaaModel(this.identifier, this.name, this.type, this.validFrom, this.validTo, this.lowerLimit, this.upperLimit);
}

final rassaaList = [
  new RasSaaModel('(LTP3)', '(MURTED CTR)', 'P', '11MAY2018', '', 0, 1676),
  new RasSaaModel('LTD12', '(MERZIFON)', 'D', '24EKI1993', '', 0, 8231),
  new RasSaaModel('LTR2', 'GOLBASI 2', 'R', '09MAR1997', '', 0, 1676),
  new RasSaaModel('LTD18', 'KONYA/KARAPINAR', 'D', '24EKI1993', '', 0, 10060),
  new RasSaaModel('LTD18', 'ANKARA', 'R', '30MAR2003', '', 0, 6859),
];