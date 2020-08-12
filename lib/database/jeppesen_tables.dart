import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('jeppesen_navaid')
class JeppesenNavaid extends Table {
  IntColumn get record_id => integer().autoIncrement()();
  TextColumn get airportidentifier => text().nullable()();
  TextColumn get icaocode => text().nullable()();
  TextColumn get navaididentifier => text().nullable()();
  TextColumn get frequency => text().nullable()();
  TextColumn get navaidname => text().nullable()();
  TextColumn get navaidshortname => text().nullable()();
  RealColumn get magneticvariation => real().nullable()();
  TextColumn get navaidclass => text().nullable()();
  IntColumn get figureofmerit => integer().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jeppesen_waypoint')
class JeppesenWaypoint extends Table {
  IntColumn get record_id => integer().autoIncrement()();
  TextColumn get waypointidentifier => text().nullable()();
  TextColumn get waypointtype => text().nullable()();
  TextColumn get waypointname => text().nullable()();
  TextColumn get waypointshortname => text().nullable()();
  TextColumn get reportingcode => text().nullable()();
  RealColumn get dynamicmagvar => real().nullable()();
  TextColumn get icaocode => text().nullable()();
  TextColumn get airportidentifier => text().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jppsn_airport')
class JppsnAirport extends Table {
  IntColumn get record_id => integer().autoIncrement()();
  TextColumn get identifier => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get shortname => text().nullable()();
  TextColumn get public_mil_indicator => text().nullable()();
  RealColumn get ifr_capability => real().nullable()();
  TextColumn get icao_code => text().nullable()();
  IntColumn get longest_rwy => integer().nullable()();
  TextColumn get longest_rwy_surface_code => text().nullable()();
  IntColumn get transition_altitude => integer().nullable()();
  IntColumn get transition_level => integer().nullable()();
  IntColumn get elevation => integer().nullable()();
  TextColumn get recomm_navaid => text().nullable()();
  TextColumn get magnetic_variation => text().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jppsn_airport_comm')
class JppsnAirportComm extends Table {
  IntColumn get record_id => integer().autoIncrement()();
  TextColumn get airport_identifier => text().nullable()();
  TextColumn get comm_type => text().nullable()();
  TextColumn get call_sign => text().nullable()();
  TextColumn get transmit_freq => text().nullable()();
  RealColumn get receive_freq => real().nullable()();
  TextColumn get freq_units => text().nullable()();
  TextColumn get modulation => text().nullable()();
  TextColumn get signal_emission => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jppsn_airport_type')
class JppsnAirportType extends Table {
  IntColumn get unique_index => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  TextColumn get description => text().nullable()();
}

@DataClassName('jppsn_airway')
class JppsnAirway extends Table {
  // record_id'si FK olarak kullanılıyor: "jppsn_airway_waypoint_rel" tablosunda
  IntColumn get record_id => integer().autoIncrement()();
  TextColumn get route_identifier => text().nullable()();
  TextColumn get airway_level => text().nullable()();
  TextColumn get direction_restriction => text().nullable()();
  IntColumn get min_altitude => integer().nullable()();
  IntColumn get max_altitude => integer().nullable()();
  TextColumn get type => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jppsn_airway_type')
class JppsnAirwayType extends Table {
  IntColumn get unique_index => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  TextColumn get description => text().nullable()();
}

@DataClassName('jppsn_airway_waypoint_rel')
class JppsnAirwayWaypointRel extends Table {
  IntColumn get record_id => integer().autoIncrement()();
  IntColumn get waypoint_record_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES jppsn_navaid_waypoint(record_id)')();
  IntColumn get seq => integer().nullable()();
  IntColumn get airway_record_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES jppsn_airway(record_id)')();
}

@DataClassName('jppsn_cas')
class JppsnCas extends Table {
  // record_id'si FK olarak kullanılıyor: "jppsn_cas_polygon" tablosunda
  IntColumn get record_id => integer().autoIncrement()();
  TextColumn get cas_type => text().nullable()();
  TextColumn get cas_center => text().nullable()();
  TextColumn get cas_name => text().nullable()();
  TextColumn get classification => text().nullable()();
  TextColumn get lower_limit => text().nullable()();
  TextColumn get upper_limit => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jppsn_cas_polygon')
class JppsnCasPolygon extends Table {
  IntColumn get record_id => integer().autoIncrement()();
  IntColumn get cas_record_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES jppsn_cas(record_id)')();
  IntColumn get seq => integer().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  TextColumn get boundary_via => text().nullable()();
  RealColumn get arc_origin_lat => real().nullable()();
  RealColumn get arc_origin_lon => real().nullable()();
  RealColumn get arc_distance => real().nullable()();
  RealColumn get arc_bearing => real().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jppsn_fir_uir')
class JppsnFirUir extends Table {
  // record_id'si FK olarak kullanılıyor: "jppsn_fir_uir_polyline" tablosunda
  IntColumn get record_id => integer().autoIncrement()();
  TextColumn get fir_uir_identifier => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get fir_uir_name => text().nullable()();
  TextColumn get entry_report => text().nullable()();
  TextColumn get direction => text().nullable()();
  TextColumn get type => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jppsn_fir_uir_polyline')
class JppsnFirUirPolyline extends Table {
  IntColumn get record_id => integer().autoIncrement()();
  IntColumn get seq => integer().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  IntColumn get crc32 => integer().nullable()();
  IntColumn get fir_record_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES jppsn_fir_uir(record_id)')();
}

@DataClassName('jppsn_msa')
class JppsnMsa extends Table {
  IntColumn get record_id => integer().autoIncrement()();
  TextColumn get airport_identifier => text().nullable()();
  TextColumn get icao_code => text().nullable()();
  TextColumn get center_fix => text().nullable()();
  IntColumn get radius => integer().nullable()();
  IntColumn get sector_from => integer().nullable()();
  IntColumn get sector_to => integer().nullable()();
  TextColumn get altitude => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jppsn_navaid_waypoint')
class JppsnNavaidWaypoint extends Table {
  // record_id'si FK olarak kullanılıyor: "jppsn_airway_waypoint_rel" tablosunda
  IntColumn get record_id => integer().autoIncrement()();
  TextColumn get airport_identifier => text().nullable()();
  TextColumn get icao_code => text().nullable()();
  TextColumn get navaid_identifier => text().nullable()();
  TextColumn get navaid_frequency => text().nullable()();
  TextColumn get navaid_name => text().nullable()();
  TextColumn get navaid_short_name => text().nullable()();
  TextColumn get navaid_magnetic_variation => text().nullable()();
  TextColumn get navaid_class => text().nullable()();
  IntColumn get navaid_figure_of_merit => integer().nullable()();
  TextColumn get navaid_type => text().nullable()();
  TextColumn get wpt_identifier => text().nullable()();
  TextColumn get wpt_name => text().nullable()();
  TextColumn get wpt_type => text().nullable()();
  TextColumn get wpt_short_name => text().nullable()();
  TextColumn get wpt_reporting_code => text().nullable()();
  TextColumn get wpt_dynamic_mag_var => text().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  TextColumn get type => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jppsn_ras_saa')
class JppsnRasSaa extends Table {
  // record_id'si FK olarak kullanılıyor: "jppsn_ras_saa_polygon" tablosunda
  IntColumn get record_id => integer().autoIncrement()();
  TextColumn get ras_saa_identifier => text().nullable()();
  TextColumn get ras_saa_type => text().nullable()();
  TextColumn get icao_code => text().nullable()();
  TextColumn get ras_saa_name => text().nullable()();
  DateTimeColumn get start_date => dateTime().nullable()();
  DateTimeColumn get end_date => dateTime().nullable()();
  RealColumn get lower_limit => real().nullable()();
  RealColumn get upper_limit => real().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jppsn_ras_saa_polygon')
class JppsnRasSaaPolygon extends Table {
  IntColumn get record_id => integer().autoIncrement()();
  IntColumn get seq => integer().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  TextColumn get boundary_via => text().nullable()();
  RealColumn get arc_origin_lat => real().nullable()();
  RealColumn get arc_origin_lon => real().nullable()();
  RealColumn get arc_distance => real().nullable()();
  RealColumn get arc_bearing => real().nullable()();
  IntColumn get crc32 => integer().nullable()();
  IntColumn get ras_saa_record_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES jppsn_ras_saa(record_id)')();
}

@DataClassName('jppsn_ras_type')
class JppsnRasType extends Table {
  IntColumn get unique_index => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  TextColumn get description => text().nullable()();
}

@DataClassName('jppsn_runway')
class JppsnRunway extends Table {
  IntColumn get record_id => integer().autoIncrement()();
  TextColumn get rwy_identifier => text().nullable()();
  TextColumn get airport_identifier => text().nullable()();
  IntColumn get touch_down_zone_elev => integer().nullable()();
  TextColumn get magnetic_bearing => text().nullable()();
  TextColumn get true_bearing => text().nullable()();
  IntColumn get rwy_length => integer().nullable()();
  IntColumn get rwy_width => integer().nullable()();
  IntColumn get land_threshold_elev => integer().nullable()();
  IntColumn get displcd_threshold_dist => integer().nullable()();
  IntColumn get threshold_cross_height => integer().nullable()();
  TextColumn get slope_tdz => text().nullable()();
  TextColumn get surface_comp => text().nullable()();
  IntColumn get land_dist_available => integer().nullable()();
  IntColumn get takeoff_dist_available => integer().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('jppsn_version')
class JppsnVersion extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get effective_date => text().nullable()();
  TextColumn get expiration_date => text().nullable()();
}