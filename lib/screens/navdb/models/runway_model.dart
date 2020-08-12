
class RunwayModel{
  String airportName;
  String airportIdentifier;
  String identifier;
  double length;
  double width;
  double slopeTdz;
  String surfaceComposition;

  RunwayModel(this.airportName, this.airportIdentifier, this.identifier, this.length, this.width, this.slopeTdz, this.surfaceComposition);
}

final runwayList = [
  new RunwayModel('ADNAN MENDERES','LTBJ','34L',100,60,0.8,'H'),
  new RunwayModel('MILAS BODRUM','LTFE','10R',100,60,0.8,'H'),
  new RunwayModel('GAZIEMIR','LTBK','23L',100,60,0.8,'H'),
  new RunwayModel('MERZIFON','LTAP','23R',100,60,0.8,'H'),
];
