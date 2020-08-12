import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('station_configuration')
class StationConfiguration extends Table {
  // id sütunu FK olarak kullanılıyor: "station_configuration_item" tablosunda:
  IntColumn get id => integer().autoIncrement()();
  IntColumn get stationid => integer().nullable()();
  TextColumn get name => text().nullable()();
  //TODO: station_id sütunu şu tablonun id'sine referans veriyor: "aircraft_station" tablosu
  IntColumn get station_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES aircraft_station(id)')();
}

@DataClassName('station_configuration_item')
class StationConfigurationItem extends Table {
  //TODO: id sütunu FK olarak kullanılıyor ya da referans veriyor: HANGİ TABLO????
  //TODO: bu tabloda "parent_id" sütununda ???
  IntColumn get id => integer().autoIncrement()();
  IntColumn get materialaircrafttypeoid => integer().nullable()();
  TextColumn get materialsmsmnemonic => text().nullable()();
  IntColumn get maxloadamount => integer().nullable()();
  BoolColumn get ammunation => boolean().nullable()();
  //TODO: parent_id sütunu bu tablodaki id sütununa referans veriyor ???:
  IntColumn get parent_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES station_configuration_item(id)')();
  //TODO: station_id sütunu şu tablonun id'sine referans veriyor: "station_configuration" tablosu:
  IntColumn get station_configuration_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES station_configuration(id)')();
}
