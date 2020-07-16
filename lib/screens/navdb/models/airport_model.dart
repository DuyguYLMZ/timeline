
import 'package:tablet_app/screens/navdb/models/aircomm_model.dart';
import 'package:tablet_app/screens/navdb/models/navaid_model.dart';
import 'package:tablet_app/screens/navdb/models/runway_model.dart';

class AirportModel{

  String identifier;
  String name;
  String shortName;
  String type;
  double elev;
  String icao;
  List<RunwayModel> airportRunways;
  List<AircommModel> airportComms;
  List<NavaidModel> airportNavaids;


  AirportModel(this.identifier, this.name, this.shortName, this.type, this.elev, this.icao, this.airportRunways, this.airportComms, this.airportNavaids);
}

final airportList = [
  new AirportModel('LTBA', 'ESENBOGA', 'ESB', 'H', 30.0, 'LTBA', runwayList, aircommList, navaidList),
  new AirportModel('LTBA', 'ESENBOGA', 'ESB', 'H', 30.0, 'LTBA', runwayList, aircommList, navaidList),
  new AirportModel('LTBA', 'ESENBOGA', 'ESB', 'H', 30.0, 'LTBA', runwayList, aircommList, navaidList),
  new AirportModel('LTBA', 'ESENBOGA', 'ESB', 'H', 30.0, 'LTBA', runwayList, aircommList, navaidList),
  new AirportModel('LTBA', 'ESENBOGA', 'ESB', 'H', 30.0, 'LTBA', runwayList, aircommList, navaidList),
  new AirportModel('LTBA', 'ESENBOGA', 'ESB', 'H', 30.0, 'LTBA', runwayList, aircommList, navaidList),
];



