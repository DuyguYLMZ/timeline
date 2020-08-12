import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('aircraft_station')
class AircraftStation extends Table {
  //TODO: id'si 2 tabloda FK olarak kullanılıyor: "sms_correction_factor" ve "station_configuration" tablolarında:
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text().nullable()();
  IntColumn get stationno => integer().nullable()();
  IntColumn get symetricstation_no => integer().nullable()();
  IntColumn get mappedstationno => integer().nullable()();
  IntColumn get c2rscaircrafttype_stationtypeid => integer().nullable()();
  IntColumn get c2rscaircrafttypeoid => integer().nullable()();
}

@DataClassName('css_template')
class CssTemplate extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get templatename => text().nullable()();
  IntColumn get aircrafttype => integer().nullable()();
  DateTimeColumn get date => dateTime().nullable()();
  TextColumn get templatetype => text().nullable()();
  IntColumn get activesquadron => integer().nullable()();
  //TODO: templatedata sütunu ByteArray olarak verilmiş postgre'de:
  TextColumn get templatedata => text().nullable()();
  BoolColumn get defaulttemplate => boolean().nullable()();
}

@DataClassName('data_frame')
class DataFrame extends Table {
  IntColumn get id => integer().autoIncrement()();
  //TODO: data sütunu ByteArray olarak verilmiş postgre'de:
  TextColumn get data => text().nullable()();
}

@DataClassName('db_info')
class DbInfo extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get version => real().nullable()();
  IntColumn get classification => integer().nullable()();
  DateTimeColumn get creationdate => dateTime().nullable()();
}

@DataClassName('dummy_id_table')
class DummyIdTable extends Table {
  IntColumn get id => integer().autoIncrement()();
}

@DataClassName('gps_almanac')
class GpsAlmanac extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get af0 => real().nullable()();
  RealColumn get af1 => real().nullable()();
  IntColumn get almanacrefweek => integer().nullable()();
  IntColumn get almanacreftime => integer().nullable()();
  RealColumn get argofperigee => real().nullable()();
  IntColumn get dataid => integer().nullable()();
  RealColumn get eccentricity => real().nullable()();
  IntColumn get validity => integer().nullable()();
  RealColumn get inclinationcorrection => real().nullable()();
  RealColumn get meananomalyatreferencetime => real().nullable()();
  RealColumn get rateofrightascension => real().nullable()();
  RealColumn get rightascensionatreferencetime => real().nullable()();
  IntColumn get svhealth => integer().nullable()();
  RealColumn get sqrootofsemimjraxis => real().nullable()();
  IntColumn get svid => integer().nullable()();
}

@DataClassName('local_waypoint')
class LocalWaypoint extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get wptident => text().nullable()();
  TextColumn get countrycode => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get wgsdatum => text().nullable()();
  RealColumn get wgsdlat => real().nullable()();
  RealColumn get wgsdlong => real().nullable()();
  TextColumn get magvar => text().nullable()();
  TextColumn get userloginid => text().nullable()();
  IntColumn get hupgpunitid => integer().nullable()();
  RealColumn get distance => real().nullable()();
  RealColumn get elevation => real().nullable()();
  BoolColumn get isfromdafif => boolean().nullable()();
  //TODO: dataframe sütunu ByteArray olarak tanımlanmış postgre'de:
  TextColumn get dataframe => text().nullable()();
  TextColumn get filename => text().nullable()();
}

@DataClassName('munition_mission')
class MunitionMission extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get platform => text().nullable()();
  TextColumn get variant => text().nullable()();
  TextColumn get planner => text().nullable()();
  TextColumn get missionid => text().nullable()();
  TextColumn get missionname => text().nullable()();
  RealColumn get targetlat => real().nullable()();
  RealColumn get targetlon => real().nullable()();
  DateTimeColumn get updatedate => dateTime().nullable()();
  IntColumn get unitid => integer().nullable()();
  BoolColumn get isactive => boolean().nullable()();
  //TODO: munitionmissiondata sütunu ByteArray olarak tanımlanmış postgre'de:
  TextColumn get munitionmissiondata => text().nullable()();
  IntColumn get mfrid => integer().nullable()();
}

@DataClassName('office_report_form')
class OfficeReportForm extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get usage => text().nullable()();
  TextColumn get reporttype => text().nullable()();
  IntColumn get unitid => integer().nullable()();
  TextColumn get modifiedby => text().nullable()();
  DateTimeColumn get modifydate => dateTime().nullable()();
  //TODO: layutdata sütunu ByteArray olarak tanımlanmış postgre'de:
  TextColumn get layoutdata => text().nullable()();
  IntColumn get aircrafttypeoid => integer().nullable()();
}

@DataClassName('procedure_point')
class ProcedurePoint extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fix => text().nullable()();
  TextColumn get countrycode => text().nullable()();
  TextColumn get datum => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get preparedby => text().nullable()();
  IntColumn get hupgpunitid => integer().nullable()();
  RealColumn get elevation => real().nullable()();
}

@DataClassName('report_form')
class ReportForm extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get usage => text().nullable()();
  IntColumn get unitid => integer().nullable()();
  TextColumn get modifiedby => text().nullable()();
  DateTimeColumn get modifydate => dateTime().nullable()();
  //TODO: layoutdata sütunu ByteArray olarak tanımlanmış postgre'de:
  TextColumn get layoutdata => text().nullable()();
  IntColumn get aircrafttypeoid => integer().nullable()();
}

@DataClassName('suspension_position_mnemonic')
class SuspensionPositionMnemonic extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mnemonic => text().nullable()();
  TextColumn get submnemonic => text().nullable()();
  IntColumn get materialaircraft_typeid => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES hupgp_z_material_aircraft_type(id)')();
}

@DataClassName('upc_data')
class UpcData extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  DateTimeColumn get updatedate => dateTime().nullable()();
  IntColumn get unitid => integer().nullable()();
  IntColumn get parentid => integer().nullable()();
  //TODO: xml sütunu ByteArray olarak tanımlanmış postgre'de:
  TextColumn get xml => text().nullable()();
}