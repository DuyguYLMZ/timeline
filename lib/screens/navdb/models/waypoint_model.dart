class WaypointModel{

  String identifier;
  String name;
  List<String> airwayIdentifiers;



  WaypointModel(this.identifier, this.name, this.airwayIdentifiers);
}

final waypointList = [
  new WaypointModel('ILHAN','ILHAN',<String>['T364','UW71','W71']),
  new WaypointModel('BDR','MILAS BODRUM',<String>['T495','UT495','UW95','W95']),
  new WaypointModel('INB','INEBOLU',<String>['M854']),
  new WaypointModel('TEVDA','TEVDA',<String>['UA285','UM861','A285']),
  new WaypointModel('CRL','CORLU',<String>['UL614','L614']),
  new WaypointModel('CRL','CORLU',<String>['UL614','L614']),
  new WaypointModel('ERHAN','ERHAN',<String>['UA285','UA17','UL605','A17','A285','L605']),
];