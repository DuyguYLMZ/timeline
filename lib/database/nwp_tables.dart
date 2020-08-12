import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('nwp_data')
class NwpData extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get forecasttime => dateTime().nullable()();
  IntColumn get datatype => integer().nullable()();
  //TODO: attachmentdata sütunu ByteArray olarak tanımlanmış postgre'de:
  TextColumn get attachmentdata => text().nullable()();
}

@DataClassName('nwp_forecast_time')
class NwpForecastTime extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get forecasttime => dateTime().nullable()();
}