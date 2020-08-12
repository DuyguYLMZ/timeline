import 'package:moor_flutter/moor_flutter.dart';
import 'hupgp_tables.dart';

@DataClassName('fsgp_aco')
class FsgpAco extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get aco => text().nullable()();
  TextColumn get usagetypename => text().nullable()();
  DateTimeColumn get maxdate => dateTime().nullable()();
  DateTimeColumn get mindate => dateTime().nullable()();

  //TODO: postgre'de shapedata kolonu bytearray tipinde !!!!!
  TextColumn get shapedata => text().nullable()();
}

@DataClassName('fsgp_admin_waypoints')
class FsgpAdminWaypoints extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dtd_seq_no => integer().nullable()();
  IntColumn get axis_orient => integer().nullable()();
  RealColumn get major_axis => real().nullable()();
  RealColumn get minor_axis => real().nullable()();
  IntColumn get color_type => integer().nullable()();
  IntColumn get style_type => integer().nullable()();
  IntColumn get draw_type => integer().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  DateTimeColumn get tos => dateTime().nullable()();
  IntColumn get tos_validity_type => integer().nullable()();
  DateTimeColumn get mark_time => dateTime().nullable()();
  IntColumn get validity_type => integer().nullable()();
  IntColumn get elevation => integer().nullable()();
  IntColumn get elevation_validity_type => integer().nullable()();
  TextColumn get identifier => text().nullable()();
  IntColumn get tacan_preset => integer().nullable()();
  IntColumn get vor_preset => integer().nullable()();
  RealColumn get altitudevalue => real().nullable()();
  IntColumn get altitudeunit => integer().nullable()();
  IntColumn get altitudetype => integer().nullable()();
  IntColumn get altitude_validity_type => integer().nullable()();
}

@DataClassName('fsgp_aircraft_type')
class FsgpAircraftType extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get moment => real().nullable()();
  IntColumn get apprfuel => integer().nullable()();
  IntColumn get apprtime => integer().nullable()();
  RealColumn get apprdistance => real().nullable()();
  IntColumn get sttofuel => integer().nullable()();
  IntColumn get sttotime => integer().nullable()();
  RealColumn get sttodistance => real().nullable()();
  IntColumn get sttoaltitude => integer().nullable()();
  RealColumn get infuelcapacity => real().nullable()();
  RealColumn get weightempty => real().nullable()();
  RealColumn get drag => real().nullable()();
  RealColumn get maxlandingweight => real().nullable()();
  RealColumn get maxtakeoffweight => real().nullable()();
  TextColumn get fullname => text().nullable()();
  IntColumn get statictypeid => integer().nullable()();
  BoolColumn get f16cblok30 => boolean().nullable()();
  BoolColumn get f16dblok30 => boolean().nullable()();
  RealColumn get opermoment => real().nullable()();
  RealColumn get operweight => real().nullable()();
  IntColumn get fpmid => integer().nullable()();
  RealColumn get appraltitude => real().nullable()();
  BoolColumn get ishelicopter => boolean().nullable()();
}

@DataClassName('fsgp_airspace_subtype')
class FsgpAirspaceSubtype extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get code => text().nullable()();
}

@DataClassName('fsgp_ato_area')
class FsgpAtoArea extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  TextColumn get name => text().nullable()();
  //TODO: postgre'de shapedata kolonu bytearray tipinde !!!!!
  TextColumn get shapedata => text().nullable()();
}

@DataClassName('fsgp_ato_target')
class FsgpAtoTarget extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get moduletype => text().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  RealColumn get altitudeinfeet => real().nullable()();
}

@DataClassName('fsgp_country')
class FsgpCountry extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get turkishname => text().nullable()();
  TextColumn get englishname => text().nullable()();
  TextColumn get natocode => text().nullable()();
  TextColumn get dafifcode => text().nullable()();
}

@DataClassName('fsgp_frequency_set')
class FsgpFrequencySet extends Table {
  // id'si FK olarak kullanılıyor "normal frequency" tablosunda
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get templatename => text().nullable()();
}

@DataClassName('fsgp_fuze')
class FsgpFuze extends Table {
  //TODO: id'si FK olarak kullanılıyor birden fazla tabloda (fuze_value, material_fuze_pair(2 kere))
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name_pm => text().nullable()();
}

@DataClassName('fsgp_fuze_function_type')
class FsgpFuzeFunctionType extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fuzefunctiontypename => text().nullable()();
  TextColumn get fuzefunctiontypecode => text().nullable()();
}

@DataClassName('fsgp_hk_circle')
class FsgpHkCircle extends Table {
  // id'si FK olarak kullanılıyor "fsgp_hk_training_area" tablosunda
  IntColumn get id => integer().autoIncrement()();
  RealColumn get minalt => real().nullable()();
  RealColumn get maxalt => real().nullable()();
  //TODO: aşağıdaki ilk 4 sütun(Text tipindekiler) ByteArray tipinde kaydedilmiş postgre'de:
  TextColumn get alt_unit_for_min => text().nullable()();
  TextColumn get alt_level_for_min => text().nullable()();
  TextColumn get alt_unit_for_max => text().nullable()();
  TextColumn get alt_level_for_max => text().nullable()();
  RealColumn get radius => real().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
}

@DataClassName('fsgp_hk_polygon')
class FsgpHkPolygon extends Table {
  // id'si FK olarak kullanılıyor birden fazla tabloda: "fsgp_hk_polygon_point" ve "fsgp_hk_training_area" tablolarında
  IntColumn get id => integer().autoIncrement()();
  RealColumn get minalt => real().nullable()();
  RealColumn get maxalt => real().nullable()();
  //TODO: aşağıdaki ilk 4 sütun(Text tipindekiler) ByteArray tipinde kaydedilmiş postgre'de:
  TextColumn get alt_unit_for_min => text().nullable()();
  TextColumn get alt_level_for_min => text().nullable()();
  TextColumn get alt_unit_for_max => text().nullable()();
  TextColumn get alt_level_for_max => text().nullable()();
}

@DataClassName('fsgp_hk_polygon_point')
class FsgpHkPolygonPoint extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderno => integer().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  IntColumn get shape_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES fsgp_hk_polygon(id)')();
}

@DataClassName('fsgp_hk_training_area')
class FsgpHkTrainingArea extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get radial => text().nullable()();
  TextColumn get dme => text().nullable()();
  IntColumn get way_point => integer().nullable()();
  TextColumn get area_manuel => text().nullable()();
  IntColumn get squadron_id => integer().nullable()();
  IntColumn get shape_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES fsgp_hk_polygon(id)')();
  IntColumn get circle_shape_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES fsgp_hk_circle(id)')();

}

@DataClassName('fsgp_hq_frequency')
class FsgpHqFrequency extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get channelno => text().nullable()();
  RealColumn get frequency => real().nullable()();
}

@DataClassName('fsgp_measurement_unit_type')
class FsgpMeasurementUnitType extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get prettyname => text().nullable()();
  TextColumn get sapid => text().nullable()();
}

@DataClassName('fsgp_normal_frequency')
class FsgpNormalFrequency extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  IntColumn get presetno => integer().nullable()();
  RealColumn get frequencyvalue => real().nullable()();
  BoolColumn get defaultfreq => boolean().nullable()();
  IntColumn get frequency_set_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES fsgp_frequency_set(id)')();
}

@DataClassName('fsgp_notam')
class FsgpNotam extends Table {
  // id'si FK olarak kullanılıyor birden fazla tabloda: "fsgp_notam_airfield" ve "fsgp_notam_area" tablolarında
  IntColumn get id => integer().autoIncrement()();
  TextColumn get notamno => text().nullable()();
  BoolColumn get estimated => boolean().nullable()();
  DateTimeColumn get begindate => dateTime().nullable()();
  DateTimeColumn get enddate => dateTime().nullable()();
  TextColumn get type => text().nullable()();
}

@DataClassName('fsgp_notam_airfield')
class FsgpNotamAirfield extends Table {
  // id'si FK olarak kullanılıyor: "fsgp_notam_date_interval" tablosunda
  IntColumn get id => integer().autoIncrement()();
  TextColumn get airfieldicaocode => text().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  IntColumn get fsgp_notam_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES fsgp_notam(id)')();

}

@DataClassName('fsgp_notam_area')
class FsgpNotamArea extends Table {
  // id'si FK olarak kullanılıyor: "fsgp_notam_date_interval" tablosunda
  IntColumn get id => integer().autoIncrement()();
  TextColumn get usagetype => text().nullable()();
  TextColumn get name => text().nullable()();
  //TODO: shapedata sütunu ByteArray olarak kaydedilmiş postgre'de !!!
  TextColumn get shapedata => text().nullable()();
  IntColumn get fsgp_notam_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES fsgp_notam(id)')();

}

@DataClassName('fsgp_notam_date_interval')
class FsgpNotamDateInterval extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get begindate => dateTime().nullable()();
  DateTimeColumn get enddate => dateTime().nullable()();
  IntColumn get notam_airfield_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES fsgp_notam_airfield(id)')();
  IntColumn get notam_area_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES fsgp_notam_area(id)')();

}

@DataClassName('fsgp_profile_airspace')
class FsgpProfileAirspace extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get airspaceprofilename => text().nullable()();
  TextColumn get airspaceprofilesubtypecode => text().nullable()();
  //TODO: shapedata sütunu ByteArray olarak kaydedilmiş postgre'de !!!
  TextColumn get shapedata => text().nullable()();
}

@DataClassName('fsgp_user_info')
class FsgpUserInfo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get loginid => text().nullable()();
  TextColumn get fullname => text().nullable()();
  IntColumn get personnelid => integer().nullable()();
  IntColumn get squadronoid => integer().nullable()();
  TextColumn get squadronshortname => text().nullable()();
  IntColumn get workingunitoid => integer().nullable()();
  TextColumn get workingunitshortname => text().nullable()();
  IntColumn get commandingofworkingunitoid => integer().nullable()();
  TextColumn get commandingofworkingunitshortname => text().nullable()();
  DateTimeColumn get datetoexpire => dateTime().nullable()();
}

@DataClassName('fsgp_user_options')
class FsgpUserOptions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get optionkey => text().nullable()();
  TextColumn get optionsstr => text().nullable()();
}

@DataClassName('fsgp_wod_frequency')
class FsgpWodFrequency extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get day => integer().nullable()();
  RealColumn get frequencyvalue => real().nullable()();
}

@DataClassName('fuze_value')
class FuzeValue extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get measurement_unit_id => integer().nullable()();
  IntColumn get material_id => integer().nullable()();
  TextColumn get fuzefunction_typecode => text().nullable()();
  IntColumn get fuzefunction_typecategory => integer().nullable()();
  TextColumn get value_unit_string => text().nullable()();
  RealColumn get start_value => real().nullable()();
  RealColumn get value_last => real().nullable()();
  RealColumn get increment_value => real().nullable()();
  TextColumn get dependant_fuze_function_typecode => text().nullable()();
  IntColumn get dependant_fuze_function_typecategory => integer().nullable()();
  IntColumn get fsgp_fuze_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES fsgp_fuze(id)')();
}

@DataClassName('hfsgp_wab_item')
class HfsgpWabItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tailnumber => integer().nullable()();
  RealColumn get weight => real().nullable()();
  RealColumn get moment => real().nullable()();
}

@DataClassName('material_fuze_pair')
class MaterialFuzePair extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get nosefuze_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES fsgp_fuze(id)')();
  IntColumn get tailfuze_id => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES fsgp_fuze(id)')();
  IntColumn get materialaircraft_typeid => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES hupgp_z_material_aircraft_type(id)')();
}