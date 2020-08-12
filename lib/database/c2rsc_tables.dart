import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('c2rsc_airfield')
class C2rscAirfield extends Table {
  // id'si FK olarak kullanılıyor birden fazla tabloda: "c2rsc_navigation_facility" ve "c2rsc_runway" tablolarında
  IntColumn get id => integer().autoIncrement()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get name_pm => text().nullable()();
  TextColumn get shortname => text().nullable()();
  TextColumn get icaocode => text().nullable()();
  TextColumn get arpt_ident => text().nullable()();
  TextColumn get usage_type => text().nullable()();
  TextColumn get statusname => text().nullable()();
  TextColumn get airfieldtype_pm => text().nullable()();
  TextColumn get reason => text().nullable()();
  TextColumn get country_code => text().nullable()();
}

@DataClassName('c2rsc_navigation_facility')
class C2rscNavigationFacility extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get class_pm => text().nullable()();
  IntColumn get airfield_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES c2rsc_airfield(id)')();
  IntColumn get runway_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES c2rsc_runway(id)')();
}

@DataClassName('c2rsc_runway')
class C2rscRunway extends Table {
  // id'si FK olarak kullanılıyor birden fazla tabloda: "c2rsc_navigation_facility" ve "c2rsc_runway_facility" tablolarında
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name_pm => text().nullable()();
  BoolColumn get is_main_runway => boolean().nullable()();
  TextColumn get arpt_ident => text().nullable()();
  TextColumn get high_ident => text().nullable()();
  RealColumn get lcnvalue_pm => real().nullable()();
  RealColumn get length_pm => real().nullable()();
  TextColumn get low_ident => text().nullable()();
  TextColumn get runwaystatus => text().nullable()();
  TextColumn get structure_pm => text().nullable()();
  RealColumn get width_pm => real().nullable()();
  RealColumn get he_latitude => real().nullable()();
  RealColumn get he_longitude => real().nullable()();
  RealColumn get he_altitude => real().nullable()();
  RealColumn get he_slope => real().nullable()();
  RealColumn get he_magnetic_heading => real().nullable()();
  RealColumn get he_true_heading => real().nullable()();
  RealColumn get le_latitude => real().nullable()();
  RealColumn get le_longitude => real().nullable()();
  RealColumn get le_altitude => real().nullable()();
  RealColumn get le_slope => real().nullable()();
  RealColumn get le_magnetic_heading => real().nullable()();
  RealColumn get le_true_heading => real().nullable()();
  DateTimeColumn get etro => dateTime().nullable()();
  TextColumn get statusname => text().nullable()();
  IntColumn get airfield_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES c2rsc_airfield(id)')();
}

@DataClassName('c2rsc_runway_facility')
class C2rscRunwayFacility extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get is_applicable => boolean().nullable()();
  IntColumn get explanation_type => integer().nullable()();
  TextColumn get direction => text().nullable()();
  IntColumn get runway_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES c2rsc_runway(id)')();
}