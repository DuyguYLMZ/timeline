import 'dart:wasm';

class AircommModel{
  String airportIdentifier;
  String airportName;
  String commType;
  double transmitFreq;

  AircommModel(this.airportIdentifier, this.airportName, this.commType, this.transmitFreq);

}

final aircommList = [
  AircommModel('LTBJ','ADNAN MENDERES','APP', 119.45),
  AircommModel('LTBJ','ADNAN MENDERES','GND', 121.9),
  AircommModel('LTFD','BALIKESIR KOCA SEYIT','ATI',129.2),
  AircommModel('LTFD','BALIKESIR KOCA SEYIT','EMR',123.1),
];

