import 'dart:async';
import 'package:moor_flutter/moor_flutter.dart';
import 'tables.dart';
import 'meteo_tables.dart';
import 'hupgp_tables.dart';
import 'c2rsc_tables.dart';
import 'dafif_tables.dart';

part 'database.g.dart';

class MetarWithCount {
  MetarWithCount(this.icao, this.count);

  // can be null, in which case we count how many entries don't have a category
  final Meteo_Metar icao;
  final int count; // amount of entries in this category
}

class WrapperWithMetar {
  WrapperWithMetar(this.entry, this.category);

  final Meteo_Wrapper entry;
  final Meteo_Metar category;
}

@UseMoor(
  tables: [
    C2rscAirfield, C2rscNavigationFacility, C2rscRunway, C2rscRunwayFacility,
    DafifAirfield, DafifAppcArptType, DafifAppcAtsType, DafifAppcBdryType, DafifAppcCcIcao,
    DafifAppcLevel, DafifAppcSuasType, DafifArrestingSystem, DafifAtsroute, DafifBdry, DafifBdryPar,
    DafifCommunication, DafifFirUir, DafifHolding, DafifIcaoRegion, DafifNavaid, DafifNavaidIls,
    DafifRunway, DafifSpecialUseAirspace, DafifSpecialUseAirspacePar, DafifTrmMsa, DafifTrmSeg,
    DafifVersionInfo, DafifWaypoint,
    HupgpFlightroute, HupgpMissionFlightRoute, HupgpZMaterialAircraftType,
    MeteoTaf, MeteoWrapper, MeteoMetar
  ],
  queries: {
    '_resetCategory': 'UPDATE meteo_wrapper SET meteo_metar_icao = NULL WHERE meteo_metar_icao = ?',
    '_categoriesWithCount': '''
     SELECT
       c.id,
       c.desc,
       (SELECT COUNT(*) FROM meteo_wrapper WHERE meteo_metar_icao = c.id) AS amount
     FROM meteo_metar c
     UNION ALL
     SELECT null, null, (SELECT COUNT(*) FROM meteo_wrapper WHERE meteo_metar_icao IS NULL)
     ''',
  },
)
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          await m.addColumn(meteoWrapper, meteoWrapper.observationtime);
        }
      },
      beforeOpen: (details) async {
        if (details.wasCreated) {
          // create default categories and entries
          final workId = await into(meteoMetar)
              .insert(const MeteoMetarCompanion(icao: Value('Metar1')));

          await into(meteoWrapper).insert(MeteoWrapperCompanion(
            metar: const Value('First entry'),
            observationtime: Value(DateTime.now()),
          ));

          await into(meteoTaf).insert(MeteoTafCompanion(
            icao: Value('icao'),
            winddir: Value('winddir')
          ));


          await into(meteoWrapper).insert(
            MeteoWrapperCompanion(
              metar: const Value('First entry for Metar1'),
              meteo_metar_icao: Value(workId),
              observationtime: Value(
                DateTime.now().add(const Duration(days: 4)),
              ),
            ),
          );
        }
      },
    );
  }

  Stream<List<MetarWithCount>> metarWithCount() {
    // the _categoriesWithCount method has been generated automatically based
    // on the query declared in the @UseMoor annotation
    return _metar().map((row) {
      final hasId = row.id != null;
      final meteo_metar_icao =
      hasId ? Meteo_Metar(id: row.id, icao: row.desc) : null;

      return MetarWithCount(meteo_metar_icao, row.amount);
    }).watch();
  }

  /// Watches all entries in the given [category]. If the category is null, all
  /// entries will be shown instead.
  Stream<List<WrapperWithMetar>> watchEntriesInCategory(Meteo_Metar icao) {
    final query = select(meteoWrapper).join(
        [leftOuterJoin(meteoMetar, meteoMetar.id.equalsExp(meteoWrapper.meteo_metar_icao))]);

    if (icao != null) {
      query.where(meteoMetar.id.equals(icao.id));
    } else {
      query.where(isNull(meteoMetar.id));
    }

    return query.watch().map((rows) {
      // read both the entry and the associated category for each row
      return rows.map((row) {
        return WrapperWithMetar(
          row.readTable(meteoWrapper),
          row.readTable(meteoMetar),
        );
      }).toList();
    });
  }

  Future createEntry(MeteoWrapperCompanion entry) {
    return into(meteoWrapper).insert(entry);
  }

  /// Updates the row in the database represents this entry by writing the
  /// updated data.
  Future updateEntry(Meteo_Wrapper entry) {
    return update(meteoWrapper).replace(entry);
  }
  //Update for some constraints:
  Future moveImportantTasksIntoCategory(Meteo_Metar target) {
    // for updates, we use the "companion" version of a generated class. This wraps the
    // fields in a "Value" type which can be set to be absent using "Value.absent()". This
    // allows us to separate between "SET category = NULL" (`category: Value(null)`) and not
    // updating the category at all: `category: Value.absent()`.
    return (update(meteoWrapper)
      ..where((t) => t.flightrulecolorcode.like('%Important%'))
    ).write(MeteoWrapperCompanion(
      meteo_metar_icao: Value(target.id),
    ),
    );
  }

  Future deleteEntry(Meteo_Wrapper entry) {
    return delete(meteoWrapper).delete(entry);
  }

  Future<int> createCategory(String icao) {
    return into(meteoMetar)
        .insert(MeteoMetarCompanion(icao: Value(icao)));
  }

  Future deleteCategory(Meteo_Metar icao) {
    return transaction(() async {
      await _resetCategory(icao.id);
      await delete(meteoMetar).delete(icao);
    });
  }

  //TODO: CRUD operations for tables:

  //CRUD for MeteoTaf Table:
  //Create an entry:
  Future createMeteoTafEntry (MeteoTafCompanion meteoTafEntry) {
    return into(meteoTaf).insert(meteoTafEntry);
  }
  //Read all entries:
  Future<List<meteo_taf>> get allMeteoTafEntries => select(meteoTaf).get();
  //Read an entry with its id:
  Stream<meteo_taf> entryByIdMeteoTaf(int id) {
    return (select(meteoTaf)..where((t) => t.id.equals(id))).watchSingle();
  }
  //Read with mapping:
  Stream<List<String>> contentWithLongTitlesMeteoTaf() {
    final query = select(meteoTaf)
      ..where((t) => t.cld1type.length.isBiggerOrEqualValue(16));

    return query
        .map((row) => row.cld1type)
        .watch();
  }
  //Update entry:
  Future updateMeteoTafEntry(MeteoTafCompanion meteoTafEntry) {
    return update(meteoTaf).replace(meteoTafEntry);
  }
  //Delete entry:
  Future deleteMeteoTafEntry(MeteoTafCompanion meteoTafEntry) {
    return delete(meteoTaf).delete(meteoTafEntry);
  }
  //Delete for some constraints:
  Future feelingLazyMeteoTaf() {
    // delete the oldest nine tasks
    return (delete(meteoTaf)..where((t) => t.id.isSmallerThanValue(10))).go();
  }

  //-----------------------------------------------------------------------------------------------------------------------
  //CRUD for C2rscAirfield Table:
  Future createC2rscAirfieldEntry (C2rscAirfieldCompanion c2rscAirfieldEntry) {
    return into(c2rscAirfield).insert(c2rscAirfieldEntry);
  }

  Future<List<c2rsc_airfield>> get allC2rscAirfieldEntries => select(c2rscAirfield).get();

  Future updateC2rscAirfieldEntry(C2rscAirfieldCompanion c2rscAirfieldEntry) {
    return update(c2rscAirfield).replace(c2rscAirfieldEntry);
  }

  Future deleteC2rscAirfieldEntry(C2rscAirfieldCompanion c2rscAirfieldEntry) {
    return delete(c2rscAirfield).delete(c2rscAirfieldEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------
  //CRUD for C2rscNavigationFacility Table:
  Future createC2rscNavigationFacilityEntry (C2rscNavigationFacilityCompanion c2rscNavigationFacilityEntry) {
    return into(c2rscNavigationFacility).insert(c2rscNavigationFacilityEntry);
  }

  Future<List<c2rsc_navigation_facility>> get allC2rscNavigationFacilityEntries => select(c2rscNavigationFacility).get();

  Future updateC2rscNavigationFacilityEntry(C2rscNavigationFacilityCompanion c2rscNavigationFacilityEntry) {
    return update(c2rscNavigationFacility).replace(c2rscNavigationFacilityEntry);
  }

  Future deleteC2rscNavigationFacilityEntry(C2rscNavigationFacilityCompanion c2rscNavigationFacilityEntry) {
    return delete(c2rscNavigationFacility).delete(c2rscNavigationFacilityEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------
  //CRUD for C2rscRunway Table:
  Future createC2rscRunwayEntry (C2rscRunwayCompanion c2rscRunwayEntry) {
    return into(c2rscRunway).insert(c2rscRunwayEntry);
  }

  Future<List<c2rsc_runway>> get allC2rscRunwayEntries => select(c2rscRunway).get();

  Future updateC2rscRunwayEntry(C2rscRunwayCompanion c2rscRunwayEntry) {
    return update(c2rscRunway).replace(c2rscRunwayEntry);
  }

  Future deleteC2rscRunwayEntry(C2rscRunwayCompanion c2rscRunwayEntry) {
    return delete(c2rscRunway).delete(c2rscRunwayEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------
  //CRUD for C2rscRunwayFacility Table:
  Future createC2rscRunwayFacilityEntry (C2rscRunwayFacilityCompanion c2rscRunwayFacilityEntry) {
    return into(c2rscRunwayFacility).insert(c2rscRunwayFacilityEntry);
  }

  Future<List<c2rsc_runway_facility>> get allC2rscRunwayFacilityEntries => select(c2rscRunwayFacility).get();

  Future updateC2rscRunwayFacilityEntry(C2rscRunwayFacilityCompanion c2rscRunwayFacilityEntry) {
    return update(c2rscRunwayFacility).replace(c2rscRunwayFacilityEntry);
  }

  Future deleteC2rscRunwayFacilityEntry(C2rscRunwayFacilityCompanion c2rscRunwayFacilityEntry) {
    return delete(c2rscRunwayFacility).delete(c2rscRunwayFacilityEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------
  //TODO: DAFIF TABLES:

  // CRUD for DafifAirfield Table:
  Future createDafifAirfieldEntry (DafifAirfieldCompanion dafifAirfieldEntry) {
    return into(dafifAirfield).insert(dafifAirfieldEntry);
  }

  Future<List<dafif_airfield>> get allDafifAirfieldEntries => select(dafifAirfield).get();

  Future updateDafifAirfieldEntry(DafifAirfieldCompanion dafifAirfieldEntry) {
    return update(dafifAirfield).replace(dafifAirfieldEntry);
  }

  Future deleteDafifAirfieldEntry(DafifAirfieldCompanion dafifAirfieldEntry) {
    return delete(dafifAirfield).delete(dafifAirfieldEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifAppcArptType Table:
  Future createDafifAppcArptTypeEntry (DafifAppcArptTypeCompanion dafifAppcArptTypeEntry) {
    return into(dafifAppcArptType).insert(dafifAppcArptTypeEntry);
  }

  Future<List<dafif_appc_arpt_type>> get allDafifAppcArptTypeEntries => select(dafifAppcArptType).get();

  Future updateDafifAppcArptTypeEntry(DafifAppcArptTypeCompanion dafifAppcArptTypeEntry) {
    return update(dafifAppcArptType).replace(dafifAppcArptTypeEntry);
  }

  Future deleteDafifAppcArptTypeEntry(DafifAppcArptTypeCompanion dafifAppcArptTypeEntry) {
    return delete(dafifAppcArptType).delete(dafifAppcArptTypeEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifAppcAtsType Table:
  Future createDafifAppcAtsTypeEntry (DafifAppcAtsTypeCompanion dafifAppcAtsTypeEntry) {
    return into(dafifAppcAtsType).insert(dafifAppcAtsTypeEntry);
  }

  Future<List<dafif_appc_ats_type>> get allDafifAppcAtsTypeEntries => select(dafifAppcAtsType).get();

  Future updateDafifAppcAtsTypeEntry(DafifAppcAtsTypeCompanion dafifAppcAtsTypeEntry) {
    return update(dafifAppcAtsType).replace(dafifAppcAtsTypeEntry);
  }

  Future deleteDafifAppcAtsTypeEntry(DafifAppcAtsTypeCompanion dafifAppcAtsTypeEntry) {
    return delete(dafifAppcAtsType).delete(dafifAppcAtsTypeEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifAppcBdryType Table:
  Future createDafifAppcBdryTypeEntry (DafifAppcBdryTypeCompanion dafifAppcBdryTypeEntry) {
    return into(dafifAppcBdryType).insert(dafifAppcBdryTypeEntry);
  }

  Future<List<dafif_appc_bdry_type>> get allDafifAppcBdryTypeEntries => select(dafifAppcBdryType).get();

  Future updateDafifAppcBdryTypeEntry(DafifAppcBdryTypeCompanion dafifAppcBdryTypeEntry) {
    return update(dafifAppcBdryType).replace(dafifAppcBdryTypeEntry);
  }

  Future deleteDafifAppcBdryTypeEntry(DafifAppcBdryTypeCompanion dafifAppcBdryTypeEntry) {
    return delete(dafifAppcBdryType).delete(dafifAppcBdryTypeEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifAppcCcIcao Table:
  Future createDafifAppcCcIcaoEntry (DafifAppcCcIcaoCompanion dafifAppcCcIcaoEntry) {
    return into(dafifAppcCcIcao).insert(dafifAppcCcIcaoEntry);
  }

  Future<List<dafif_appc_cc_icao>> get allDafifAppcCcIcaoEntries => select(dafifAppcCcIcao).get();

  Future updateDafifAppcCcIcaoEntry(DafifAppcCcIcaoCompanion dafifAppcCcIcaoEntry) {
    return update(dafifAppcCcIcao).replace(dafifAppcCcIcaoEntry);
  }

  Future deleteDafifAppcCcIcaoEntry(DafifAppcCcIcaoCompanion dafifAppcCcIcaoEntry) {
    return delete(dafifAppcCcIcao).delete(dafifAppcCcIcaoEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifAppcLevel Table:
  Future createDafifAppcLevelEntry (DafifAppcLevelCompanion dafifAppcLevelEntry) {
    return into(dafifAppcLevel).insert(dafifAppcLevelEntry);
  }

  Future<List<dafif_appc_level>> get allDafifAppcLevelEntries => select(dafifAppcLevel).get();

  Future updateDafifAppcLevelEntry(DafifAppcLevelCompanion dafifAppcLevelEntry) {
    return update(dafifAppcLevel).replace(dafifAppcLevelEntry);
  }

  Future deleteDafifAppcLevelEntry(DafifAppcLevelCompanion dafifAppcLevelEntry) {
    return delete(dafifAppcLevel).delete(dafifAppcLevelEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifAppcSuasType Table:
  Future createDafifAppcSuasTypeEntry (DafifAppcSuasTypeCompanion dafifAppcSuasTypeEntry) {
    return into(dafifAppcSuasType).insert(dafifAppcSuasTypeEntry);
  }

  Future<List<dafif_appc_suas_type>> get allDafifAppcSuasTypeEntries => select(dafifAppcSuasType).get();

  Future updateDafifAppcSuasTypeEntry(DafifAppcSuasTypeCompanion dafifAppcSuasTypeEntry) {
    return update(dafifAppcSuasType).replace(dafifAppcSuasTypeEntry);
  }

  Future deleteDafifAppcSuasTypeEntry(DafifAppcSuasTypeCompanion dafifAppcSuasTypeEntry) {
    return delete(dafifAppcSuasType).delete(dafifAppcSuasTypeEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifArrestingSystem Table:
  Future createDafifArrestingSystemEntry (DafifArrestingSystemCompanion dafifArrestingSystemEntry) {
    return into(dafifArrestingSystem).insert(dafifArrestingSystemEntry);
  }

  Future<List<dafif_arresting_system>> get allDafifArrestingSystemEntries => select(dafifArrestingSystem).get();

  Future updateDafifArrestingSystemEntry(DafifArrestingSystemCompanion dafifArrestingSystemEntry) {
    return update(dafifArrestingSystem).replace(dafifArrestingSystemEntry);
  }

  Future deleteDafifArrestingSystemEntry(DafifArrestingSystemCompanion dafifArrestingSystemEntry) {
    return delete(dafifArrestingSystem).delete(dafifArrestingSystemEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifAtsroute Table:
  Future createDafifAtsrouteEntry (DafifAtsrouteCompanion dafifAtsrouteEntry) {
    return into(dafifAtsroute).insert(dafifAtsrouteEntry);
  }

  Future<List<dafif_atsroute>> get allDafifAtsrouteEntries => select(dafifAtsroute).get();

  Future updateDafifAtsrouteEntry(DafifAtsrouteCompanion dafifAtsrouteEntry) {
    return update(dafifAtsroute).replace(dafifAtsrouteEntry);
  }

  Future deleteDafifAtsrouteEntry(DafifAtsrouteCompanion dafifAtsrouteEntry) {
    return delete(dafifAtsroute).delete(dafifAtsrouteEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifBdry Table:
  Future createDafifBdryEntry (DafifBdryCompanion dafifBdryEntry) {
    return into(dafifBdry).insert(dafifBdryEntry);
  }

  Future<List<dafif_bdry>> get allDafifBdryEntries => select(dafifBdry).get();

  Future updateDafifBdryEntry(DafifBdryCompanion dafifBdryEntry) {
    return update(dafifBdry).replace(dafifBdryEntry);
  }

  Future deleteDafifBdryEntry(DafifBdryCompanion dafifBdryEntry) {
    return delete(dafifBdry).delete(dafifBdryEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifBdryPar Table:
  Future createDafifBdryParEntry (DafifBdryParCompanion dafifBdryParEntry) {
    return into(dafifBdryPar).insert(dafifBdryParEntry);
  }

  Future<List<dafif_bdry_par>> get allDafifBdryParEntries => select(dafifBdryPar).get();

  Future updateDafifBdryParEntry(DafifBdryParCompanion dafifBdryParEntry) {
    return update(dafifBdryPar).replace(dafifBdryParEntry);
  }

  Future deleteDafifBdryParEntry(DafifBdryParCompanion dafifBdryParEntry) {
    return delete(dafifBdryPar).delete(dafifBdryParEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifCommunication Table:
  Future createDafifCommunicationEntry (DafifCommunicationCompanion dafifCommunicationEntry) {
    return into(dafifCommunication).insert(dafifCommunicationEntry);
  }

  Future<List<dafif_communication>> get allDafifCommunicationEntries => select(dafifCommunication).get();

  Future updateDafifCommunicationEntry(DafifCommunicationCompanion dafifCommunicationEntry) {
    return update(dafifCommunication).replace(dafifCommunicationEntry);
  }

  Future deleteDafifCommunicationEntry(DafifCommunicationCompanion dafifCommunicationEntry) {
    return delete(dafifCommunication).delete(dafifCommunicationEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifFirUir Table:
  Future createDafifFirUirEntry (DafifFirUirCompanion dafifFirUirEntry) {
    return into(dafifFirUir).insert(dafifFirUirEntry);
  }

  Future<List<dafif_fir_uir>> get allDafifFirUirEntries => select(dafifFirUir).get();

  Future updateDafifFirUirEntry(DafifFirUirCompanion dafifFirUirEntry) {
    return update(dafifFirUir).replace(dafifFirUirEntry);
  }

  Future deleteDafifFirUirEntry(DafifFirUirCompanion dafifFirUirEntry) {
    return delete(dafifFirUir).delete(dafifFirUirEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifHolding Table:
  Future createDafifHoldingEntry (DafifHoldingCompanion dafifHoldingEntry) {
    return into(dafifHolding).insert(dafifHoldingEntry);
  }

  Future<List<dafif_holding>> get allDafifHoldingEntries => select(dafifHolding).get();

  Future updateDafifHoldingEntry(DafifHoldingCompanion dafifHoldingEntry) {
    return update(dafifHolding).replace(dafifHoldingEntry);
  }

  Future deleteDafifHoldingEntry(DafifHoldingCompanion dafifHoldingEntry) {
    return delete(dafifHolding).delete(dafifHoldingEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifNavaid Table:
  Future createDafifNavaidEntry (DafifNavaidCompanion dafifNavaidEntry) {
    return into(dafifNavaid).insert(dafifNavaidEntry);
  }

  Future<List<dafif_navaid>> get allDafifNavaidEntries => select(dafifNavaid).get();

  Future updateDafifNavaidEntry(DafifNavaidCompanion dafifNavaidEntry) {
    return update(dafifNavaid).replace(dafifNavaidEntry);
  }

  Future deleteDafifNavaidEntry(DafifNavaidCompanion dafifNavaidEntry) {
    return delete(dafifNavaid).delete(dafifNavaidEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifNavaidIls Table:
  Future createDafifNavaidIlsEntry (DafifNavaidIlsCompanion dafifNavaidIlsEntry) {
    return into(dafifNavaidIls).insert(dafifNavaidIlsEntry);
  }

  Future<List<dafif_navaid_ils>> get allDafifNavaidIlsEntries => select(dafifNavaidIls).get();

  Future updateDafifNavaidIlsEntry(DafifNavaidIlsCompanion dafifNavaidIlsEntry) {
    return update(dafifNavaidIls).replace(dafifNavaidIlsEntry);
  }

  Future deleteDafifNavaidIlsEntry(DafifNavaidIlsCompanion dafifNavaidIlsEntry) {
    return delete(dafifNavaidIls).delete(dafifNavaidIlsEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifRunway Table:
  Future createDafifRunwayEntry (DafifRunwayCompanion dafifRunwayEntry) {
    return into(dafifRunway).insert(dafifRunwayEntry);
  }

  Future<List<dafif_runway>> get allDafifRunwayEntries => select(dafifRunway).get();

  Future updateDafifRunwayEntry(DafifRunwayCompanion dafifRunwayEntry) {
    return update(dafifRunway).replace(dafifRunwayEntry);
  }

  Future deleteDafifRunwayEntry(DafifRunwayCompanion dafifRunwayEntry) {
    return delete(dafifRunway).delete(dafifRunwayEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifSpecialUseAirspace Table:
  Future createDafifSpecialUseAirspaceEntry (DafifSpecialUseAirspaceCompanion dafifSpecialUseAirspaceEntry) {
    return into(dafifSpecialUseAirspace).insert(dafifSpecialUseAirspaceEntry);
  }

  Future<List<dafif_special_use_airspace>> get allDafifSpecialUseAirspaceEntries => select(dafifSpecialUseAirspace).get();

  Future updateDafifSpecialUseAirspaceEntry(DafifSpecialUseAirspaceCompanion dafifSpecialUseAirspaceEntry) {
    return update(dafifSpecialUseAirspace).replace(dafifSpecialUseAirspaceEntry);
  }

  Future deleteDafifSpecialUseAirspaceEntry(DafifSpecialUseAirspaceCompanion dafifSpecialUseAirspaceEntry) {
    return delete(dafifSpecialUseAirspace).delete(dafifSpecialUseAirspaceEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifSpecialUseAirspacePar Table:
  Future createDafifSpecialUseAirspaceParEntry (DafifSpecialUseAirspaceParCompanion dafifSpecialUseAirspaceParEntry) {
    return into(dafifSpecialUseAirspacePar).insert(dafifSpecialUseAirspaceParEntry);
  }

  Future<List<dafif_special_use_airspace_par>> get allDafifSpecialUseAirspaceParEntries => select(dafifSpecialUseAirspacePar).get();

  Future updateDafifSpecialUseAirspaceParEntry(DafifSpecialUseAirspaceParCompanion dafifSpecialUseAirspaceParEntry) {
    return update(dafifSpecialUseAirspacePar).replace(dafifSpecialUseAirspaceParEntry);
  }

  Future deleteDafifSpecialUseAirspaceParEntry(DafifSpecialUseAirspaceParCompanion dafifSpecialUseAirspaceParEntry) {
    return delete(dafifSpecialUseAirspacePar).delete(dafifSpecialUseAirspaceParEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifTrmMsa Table:
  Future createDafifTrmMsaEntry (DafifTrmMsaCompanion dafifTrmMsaEntry) {
    return into(dafifTrmMsa).insert(dafifTrmMsaEntry);
  }

  Future<List<dafif_trm_msa>> get allDafifTrmMsaEntries => select(dafifTrmMsa).get();

  Future updateDafifTrmMsaEntry(DafifTrmMsaCompanion dafifTrmMsaEntry) {
    return update(dafifTrmMsa).replace(dafifTrmMsaEntry);
  }

  Future deleteDafifTrmMsaEntry(DafifTrmMsaCompanion dafifTrmMsaEntry) {
    return delete(dafifTrmMsa).delete(dafifTrmMsaEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifTrmSeg Table:
  Future createDafifTrmSegEntry (DafifTrmSegCompanion dafifTrmSegEntry) {
    return into(dafifTrmSeg).insert(dafifTrmSegEntry);
  }

  Future<List<dafif_trm_seg>> get allDafifTrmSegEntries => select(dafifTrmSeg).get();

  Future updateDafifTrmSegEntry(DafifTrmSegCompanion dafifTrmSegEntry) {
    return update(dafifTrmSeg).replace(dafifTrmSegEntry);
  }

  Future deleteDafifTrmSegEntry(DafifTrmSegCompanion dafifTrmSegEntry) {
    return delete(dafifTrmSeg).delete(dafifTrmSegEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifVersionInfo Table:
  Future createDafifVersionInfoEntry (DafifVersionInfoCompanion dafifVersionInfoEntry) {
    return into(dafifVersionInfo).insert(dafifVersionInfoEntry);
  }

  Future<List<dafif_version_info>> get allDafifVersionInfoEntries => select(dafifVersionInfo).get();

  Future updateDafifVersionInfoEntry(DafifVersionInfoCompanion dafifVersionInfoEntry) {
    return update(dafifVersionInfo).replace(dafifVersionInfoEntry);
  }

  Future deleteDafifVersionInfoEntry(DafifVersionInfoCompanion dafifVersionInfoEntry) {
    return delete(dafifVersionInfo).delete(dafifVersionInfoEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------

  // CRUD for DafifWaypoint Table:
  Future createDafifWaypointEntry (DafifWaypointCompanion dafifWaypointEntry) {
    return into(dafifWaypoint).insert(dafifWaypointEntry);
  }

  Future<List<dafif_waypoint>> get allDafifWaypointEntries => select(dafifWaypoint).get();

  Future updateDafifWaypointEntry(DafifWaypointCompanion dafifWaypointEntry) {
    return update(dafifWaypoint).replace(dafifWaypointEntry);
  }

  Future deleteDafifWaypointEntry(DafifWaypointCompanion dafifWaypointEntry) {
    return delete(dafifWaypoint).delete(dafifWaypointEntry);
  }














  //-----------------------------------------------------------------------------------------------------------------------
  //CRUD for HupgpFlightroute Table:
  Future createHupgpFlightrouteEntry (HupgpFlightrouteCompanion hupgpFlightrouteEntry) {
    return into(hupgpFlightroute).insert(hupgpFlightrouteEntry);
  }

  Future<List<hupgp_flightroute>> get allHupgpFlightrouteEntries => select(hupgpFlightroute).get();

  Future updateHupgpFlightrouteEntry(HupgpFlightrouteCompanion hupgpFlightrouteEntry) {
    return update(hupgpFlightroute).replace(hupgpFlightrouteEntry);
  }

  Future deleteHupgpFlightrouteEntry(HupgpFlightrouteCompanion hupgpFlightrouteEntry) {
    return delete(hupgpFlightroute).delete(hupgpFlightrouteEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------
  //CRUD for HupgpMissionFlightRoute Table:
  Future createHupgpMissionFlightRouteEntry (HupgpMissionFlightRouteCompanion hupgpMissionFlightrouteEntry) {
    return into(hupgpMissionFlightRoute).insert(hupgpMissionFlightrouteEntry);
  }

  Future<List<hupgp__mission_flight_route>> get allHupgpMissionFlightRouteEntries => select(hupgpMissionFlightRoute).get();

  Future updateHupgpMissionFlightRouteEntry(HupgpMissionFlightRouteCompanion hupgpMissionFlightrouteEntry) {
    return update(hupgpMissionFlightRoute).replace(hupgpMissionFlightrouteEntry);
  }

  Future deleteHupgpMissionFlightRouteEntry(HupgpMissionFlightRouteCompanion hupgpMissionFlightrouteEntry) {
    return delete(hupgpMissionFlightRoute).delete(hupgpMissionFlightrouteEntry);
  }

  //-----------------------------------------------------------------------------------------------------------------------
  //CRUD for HupgpZMaterialAircraftType Table:
  Future createHupgpZMaterialAircraftTypeEntry (HupgpZMaterialAircraftTypeCompanion hupgpZMaterialAircraftTypeEntry) {
    return into(hupgpZMaterialAircraftType).insert(hupgpZMaterialAircraftTypeEntry);
  }

  Future<List<hupgp_z_material_aircraft_type>> get allHupgpZMaterialAircraftTypeEntries => select(hupgpZMaterialAircraftType).get();

  Future updateHupgpZMaterialAircraftTypeEntry(HupgpZMaterialAircraftTypeCompanion hupgpZMaterialAircraftTypeEntry) {
    return update(hupgpZMaterialAircraftType).replace(hupgpZMaterialAircraftTypeEntry);
  }

  Future deleteHupgpZMaterialAircraftTypeEntry(HupgpZMaterialAircraftTypeCompanion hupgpZMaterialAircraftTypeEntry) {
    return delete(hupgpZMaterialAircraftType).delete(hupgpZMaterialAircraftTypeEntry);
  }


}