import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('Meteo_Wrapper')
class MeteoWrapper extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get winddir => real().nullable()();
  RealColumn get vardir => real().nullable()();
  RealColumn get windextdir => real().nullable()();
  RealColumn get varextdir => real().nullable()();
  DateTimeColumn get observationtime => dateTime().nullable()();
  RealColumn get windspeedinknots => real().nullable()();
  RealColumn get windgust => real().nullable()();
  RealColumn get temperature => real().nullable()();
  RealColumn get qnh => real().nullable()();
  TextColumn get metar => text().nullable()();
  TextColumn get horvis => text().nullable()();
  BoolColumn get cavok => boolean().nullable()();
  TextColumn get lowestbasecloud => text().nullable()();
  RealColumn get relativehumidity => real().nullable()();
  TextColumn get flightrulecolorcode => text().nullable()();
  IntColumn get meteo_metar_icao => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES meteo_metar(id)')();
}

@DataClassName('Meteo_Metar')
class MeteoMetar extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get icao => text().named('desc')();
}
