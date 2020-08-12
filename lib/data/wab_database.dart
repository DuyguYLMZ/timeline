import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor/moor.dart';

part 'wab_database.g.dart';

class WabSeats extends Table {

  TextColumn get missionid => text().named('missionid').customConstraint('UNIQUE')();

  TextColumn get type => text().named('type')();

  TextColumn get id => text().named('id').customConstraint('UNIQUE')();

  TextColumn get location => text().named('location')();

  TextColumn get dimension => text().named('dimension')();

  TextColumn get labelalignment => text().named('labelAlignment')();

  RealColumn get weight => real().named('weight')();

  RealColumn get maxweight => real().named('maxweight')();

  RealColumn get startarm => real().named('startarm')();

  RealColumn get endarm => real().named('endarm')();

  RealColumn get y => real().named('y')();

  RealColumn get x => real().named('x')();

  BoolColumn get multiLoadable => boolean().named('multiLoadable')();

  BoolColumn get isEmpty => boolean().named('isEmpty')();
}

class WabCrews extends Table {
  TextColumn get missionid => text().named('missionid').customConstraint('UNIQUE')();
  TextColumn get type => text().named('type')();

  TextColumn get id => text().named('id').customConstraint('UNIQUE')();

  TextColumn get location => text().named('location')();

  TextColumn get dimension => text().named('dimension')();

  TextColumn get labelalignment => text().named('labelAlignment')();

  RealColumn get weight => real().named('weight')();

  RealColumn get maxweight => real().named('maxweight')();

  RealColumn get startarm => real().named('startarm')();

  RealColumn get endarm => real().named('endarm')();

  RealColumn get y => real().named('y')();

  RealColumn get x => real().named('x')();

  BoolColumn get multiLoadable => boolean().named('multiLoadable')();

  BoolColumn get isEmpty => boolean().named('isEmpty')();

/* @override
  Set<Column> get primaryKey => {id};*/
}

class WabCargos extends Table {
  TextColumn get missionid => text().named('missionid').customConstraint('UNIQUE')();
  TextColumn get loadedItems => text().named('loadedItems')();

  TextColumn get isFixed => text().named('id').customConstraint('UNIQUE')();

  RealColumn get totalWeight => real().named('totalWeight')();

  RealColumn get loadableWidth => real().named('loadableWidth')();

  RealColumn get loadableLength => real().named('loadableLength')();


/* @override
  Set<Column> get primaryKey => {id};*/
}

class WabMissionPlan extends Table {
  TextColumn get missionid => text().named('missionid').customConstraint('UNIQUE')();
}

class WABAllModel {
  final WabSeats seats;
  final WabCrews crew;

  WABAllModel({@required this.seats, @required this.crew});
}

@UseMoor(tables: [WabMissionPlan, WabSeats, WabCrews, WabCargos], daos: [WabSeatDAO, WabCrewDAO, WabMissionDAO])
class MyDatabase extends _$MyDatabase {
  MyDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;
}

@UseDao(tables: [WabSeats])
class WabSeatDAO extends DatabaseAccessor<MyDatabase> with _$WabSeatDAOMixin {
  final MyDatabase db;

  WabSeatDAO(this.db) : super(db);

  Future<List<WabSeat>> get getAllSeats => select(wabSeats).get();

  Stream<List<WabSeat>> get watchAllSeats => select(wabSeats).watch();

  Future insertSeat(WabSeat seat) => into(wabSeats).insert(seat);

  Future updateSeat(WabSeat seat) => update(wabSeats).replace(seat);

  Future deleteSeat(WabSeat seat) => delete(wabSeats).delete(seat);
}

@UseDao(tables: [WabCrews])
class WabCrewDAO extends DatabaseAccessor<MyDatabase> with _$WabCrewDAOMixin {
  final MyDatabase db;

  WabCrewDAO(this.db) : super(db);

  Future<List<WabCrew>> get getAllCrews => select(wabCrews).get();

  Stream<List<WabCrew>> get watchAllCrews => select(wabCrews).watch();

  Future insertCrew(WabCrew crew) => into(wabCrews).insert(crew);

  Future updateCrew(WabCrew crew) => update(wabCrews).replace(crew);

  Future deleteCrew(WabCrew crew) => delete(wabCrews).delete(crew);
}

@UseDao(tables: [WabCargos])
class WabCargoDAO extends DatabaseAccessor<MyDatabase> with _$WabCargoDAOMixin {
  final MyDatabase db;

  WabCargoDAO(this.db) : super(db);

  Future<List<WabCargo>> get getAllCrews => select(wabCargos).get();

  Stream<List<WabCargo>> get watchAllCrews => select(wabCargos).watch();

  Future insertCrew(WabCargo cargo) => into(wabCargos).insert(cargo);

  Future updateCrew(WabCargo cargo) => update(wabCargos).replace(cargo);

  Future deleteCrew(WabCargo cargo) => delete(wabCargos).delete(cargo);
}

@UseDao(tables: [WabMissionPlan,WabCrews,WabSeats])
class WabMissionDAO extends DatabaseAccessor<MyDatabase> with _$WabMissionDAOMixin {
  final MyDatabase db;

  WabMissionDAO(this.db) : super(db);

  Stream<List<WABAllModel>> watchAllModel() {
    return (select(wabMissionPlan)
      ..orderBy(
        [
              (t) => OrderingTerm(expression: t.missionid, mode: OrderingMode.asc),
              (t) => OrderingTerm(expression: t.missionid),
        ],
      ))
        .join(
      [
        leftOuterJoin(wabSeats,
            wabSeats.missionid.equalsExp(wabMissionPlan.missionid)),
      ],
    )
        .watch()
        .map((rows) => rows.map(
          (row) {
        return WABAllModel(
          seats: wabSeats,
          crew: wabCrews,
        );
      },
    ).toList());
  }

  Future<List<WabMissionPlanData>> get allWatchingCategorys => select(wabMissionPlan).get();

/*//Adds a category name...
  void addCategory({String ctitle, DateTime ctimestamp}) {
    final _entry = CategorysCompanion(
      ctitle: Value(ctitle),
      ctimestamp: Value(ctimestamp),
    );
    into(categorys).insert(_entry);
  }

//Updates a category name...
  void updateCategory({String ctitle, DateTime ctimestamp}) {
    final _entry = CategorysCompanion(
      ctitle: Value(ctitle),
      ctimestamp: Value(ctimestamp),
    );
    update(categorys).write(_entry);
  }*/
}


