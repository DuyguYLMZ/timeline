import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('dafif_airfield')
class DafifAirfield extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get arptident => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get stateprov => text().nullable()();
  TextColumn get icao => text().nullable()();
  TextColumn get faahostid => text().nullable()();
  TextColumn get lochdatum => text().nullable()();
  TextColumn get wgsdatum => text().nullable()();
  TextColumn get wgslat => text().nullable()();
  TextColumn get wgsdlat => text().nullable()();
  TextColumn get wgslong => text().nullable()();
  TextColumn get wgsdlong => text().nullable()();
  TextColumn get elev => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get magvar => text().nullable()();
  TextColumn get wac => text().nullable()();
  TextColumn get beacon => text().nullable()();
  TextColumn get secondarpt => text().nullable()();
  TextColumn get opragy => text().nullable()();
  TextColumn get secname => text().nullable()();
  TextColumn get secicao => text().nullable()();
  TextColumn get secfaa => text().nullable()();
  TextColumn get secopragy => text().nullable()();
  TextColumn get cycledate => text().nullable()();
  TextColumn get terrain => text().nullable()();
  TextColumn get hydro => text().nullable()();
  TextColumn get crc32 => text().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  RealColumn get distancetoorigin => real().nullable()();
}

@DataClassName('dafif_appc_arpt_type')
class DafifAppcArptType extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_appc_ats_type')
class DafifAppcAtsType extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_appc_bdry_type')
class DafifAppcBdryType extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_appc_cc_icao')
class DafifAppcCcIcao extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get country => text().nullable()();
  TextColumn get countryname => text().nullable()();
  TextColumn get icaorgn => text().nullable()();
  TextColumn get usage => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_appc_level')
class DafifAppcLevel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get levelinfo => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_appc_suas_type')
class DafifAppcSuasType extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_arresting_system')
class DafifArrestingSystem extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get arptident => text().nullable()();
  TextColumn get rwyident => text().nullable()();
  TextColumn get strlocation => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get energyabsorptiondevicetype => text().nullable()();
  TextColumn get engagingdevicetype => text().nullable()();
}

@DataClassName('dafif_atsroute')
class DafifAtsroute extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get icao => text().nullable()();
  TextColumn get atsident => text().nullable()();
  TextColumn get direction => text().nullable()();
  TextColumn get level => text().nullable()();
  IntColumn get sequence => integer().nullable()();
  RealColumn get wpt1_latitude => real().nullable()();
  RealColumn get wpt1_longitude => real().nullable()();
  TextColumn get wpt1_ident => text().nullable()();
  RealColumn get wpt2_latitude => real().nullable()();
  RealColumn get wpt2_longitude => real().nullable()();
  TextColumn get wpt2_ident => text().nullable()();
  TextColumn get upperlimitstring => text().nullable()();
  TextColumn get lowerlimitstring => text().nullable()();
  TextColumn get wpt1_country => text().nullable()();
  TextColumn get wpt2_country => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get bidirect => text().nullable()();
  TextColumn get freqclass => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get wpt1icao => text().nullable()();
  TextColumn get wpt1navtype => text().nullable()();
  TextColumn get wpt1desc1 => text().nullable()();
  TextColumn get wpt1desc2 => text().nullable()();
  TextColumn get wpt1desc3 => text().nullable()();
  TextColumn get wpt1desc4 => text().nullable()();
  TextColumn get wpt1wgslat => text().nullable()();
  TextColumn get wpt1wgslong => text().nullable()();
  TextColumn get navtype => text().nullable()();
  TextColumn get rnp => text().nullable()();
  TextColumn get wpt2desc1 => text().nullable()();
  TextColumn get wpt2desc2 => text().nullable()();
  TextColumn get wpt2desc3 => text().nullable()();
  TextColumn get wpt2desc4 => text().nullable()();
  TextColumn get wpt2icao => text().nullable()();
  TextColumn get wpt2wgslat => text().nullable()();
  TextColumn get wpt2wgslong => text().nullable()();
  TextColumn get distance => text().nullable()();
  TextColumn get inbdcrs => text().nullable()();
  TextColumn get minalt => text().nullable()();
  TextColumn get outbdcrs => text().nullable()();
  TextColumn get maa => text().nullable()();
  TextColumn get cruiselevel => text().nullable()();
  TextColumn get cycledate => text().nullable()();
  TextColumn get rvsm => text().nullable()();
  TextColumn get fixturn1 => text().nullable()();
  TextColumn get fixturn2 => text().nullable()();
  TextColumn get topleftlat => text().nullable()();
  TextColumn get topleftlon => text().nullable()();
  TextColumn get bottomrightlat => text().nullable()();
  TextColumn get bottomrightlon => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_bdry')
class DafifBdry extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get bdry_ident => text().nullable()();
  TextColumn get seq_number => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get icao => text().nullable()();
  TextColumn get shap => text().nullable()();
  TextColumn get derivation => text().nullable()();
  TextColumn get wgs_lat1 => text().nullable()();
  TextColumn get wgs_dlat1 => text().nullable()();
  TextColumn get wgs_lon1 => text().nullable()();
  TextColumn get wgs_dlon1 => text().nullable()();
  TextColumn get wgs_lat2 => text().nullable()();
  TextColumn get wgs_dlat2 => text().nullable()();
  TextColumn get wgs_lon2 => text().nullable()();
  TextColumn get wgs_dlon2 => text().nullable()();
  TextColumn get wgs_lat0 => text().nullable()();
  TextColumn get wgs_dlat0 => text().nullable()();
  TextColumn get wgs_lon0 => text().nullable()();
  TextColumn get wgs_dlon0 => text().nullable()();
  TextColumn get radius1 => text().nullable()();
  TextColumn get radius2 => text().nullable()();
  TextColumn get bearing1 => text().nullable()();
  TextColumn get bearing2 => text().nullable()();
  TextColumn get nav_ident => text().nullable()();
  TextColumn get nav_type => text().nullable()();
  TextColumn get nav_ctry => text().nullable()();
  TextColumn get nav_key_cd => text().nullable()();
  TextColumn get cycle_date => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
  RealColumn get lat0 => real().nullable()();
  RealColumn get lon0 => real().nullable()();
  RealColumn get lat1 => real().nullable()();
  RealColumn get lon1 => real().nullable()();
  RealColumn get lat2 => real().nullable()();
  RealColumn get lon2 => real().nullable()();
}

@DataClassName('dafif_bdry_par')
class DafifBdryPar extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get bdry_ident => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get icao => text().nullable()();
  TextColumn get conauth => text().nullable()();
  TextColumn get lochdatum => text().nullable()();
  TextColumn get wgsdatum => text().nullable()();
  TextColumn get commname => text().nullable()();
  TextColumn get commfreq1 => text().nullable()();
  TextColumn get commfreq2 => text().nullable()();
  TextColumn get clazz => text().nullable()();
  TextColumn get classexc => text().nullable()();
  TextColumn get classexcrmk => text().nullable()();
  TextColumn get levelinfo => text().nullable()();
  TextColumn get upperalt => text().nullable()();
  TextColumn get loweralt => text().nullable()();
  TextColumn get rnp => text().nullable()();
  TextColumn get cycle_date => text().nullable()();
  TextColumn get uprvsm => text().nullable()();
  TextColumn get lorvsm => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_communication')
class DafifCommunication extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get arptident => text().nullable()();
  TextColumn get commtype => text().nullable()();
  TextColumn get commname => text().nullable()();
  TextColumn get frequency1 => text().nullable()();
  TextColumn get frequency2 => text().nullable()();
  TextColumn get frequency3 => text().nullable()();
  TextColumn get frequency4 => text().nullable()();
  TextColumn get frequency5 => text().nullable()();
  TextColumn get freqtype1 => text().nullable()();
  TextColumn get freqtype2 => text().nullable()();
  TextColumn get freqtype3 => text().nullable()();
  TextColumn get freqtype4 => text().nullable()();
  TextColumn get freqtype5 => text().nullable()();
  TextColumn get sym => text().nullable()();
  TextColumn get sec => text().nullable()();
  TextColumn get soprh => text().nullable()();
  TextColumn get cycledate => text().nullable()();
  TextColumn get multi => text().nullable()();
  TextColumn get frequencymulti => text().nullable()();
  TextColumn get comfrequency1 => text().nullable()();
  TextColumn get comfrequency2 => text().nullable()();
  TextColumn get comfrequency3 => text().nullable()();
  TextColumn get comfrequency4 => text().nullable()();
  TextColumn get comfrequency5 => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_fir_uir')
class DafifFirUir extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get bdry_ident => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get icao => text().nullable()();
  TextColumn get con_auth => text().nullable()();
  TextColumn get loc_hdatum => text().nullable()();
  TextColumn get wgs_datum => text().nullable()();
  TextColumn get comm_name => text().nullable()();
  TextColumn get comm_freq1 => text().nullable()();
  TextColumn get comm_freq2 => text().nullable()();
  //TODO: "clazz" sütunu postgre'de "class" olarak tanımlanmış. Ancak burada class yazınca kabul etmedi.
  TextColumn get clazz => text().nullable()();
  TextColumn get class_exc => text().nullable()();
  TextColumn get class_exc_rmk => text().nullable()();
  TextColumn get level_info => text().nullable()();
  TextColumn get upper_alt => text().nullable()();
  TextColumn get lower_alt => text().nullable()();
  TextColumn get rnp => text().nullable()();
  TextColumn get cycle_date => text().nullable()();
  TextColumn get up_rvsm => text().nullable()();
  TextColumn get lo_rvsm => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_holding')
class DafifHolding extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get alt_one => text().nullable()();
  TextColumn get alt_two => text().nullable()();
  TextColumn get cycle_date => text().nullable()();
  TextColumn get dup => text().nullable()();
  TextColumn get icao => text().nullable()();
  TextColumn get inb_crs => text().nullable()();
  TextColumn get length => text().nullable()();
  TextColumn get nav_ctry => text().nullable()();
  TextColumn get nav_ident => text().nullable()();
  TextColumn get nav_key_cd => text().nullable()();
  TextColumn get nav_type => text().nullable()();
  TextColumn get speed => text().nullable()();
  TextColumn get time => text().nullable()();
  TextColumn get track_cd => text().nullable()();
  TextColumn get wpt_ctry => text().nullable()();
  TextColumn get wpt_id => text().nullable()();
}

@DataClassName('dafif_icao_region')
class DafifIcaoRegion extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get bdryident => text().nullable()();
  TextColumn get seqnbr => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get icao => text().nullable()();
  TextColumn get shap => text().nullable()();
  TextColumn get derivation => text().nullable()();
  TextColumn get wgslat1 => text().nullable()();
  TextColumn get wgsdlat1 => text().nullable()();
  TextColumn get wgslong1 => text().nullable()();
  TextColumn get wgsdlong1 => text().nullable()();
  TextColumn get wgslat2 => text().nullable()();
  TextColumn get wgsdlat2 => text().nullable()();
  TextColumn get wgslong2 => text().nullable()();
  TextColumn get wgsdlong2 => text().nullable()();
  TextColumn get wgslat0 => text().nullable()();
  TextColumn get wgsdlat0 => text().nullable()();
  TextColumn get wgslong0 => text().nullable()();
  TextColumn get wgsdlong0 => text().nullable()();
  TextColumn get radius1 => text().nullable()();
  TextColumn get radius2 => text().nullable()();
  TextColumn get bearing1 => text().nullable()();
  TextColumn get bearing2 => text().nullable()();
  TextColumn get navident => text().nullable()();
  TextColumn get navtype => text().nullable()();
  TextColumn get navctry => text().nullable()();
  TextColumn get navkeycd => text().nullable()();
  TextColumn get cycledate => text().nullable()();
}

@DataClassName('dafif_navaid')
class DafifNavaid extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  TextColumn get icao => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get associatedairfieldicao => text().nullable()();
  RealColumn get lon => real().nullable()();
  RealColumn get lat => real().nullable()();
  TextColumn get elevationstring => text().nullable()();
  RealColumn get distancetoorigin => real().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get navident => text().nullable()();
  TextColumn get channel => text().nullable()();
  TextColumn get navkeycd => text().nullable()();
  TextColumn get wgsdlat => text().nullable()();
  TextColumn get wgsdlong => text().nullable()();
  TextColumn get stateprov => text().nullable()();
  TextColumn get wac => text().nullable()();
  TextColumn get freq => text().nullable()();
  TextColumn get usagecd => text().nullable()();
  TextColumn get rcc => text().nullable()();
  TextColumn get freqprot => text().nullable()();
  TextColumn get power => text().nullable()();
  TextColumn get navrange => text().nullable()();
  TextColumn get lochdatum => text().nullable()();
  TextColumn get wgsdatum => text().nullable()();
  TextColumn get wgslat => text().nullable()();
  TextColumn get wgslong => text().nullable()();
  TextColumn get slavedvar => text().nullable()();
  TextColumn get magvar => text().nullable()();
  TextColumn get dmewgslat => text().nullable()();
  TextColumn get dmewgsdlat => text().nullable()();
  TextColumn get dmewgslong => text().nullable()();
  TextColumn get dmewgsdlong => text().nullable()();
  TextColumn get dmeelev => text().nullable()();
  TextColumn get os => text().nullable()();
  TextColumn get cycledate => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_navaid_ils')
class DafifNavaidIls extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get arptident => text().nullable()();
  TextColumn get rwyident => text().nullable()();
  TextColumn get comptype => text().nullable()();
  TextColumn get colctn => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get freq => text().nullable()();
  TextColumn get chan => text().nullable()();
  TextColumn get gsangle => text().nullable()();
  TextColumn get lczrgslctn => text().nullable()();
  TextColumn get locmkrlctn => text().nullable()();
  TextColumn get elev => text().nullable()();
  TextColumn get lochdatum => text().nullable()();
  TextColumn get wgsdatum => text().nullable()();
  TextColumn get ilscat => text().nullable()();
  TextColumn get wgslat => text().nullable()();
  TextColumn get wgsdlat => text().nullable()();
  TextColumn get wgslong => text().nullable()();
  TextColumn get wgsdlong => text().nullable()();
  TextColumn get ident => text().nullable()();
  TextColumn get navtype => text().nullable()();
  TextColumn get navctry => text().nullable()();
  TextColumn get navkeycd => text().nullable()();
  TextColumn get magvar => text().nullable()();
  TextColumn get slavevar => text().nullable()();
  TextColumn get ilsbrg => text().nullable()();
  TextColumn get locwidth => text().nullable()();
  TextColumn get thdcrossinghgt => text().nullable()();
  TextColumn get dmebias => text().nullable()();
  TextColumn get cycledate => text().nullable()();
  TextColumn get dmenp => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
}

@DataClassName('dafif_runway')
class DafifRunway extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get arptident => text().nullable()();
  TextColumn get highident => text().nullable()();
  TextColumn get lowident => text().nullable()();
  TextColumn get highendlatitude => text().nullable()();
  TextColumn get highendlongitude => text().nullable()();
  TextColumn get highendelevation => text().nullable()();
  TextColumn get highendslope => text().nullable()();
  TextColumn get lowendlatitude => text().nullable()();
  TextColumn get lowendlongitude => text().nullable()();
  TextColumn get lowendelevation => text().nullable()();
  TextColumn get lowendslope => text().nullable()();
  TextColumn get rwywidth => text().nullable()();
  TextColumn get length => text().nullable()();
  TextColumn get highendtrueheading => text().nullable()();
  TextColumn get lowendtrueheading => text().nullable()();
  TextColumn get highendmagneticheading => text().nullable()();
  TextColumn get lowendmagneticheading => text().nullable()();
  TextColumn get highendlandingdistance => text().nullable()();
  TextColumn get lowendlandingdistance => text().nullable()();
  TextColumn get surface => text().nullable()();
  TextColumn get pcn => text().nullable()();
  TextColumn get hetdze => text().nullable()();
  TextColumn get hedt => text().nullable()();
  TextColumn get hedtelev => text().nullable()();
  TextColumn get hlgtsys1 => text().nullable()();
  TextColumn get hlgtsys2 => text().nullable()();
  TextColumn get hlgtsys3 => text().nullable()();
  TextColumn get hlgtsys4 => text().nullable()();
  TextColumn get hlgtsys5 => text().nullable()();
  TextColumn get hlgtsys6 => text().nullable()();
  TextColumn get hlgtsys7 => text().nullable()();
  TextColumn get hlgtsys8 => text().nullable()();
  TextColumn get lewgslat => text().nullable()();
  TextColumn get lewgslong => text().nullable()();
  TextColumn get hewgslat => text().nullable()();
  TextColumn get hewgslong => text().nullable()();
  TextColumn get letdze => text().nullable()();
  TextColumn get ledt => text().nullable()();
  TextColumn get ledtelev => text().nullable()();
  TextColumn get llgtsys1 => text().nullable()();
  TextColumn get llgtsys2 => text().nullable()();
  TextColumn get llgtsys3 => text().nullable()();
  TextColumn get llgtsys4 => text().nullable()();
  TextColumn get llgtsys5 => text().nullable()();
  TextColumn get llgtsys6 => text().nullable()();
  TextColumn get llgtsys7 => text().nullable()();
  TextColumn get llgtsys8 => text().nullable()();
  TextColumn get cldrwy => text().nullable()();
  TextColumn get hetakeoff => text().nullable()();
  TextColumn get letakeoff => text().nullable()();
  TextColumn get cycledate => text().nullable()();
  TextColumn get crc32 => text().nullable()();
  RealColumn get helat => real().nullable()();
  RealColumn get helon => real().nullable()();
  RealColumn get lelat => real().nullable()();
  RealColumn get lelon => real().nullable()();
}

@DataClassName('dafif_special_use_airspace')
class DafifSpecialUseAirspace extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get suasident => text().nullable()();
  TextColumn get sector => text().nullable()();
  TextColumn get segnbr => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get icao => text().nullable()();
  TextColumn get shap => text().nullable()();
  TextColumn get derivation => text().nullable()();
  TextColumn get wgslat1 => text().nullable()();
  TextColumn get wgsdlat1 => text().nullable()();
  TextColumn get wgslong1 => text().nullable()();
  TextColumn get wgsdlong1 => text().nullable()();
  TextColumn get wgslat2 => text().nullable()();
  TextColumn get wgsdlat2 => text().nullable()();
  TextColumn get wgslong2 => text().nullable()();
  TextColumn get wgsdlong2 => text().nullable()();
  TextColumn get wgslat0 => text().nullable()();
  TextColumn get wgsdlat0 => text().nullable()();
  TextColumn get wgslong0 => text().nullable()();
  TextColumn get wgsdlong0 => text().nullable()();
  TextColumn get radius1 => text().nullable()();
  TextColumn get radius2 => text().nullable()();
  TextColumn get bearing1 => text().nullable()();
  TextColumn get bearing2 => text().nullable()();
  TextColumn get navident => text().nullable()();
  TextColumn get navtype => text().nullable()();
  TextColumn get navctry => text().nullable()();
  TextColumn get navkeycd => text().nullable()();
  TextColumn get cycledate => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
  RealColumn get lat0 => real().nullable()();
  RealColumn get lon0 => real().nullable()();
  RealColumn get lat1 => real().nullable()();
  RealColumn get lon1 => real().nullable()();
  RealColumn get lat2 => real().nullable()();
  RealColumn get lon2 => real().nullable()();
}

@DataClassName('dafif_special_use_airspace_par')
class DafifSpecialUseAirspacePar extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get suasident => text().nullable()();
  TextColumn get sector => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get icao => text().nullable()();
  TextColumn get conagcy => text().nullable()();
  TextColumn get lochdatum => text().nullable()();
  TextColumn get wgsdatum => text().nullable()();
  TextColumn get commname => text().nullable()();
  TextColumn get freq1 => text().nullable()();
  TextColumn get freq2 => text().nullable()();
  TextColumn get levelinfo => text().nullable()();
  TextColumn get upperalt => text().nullable()();
  TextColumn get loweralt => text().nullable()();
  TextColumn get efftimes => text().nullable()();
  TextColumn get wx => text().nullable()();
  TextColumn get cycledate => text().nullable()();
  TextColumn get effdate => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
}

@DataClassName('dafif_trm_msa')
class DafifTrmMsa extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get arpt_ident => text().nullable()();
  TextColumn get proc => text().nullable()();
  TextColumn get trm_ident => text().nullable()();
  TextColumn get seq_nbr => text().nullable()();
  TextColumn get seq_alt => text().nullable()();
  TextColumn get icao => text().nullable()();
  TextColumn get nav_ident => text().nullable()();
  TextColumn get nav_type => text().nullable()();
  TextColumn get nav_ctry => text().nullable()();
  TextColumn get nav_key_cd => text().nullable()();
  TextColumn get sec_bear1 => text().nullable()();
  TextColumn get sec_bear2 => text().nullable()();
  TextColumn get wpt_ident => text().nullable()();
  TextColumn get wpt_ctry => text().nullable()();
  TextColumn get sec_mile1 => text().nullable()();
  TextColumn get sec_mile2 => text().nullable()();
  TextColumn get wgs_lat => text().nullable()();
  TextColumn get wgs_dlat => text().nullable()();
  TextColumn get wgs_lon => text().nullable()();
  TextColumn get wgs_dlon => text().nullable()();
  TextColumn get cycledate => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
}

@DataClassName('dafif_trm_seg')
class DafifTrmSeg extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get arpt_ident => text().nullable()();
  TextColumn get proc => text().nullable()();
  TextColumn get trm_ident => text().nullable()();
  TextColumn get seq_nbr => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get transition => text().nullable()();
  TextColumn get icao => text().nullable()();
  TextColumn get track_cd => text().nullable()();
  TextColumn get wpt_id => text().nullable()();
  TextColumn get wpt_ctry => text().nullable()();
  TextColumn get wpt_desc1 => text().nullable()();
  TextColumn get wpt_desc2 => text().nullable()();
  TextColumn get wpt_desc3 => text().nullable()();
  TextColumn get wpt_desc4 => text().nullable()();
  TextColumn get turn_dir => text().nullable()();
  TextColumn get nav1_ident => text().nullable()();
  TextColumn get nav1_type => text().nullable()();
  TextColumn get nav1_ctry => text().nullable()();
  TextColumn get nav1_key_cd => text().nullable()();
  TextColumn get nav1_bear => text().nullable()();
  TextColumn get nav1_dist => text().nullable()();
  TextColumn get nav2_ident => text().nullable()();
  TextColumn get nav2_type => text().nullable()();
  TextColumn get nav2_ctry => text().nullable()();
  TextColumn get nav2_key_cd => text().nullable()();
  TextColumn get nav2_bear => text().nullable()();
  TextColumn get nav2_dist => text().nullable()();
  TextColumn get mag_crs => text().nullable()();
  TextColumn get distance => text().nullable()();
  TextColumn get alt_desc => text().nullable()();
  TextColumn get alt_one => text().nullable()();
  TextColumn get alt_two => text().nullable()();
  TextColumn get rnp => text().nullable()();
  TextColumn get cycle_date => text().nullable()();
  TextColumn get wpt_wgs_lat => text().nullable()();
  TextColumn get wpt_wgs_dlat => text().nullable()();
  TextColumn get wpt_wgs_long => text().nullable()();
  TextColumn get wpt_wgs_dlong => text().nullable()();
  TextColumn get wpt_mvar => text().nullable()();
  TextColumn get nav1_wgs_lat => text().nullable()();
  TextColumn get nav1_wgs_dlat => text().nullable()();
  TextColumn get nav1_wgs_long => text().nullable()();
  TextColumn get nav1_wgs_dlong => text().nullable()();
  TextColumn get nav1_mvar => text().nullable()();
  TextColumn get nav1_dme_wgs_lat => text().nullable()();
  TextColumn get nav1_dme_wgs_dlat => text().nullable()();
  TextColumn get nav1_dme_wgs_long => text().nullable()();
  TextColumn get nav1_dme_wgs_dlong => text().nullable()();
  TextColumn get nav2_wgs_lat => text().nullable()();
  TextColumn get nav2_wgs_dlat => text().nullable()();
  TextColumn get nav2_wgs_long => text().nullable()();
  TextColumn get nav2_wgs_dlong => text().nullable()();
  TextColumn get nav2_mvar => text().nullable()();
  TextColumn get nav2_dime_wgs_lat => text().nullable()();
  TextColumn get nav2_dime_wgs_dlat => text().nullable()();
  TextColumn get nav2_dime_wgs_long => text().nullable()();
  TextColumn get nav2_dime_wgs_dlong => text().nullable()();
  TextColumn get speed => text().nullable()();
  TextColumn get speed_ac => text().nullable()();
  TextColumn get speed_alt => text().nullable()();
  TextColumn get speed_2 => text().nullable()();
  TextColumn get speed_alt_2 => text().nullable()();
  TextColumn get speed_ac_2 => text().nullable()();
  TextColumn get vnav => text().nullable()();
  TextColumn get tch => text().nullable()();
}

@DataClassName('dafif_version_info')
class DafifVersionInfo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get effectivedate => text().nullable()();
  TextColumn get expiredate => text().nullable()();
}

@DataClassName('dafif_waypoint')
class DafifWaypoint extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get wptident => text().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get usagecode => text().nullable()();
  TextColumn get icao => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get wgsdlat => text().nullable()();
  TextColumn get wgsdlong => text().nullable()();
  TextColumn get stateprov => text().nullable()();
  TextColumn get wptnavflag => text().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get bearing => text().nullable()();
  TextColumn get distance => text().nullable()();
  TextColumn get wac => text().nullable()();
  TextColumn get lochdatum => text().nullable()();
  TextColumn get wgsdatum => text().nullable()();
  TextColumn get wgslat => text().nullable()();
  TextColumn get wgslong => text().nullable()();
  TextColumn get magvar => text().nullable()();
  TextColumn get navident => text().nullable()();
  TextColumn get navtype => text().nullable()();
  TextColumn get navctry => text().nullable()();
  TextColumn get navkeycd => text().nullable()();
  TextColumn get cycledate => text().nullable()();
  TextColumn get wptrvsm => text().nullable()();
  TextColumn get rwyid => text().nullable()();
  TextColumn get rwyicao => text().nullable()();
  IntColumn get crc32 => integer().nullable()();
  RealColumn get distancetoorigin => real().nullable()();
}