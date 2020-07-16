
class NavaidModel{
  String identifier;
  String name;
  String navaidType;


  NavaidModel(this.identifier, this.name, this.navaidType);
}

final navaidList = [new NavaidModel('MEN', 'MENDERES','TACAN'),
  new NavaidModel('MNI', 'MERZIFON','VOR_DME'),
  new NavaidModel('SYT', 'SIVRIHISAR','TACAN'),
  new NavaidModel('USK', 'USAK','VOR_DME'),
];



