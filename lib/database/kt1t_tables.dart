import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('kt1t_waypoint_templates')
class Kt1tWaypointTemplates extends Table {
  // id'si FK olarak kullanılıyor: "kt1t_waypoints" tablosunda
  IntColumn get id => integer().autoIncrement()();
  TextColumn get templatename => text().nullable()();
  BoolColumn get isdefault => boolean().nullable()();
}

@DataClassName('kt1t_waypoints')
class C2rscNavigationFacility extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dtdseqno => integer().nullable()();
  TextColumn get locationstr => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  IntColumn get elevation => integer().nullable()();
  IntColumn get veraltitude => integer().nullable()();
  IntColumn get vorilspreset => integer().nullable()();
  IntColumn get tacanpreset => integer().nullable()();
  IntColumn get iffpreset => integer().nullable()();
  TextColumn get seqno => text().nullable()();
  TextColumn get fix => text().nullable()();
  IntColumn get template_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES kt1t_waypoint_templates(id)')();
}