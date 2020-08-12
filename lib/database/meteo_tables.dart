import 'package:moor_flutter/moor_flutter.dart';

//TODO: tables.dart dosyasındaki tablolar da buraya eklenecek sonradan..

@DataClassName('meteo_taf')
class MeteoTaf extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get icao => text().nullable()();
  DateTimeColumn get forecasttime => dateTime().nullable()();
  DateTimeColumn get periodbegin => dateTime().nullable()();
  DateTimeColumn get periodend => dateTime().nullable()();
  TextColumn get winddir => text().nullable()();
  RealColumn get windspeed => real().nullable()();
  RealColumn get gust => real().nullable()();
  TextColumn get cavok => text().nullable()();
  TextColumn get horvis => text().nullable()();
  TextColumn get ww1 => text().nullable()();
  TextColumn get ww2 => text().nullable()();
  TextColumn get ww3 => text().nullable()();
  TextColumn get cld1amount => text().nullable()();
  TextColumn get cld1type => text().nullable()();
  IntColumn get cld1height => integer().nullable()();
  TextColumn get cld2amount => text().nullable()();
  TextColumn get cld2type => text().nullable()();
  IntColumn get cld2height => integer().nullable()();
  TextColumn get cld3amount => text().nullable()();
  TextColumn get cld3type => text().nullable()();
  IntColumn get cld3height => integer().nullable()();
  TextColumn get cld4amount => text().nullable()();
  TextColumn get cld4type => text().nullable()();
  IntColumn get cld4height => integer().nullable()();
  RealColumn get maxtemp => real().nullable()();
  IntColumn get maxtemphour => integer().nullable()();
  RealColumn get mintemp => real().nullable()();
  IntColumn get mintemphour => integer().nullable()();
  TextColumn get taf => text().nullable()();
  TextColumn get lcldata => text().nullable()();
  TextColumn get lclmtoexpert => text().nullable()();
  IntColumn get airfieldid => integer().nullable()();
}