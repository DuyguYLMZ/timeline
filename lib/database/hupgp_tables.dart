import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('hupgp_flightroute')
class HupgpFlightroute extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get hupgpunitid => integer().nullable()();
  TextColumn get nickname => text().nullable()();
  DateTimeColumn get ldtime => dateTime().nullable()();
  DateTimeColumn get totime => dateTime().nullable()();
  BoolColumn get iscalculated => boolean().nullable()();
  TextColumn get preparedby => text().nullable()();
  BoolColumn get istemplate => boolean().nullable()();
  DateTimeColumn get dafifdate => dateTime().nullable()();
  TextColumn get flightroutedata => text().nullable()();
  IntColumn get toairfield => integer().nullable()();
  IntColumn get ldairfield => integer().nullable()();
}

@DataClassName('hupgp__mission_flight_route')
class HupgpMissionFlightRoute extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get aircrafttypeid => integer().nullable()();
  DateTimeColumn get creationdate => dateTime().nullable()();
  DateTimeColumn get modificationdate => dateTime().nullable()();
  BoolColumn get issmallinlet => boolean().nullable()();
  TextColumn get missionname => text().nullable()();
  IntColumn get hupgpunitid => integer().nullable()();
  TextColumn get preparedby => text().nullable()();
  TextColumn get missionflightroutedata => text().nullable()();
}

@DataClassName('hupgp_z_material_aircraft_type')
class HupgpZMaterialAircraftType extends Table {
  // id'si FK olarak kullanılıyor BİRDEN FAZLA tabloda: "material_fuze_pair"(tanımlandı), "sms_id_definition"(tanımlandı) ve suspension_position_mnemonic"(tanımlandı) tablolarında
  IntColumn get id => integer().autoIncrement()();
  IntColumn get c2rsc_material_aircraft_type_id => integer().nullable()();
  IntColumn get c2rsc_material_id => integer().nullable()();
  TextColumn get sms_mnemonic => text().nullable()();
  RealColumn get drag => real().nullable()();
  RealColumn get c2rsc_drag => real().nullable()();
  RealColumn get weight => real().nullable()();
  IntColumn get max_load_amount => integer().nullable()();
  TextColumn get name_mm_pp => text().nullable()();
  TextColumn get type_mm => text().nullable()();
  BoolColumn get isbomb => boolean().nullable()();
  BoolColumn get isammunition => boolean().nullable()();
  BoolColumn get issuspension => boolean().nullable()();
  BoolColumn get ispod => boolean().nullable()();
  BoolColumn get istank => boolean().nullable()();
  BoolColumn get isbullet => boolean().nullable()();
  BoolColumn get ischaff => boolean().nullable()();
  BoolColumn get isflare => boolean().nullable()();
  BoolColumn get isdeleted => boolean().nullable()();
  BoolColumn get isairtoground => boolean().nullable()();
  BoolColumn get issuitableammunition => boolean().nullable()();
  TextColumn get tank_capacity_unit => text().nullable()();
  RealColumn get tank_capacity => real().nullable()();
  IntColumn get suspension_load_capacity => integer().nullable()();
  TextColumn get ammunition_class_name => text().nullable()();
  IntColumn get aircraft_type_id => integer().nullable()();
  TextColumn get weight_unit => text().nullable()();
  TextColumn get ammunition_direction_type => text().nullable()();
  BoolColumn get classicalmunition => boolean().nullable()();
  BoolColumn get localmunition => boolean().nullable()();
}