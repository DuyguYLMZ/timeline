import 'package:moor_flutter/moor_flutter.dart';
import 'hupgp_tables.dart';
import 'other_tables.dart';

@DataClassName('sms_correction_factor')
class SmsCorrectionFactor extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get materialaircrafttypeid => integer().nullable()();
  IntColumn get rackmaterialaircrafttypeid => integer().nullable()();
  IntColumn get c2rscstationid => integer().nullable()();
  IntColumn get exceptionid => integer().nullable()();
  IntColumn get adjacentc2rscstationno => integer().nullable()();
  IntColumn get loadlevelthreshold => integer().nullable()();
  RealColumn get dragcorrectionfactor => real().nullable()();
  RealColumn get weightcorrectionfactor => real().nullable()();
  //TODO: station_id sütunu şu tablonun id'sine referans veriyor: "aircraft_station" tablosu
  //TODO: o tablo hala oluşturulmadı.
  IntColumn get station_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES aircraft_station(id)')();
}

@DataClassName('sms_id_definition')
class SmsIdDefinition extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get nosefuze_id => integer().nullable()();
  IntColumn get tailfuze_id => integer().nullable()();
  TextColumn get sms_id => text().nullable()();
  //TODO: materialaircraft_typeid sütunu şu tablonun id'sine referans veriyor: "hupgp_z_material_aircraft_type" tablosu
  IntColumn get materialaircraft_typeid => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES hupgp_z_material_aircraft_type(id)')();
}

@DataClassName('sms_template')
class SmsTemplate extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get unitid => integer().nullable()();
  IntColumn get aircrafttypestatictypeid => integer().nullable()();
  TextColumn get templatedata => text().nullable()();
}
