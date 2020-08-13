// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wab_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class WabMissionPlanData extends DataClass
    implements Insertable<WabMissionPlanData> {
  final String missionid;
  WabMissionPlanData({@required this.missionid});
  factory WabMissionPlanData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return WabMissionPlanData(
      missionid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}missionid']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || missionid != null) {
      map['missionid'] = Variable<String>(missionid);
    }
    return map;
  }

  factory WabMissionPlanData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WabMissionPlanData(
      missionid: serializer.fromJson<String>(json['missionid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'missionid': serializer.toJson<String>(missionid),
    };
  }

  WabMissionPlanData copyWith({String missionid}) => WabMissionPlanData(
        missionid: missionid ?? this.missionid,
      );
  @override
  String toString() {
    return (StringBuffer('WabMissionPlanData(')
          ..write('missionid: $missionid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(missionid.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WabMissionPlanData && other.missionid == this.missionid);
}

class WabMissionPlanCompanion extends UpdateCompanion<WabMissionPlanData> {
  final Value<String> missionid;
  const WabMissionPlanCompanion({
    this.missionid = const Value.absent(),
  });
  WabMissionPlanCompanion.insert({
    @required String missionid,
  }) : missionid = Value(missionid);
  static Insertable<WabMissionPlanData> custom({
    Expression<String> missionid,
  }) {
    return RawValuesInsertable({
      if (missionid != null) 'missionid': missionid,
    });
  }

  WabMissionPlanCompanion copyWith({Value<String> missionid}) {
    return WabMissionPlanCompanion(
      missionid: missionid ?? this.missionid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (missionid.present) {
      map['missionid'] = Variable<String>(missionid.value);
    }
    return map;
  }
}

class $WabMissionPlanTable extends WabMissionPlan
    with TableInfo<$WabMissionPlanTable, WabMissionPlanData> {
  final GeneratedDatabase _db;
  final String _alias;
  $WabMissionPlanTable(this._db, [this._alias]);
  final VerificationMeta _missionidMeta = const VerificationMeta('missionid');
  GeneratedTextColumn _missionid;
  @override
  GeneratedTextColumn get missionid => _missionid ??= _constructMissionid();
  GeneratedTextColumn _constructMissionid() {
    return GeneratedTextColumn('missionid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [missionid];
  @override
  $WabMissionPlanTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'wab_mission_plan';
  @override
  final String actualTableName = 'wab_mission_plan';
  @override
  VerificationContext validateIntegrity(Insertable<WabMissionPlanData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('missionid')) {
      context.handle(_missionidMeta,
          missionid.isAcceptableOrUnknown(data['missionid'], _missionidMeta));
    } else if (isInserting) {
      context.missing(_missionidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  WabMissionPlanData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WabMissionPlanData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WabMissionPlanTable createAlias(String alias) {
    return $WabMissionPlanTable(_db, alias);
  }
}

class WabSeat extends DataClass implements Insertable<WabSeat> {
  final String missionid;
  final String type;
  final String id;
  final String location;
  final String dimension;
  final String labelalignment;
  final double weight;
  final double maxweight;
  final double startarm;
  final double endarm;
  final double y;
  final double x;
  final bool multiLoadable;
  final bool isEmpty;
  WabSeat(
      {@required this.missionid,
      @required this.type,
      @required this.id,
      @required this.location,
      @required this.dimension,
      @required this.labelalignment,
      @required this.weight,
      @required this.maxweight,
      @required this.startarm,
      @required this.endarm,
      @required this.y,
      @required this.x,
      @required this.multiLoadable,
      @required this.isEmpty});
  factory WabSeat.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final boolType = db.typeSystem.forDartType<bool>();
    return WabSeat(
      missionid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}missionid']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      dimension: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}dimension']),
      labelalignment: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}labelAlignment']),
      weight:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      maxweight: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}maxweight']),
      startarm: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}startarm']),
      endarm:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}endarm']),
      y: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}y']),
      x: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}x']),
      multiLoadable: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}multiLoadable']),
      isEmpty:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}isEmpty']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || missionid != null) {
      map['missionid'] = Variable<String>(missionid);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || dimension != null) {
      map['dimension'] = Variable<String>(dimension);
    }
    if (!nullToAbsent || labelalignment != null) {
      map['labelAlignment'] = Variable<String>(labelalignment);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || maxweight != null) {
      map['maxweight'] = Variable<double>(maxweight);
    }
    if (!nullToAbsent || startarm != null) {
      map['startarm'] = Variable<double>(startarm);
    }
    if (!nullToAbsent || endarm != null) {
      map['endarm'] = Variable<double>(endarm);
    }
    if (!nullToAbsent || y != null) {
      map['y'] = Variable<double>(y);
    }
    if (!nullToAbsent || x != null) {
      map['x'] = Variable<double>(x);
    }
    if (!nullToAbsent || multiLoadable != null) {
      map['multiLoadable'] = Variable<bool>(multiLoadable);
    }
    if (!nullToAbsent || isEmpty != null) {
      map['isEmpty'] = Variable<bool>(isEmpty);
    }
    return map;
  }

  factory WabSeat.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WabSeat(
      missionid: serializer.fromJson<String>(json['missionid']),
      type: serializer.fromJson<String>(json['type']),
      id: serializer.fromJson<String>(json['id']),
      location: serializer.fromJson<String>(json['location']),
      dimension: serializer.fromJson<String>(json['dimension']),
      labelalignment: serializer.fromJson<String>(json['labelalignment']),
      weight: serializer.fromJson<double>(json['weight']),
      maxweight: serializer.fromJson<double>(json['maxweight']),
      startarm: serializer.fromJson<double>(json['startarm']),
      endarm: serializer.fromJson<double>(json['endarm']),
      y: serializer.fromJson<double>(json['y']),
      x: serializer.fromJson<double>(json['x']),
      multiLoadable: serializer.fromJson<bool>(json['multiLoadable']),
      isEmpty: serializer.fromJson<bool>(json['isEmpty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'missionid': serializer.toJson<String>(missionid),
      'type': serializer.toJson<String>(type),
      'id': serializer.toJson<String>(id),
      'location': serializer.toJson<String>(location),
      'dimension': serializer.toJson<String>(dimension),
      'labelalignment': serializer.toJson<String>(labelalignment),
      'weight': serializer.toJson<double>(weight),
      'maxweight': serializer.toJson<double>(maxweight),
      'startarm': serializer.toJson<double>(startarm),
      'endarm': serializer.toJson<double>(endarm),
      'y': serializer.toJson<double>(y),
      'x': serializer.toJson<double>(x),
      'multiLoadable': serializer.toJson<bool>(multiLoadable),
      'isEmpty': serializer.toJson<bool>(isEmpty),
    };
  }

  WabSeat copyWith(
          {String missionid,
          String type,
          String id,
          String location,
          String dimension,
          String labelalignment,
          double weight,
          double maxweight,
          double startarm,
          double endarm,
          double y,
          double x,
          bool multiLoadable,
          bool isEmpty}) =>
      WabSeat(
        missionid: missionid ?? this.missionid,
        type: type ?? this.type,
        id: id ?? this.id,
        location: location ?? this.location,
        dimension: dimension ?? this.dimension,
        labelalignment: labelalignment ?? this.labelalignment,
        weight: weight ?? this.weight,
        maxweight: maxweight ?? this.maxweight,
        startarm: startarm ?? this.startarm,
        endarm: endarm ?? this.endarm,
        y: y ?? this.y,
        x: x ?? this.x,
        multiLoadable: multiLoadable ?? this.multiLoadable,
        isEmpty: isEmpty ?? this.isEmpty,
      );
  @override
  String toString() {
    return (StringBuffer('WabSeat(')
          ..write('missionid: $missionid, ')
          ..write('type: $type, ')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('dimension: $dimension, ')
          ..write('labelalignment: $labelalignment, ')
          ..write('weight: $weight, ')
          ..write('maxweight: $maxweight, ')
          ..write('startarm: $startarm, ')
          ..write('endarm: $endarm, ')
          ..write('y: $y, ')
          ..write('x: $x, ')
          ..write('multiLoadable: $multiLoadable, ')
          ..write('isEmpty: $isEmpty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      missionid.hashCode,
      $mrjc(
          type.hashCode,
          $mrjc(
              id.hashCode,
              $mrjc(
                  location.hashCode,
                  $mrjc(
                      dimension.hashCode,
                      $mrjc(
                          labelalignment.hashCode,
                          $mrjc(
                              weight.hashCode,
                              $mrjc(
                                  maxweight.hashCode,
                                  $mrjc(
                                      startarm.hashCode,
                                      $mrjc(
                                          endarm.hashCode,
                                          $mrjc(
                                              y.hashCode,
                                              $mrjc(
                                                  x.hashCode,
                                                  $mrjc(
                                                      multiLoadable.hashCode,
                                                      isEmpty
                                                          .hashCode))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WabSeat &&
          other.missionid == this.missionid &&
          other.type == this.type &&
          other.id == this.id &&
          other.location == this.location &&
          other.dimension == this.dimension &&
          other.labelalignment == this.labelalignment &&
          other.weight == this.weight &&
          other.maxweight == this.maxweight &&
          other.startarm == this.startarm &&
          other.endarm == this.endarm &&
          other.y == this.y &&
          other.x == this.x &&
          other.multiLoadable == this.multiLoadable &&
          other.isEmpty == this.isEmpty);
}

class WabSeatsCompanion extends UpdateCompanion<WabSeat> {
  final Value<String> missionid;
  final Value<String> type;
  final Value<String> id;
  final Value<String> location;
  final Value<String> dimension;
  final Value<String> labelalignment;
  final Value<double> weight;
  final Value<double> maxweight;
  final Value<double> startarm;
  final Value<double> endarm;
  final Value<double> y;
  final Value<double> x;
  final Value<bool> multiLoadable;
  final Value<bool> isEmpty;
  const WabSeatsCompanion({
    this.missionid = const Value.absent(),
    this.type = const Value.absent(),
    this.id = const Value.absent(),
    this.location = const Value.absent(),
    this.dimension = const Value.absent(),
    this.labelalignment = const Value.absent(),
    this.weight = const Value.absent(),
    this.maxweight = const Value.absent(),
    this.startarm = const Value.absent(),
    this.endarm = const Value.absent(),
    this.y = const Value.absent(),
    this.x = const Value.absent(),
    this.multiLoadable = const Value.absent(),
    this.isEmpty = const Value.absent(),
  });
  WabSeatsCompanion.insert({
    @required String missionid,
    @required String type,
    @required String id,
    @required String location,
    @required String dimension,
    @required String labelalignment,
    @required double weight,
    @required double maxweight,
    @required double startarm,
    @required double endarm,
    @required double y,
    @required double x,
    @required bool multiLoadable,
    @required bool isEmpty,
  })  : missionid = Value(missionid),
        type = Value(type),
        id = Value(id),
        location = Value(location),
        dimension = Value(dimension),
        labelalignment = Value(labelalignment),
        weight = Value(weight),
        maxweight = Value(maxweight),
        startarm = Value(startarm),
        endarm = Value(endarm),
        y = Value(y),
        x = Value(x),
        multiLoadable = Value(multiLoadable),
        isEmpty = Value(isEmpty);
  static Insertable<WabSeat> custom({
    Expression<String> missionid,
    Expression<String> type,
    Expression<String> id,
    Expression<String> location,
    Expression<String> dimension,
    Expression<String> labelalignment,
    Expression<double> weight,
    Expression<double> maxweight,
    Expression<double> startarm,
    Expression<double> endarm,
    Expression<double> y,
    Expression<double> x,
    Expression<bool> multiLoadable,
    Expression<bool> isEmpty,
  }) {
    return RawValuesInsertable({
      if (missionid != null) 'missionid': missionid,
      if (type != null) 'type': type,
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (dimension != null) 'dimension': dimension,
      if (labelalignment != null) 'labelAlignment': labelalignment,
      if (weight != null) 'weight': weight,
      if (maxweight != null) 'maxweight': maxweight,
      if (startarm != null) 'startarm': startarm,
      if (endarm != null) 'endarm': endarm,
      if (y != null) 'y': y,
      if (x != null) 'x': x,
      if (multiLoadable != null) 'multiLoadable': multiLoadable,
      if (isEmpty != null) 'isEmpty': isEmpty,
    });
  }

  WabSeatsCompanion copyWith(
      {Value<String> missionid,
      Value<String> type,
      Value<String> id,
      Value<String> location,
      Value<String> dimension,
      Value<String> labelalignment,
      Value<double> weight,
      Value<double> maxweight,
      Value<double> startarm,
      Value<double> endarm,
      Value<double> y,
      Value<double> x,
      Value<bool> multiLoadable,
      Value<bool> isEmpty}) {
    return WabSeatsCompanion(
      missionid: missionid ?? this.missionid,
      type: type ?? this.type,
      id: id ?? this.id,
      location: location ?? this.location,
      dimension: dimension ?? this.dimension,
      labelalignment: labelalignment ?? this.labelalignment,
      weight: weight ?? this.weight,
      maxweight: maxweight ?? this.maxweight,
      startarm: startarm ?? this.startarm,
      endarm: endarm ?? this.endarm,
      y: y ?? this.y,
      x: x ?? this.x,
      multiLoadable: multiLoadable ?? this.multiLoadable,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (missionid.present) {
      map['missionid'] = Variable<String>(missionid.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (dimension.present) {
      map['dimension'] = Variable<String>(dimension.value);
    }
    if (labelalignment.present) {
      map['labelAlignment'] = Variable<String>(labelalignment.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (maxweight.present) {
      map['maxweight'] = Variable<double>(maxweight.value);
    }
    if (startarm.present) {
      map['startarm'] = Variable<double>(startarm.value);
    }
    if (endarm.present) {
      map['endarm'] = Variable<double>(endarm.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (multiLoadable.present) {
      map['multiLoadable'] = Variable<bool>(multiLoadable.value);
    }
    if (isEmpty.present) {
      map['isEmpty'] = Variable<bool>(isEmpty.value);
    }
    return map;
  }
}

class $WabSeatsTable extends WabSeats with TableInfo<$WabSeatsTable, WabSeat> {
  final GeneratedDatabase _db;
  final String _alias;
  $WabSeatsTable(this._db, [this._alias]);
  final VerificationMeta _missionidMeta = const VerificationMeta('missionid');
  GeneratedTextColumn _missionid;
  @override
  GeneratedTextColumn get missionid => _missionid ??= _constructMissionid();
  GeneratedTextColumn _constructMissionid() {
    return GeneratedTextColumn('missionid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dimensionMeta = const VerificationMeta('dimension');
  GeneratedTextColumn _dimension;
  @override
  GeneratedTextColumn get dimension => _dimension ??= _constructDimension();
  GeneratedTextColumn _constructDimension() {
    return GeneratedTextColumn(
      'dimension',
      $tableName,
      false,
    );
  }

  final VerificationMeta _labelalignmentMeta =
      const VerificationMeta('labelalignment');
  GeneratedTextColumn _labelalignment;
  @override
  GeneratedTextColumn get labelalignment =>
      _labelalignment ??= _constructLabelalignment();
  GeneratedTextColumn _constructLabelalignment() {
    return GeneratedTextColumn(
      'labelAlignment',
      $tableName,
      false,
    );
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedRealColumn _weight;
  @override
  GeneratedRealColumn get weight => _weight ??= _constructWeight();
  GeneratedRealColumn _constructWeight() {
    return GeneratedRealColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _maxweightMeta = const VerificationMeta('maxweight');
  GeneratedRealColumn _maxweight;
  @override
  GeneratedRealColumn get maxweight => _maxweight ??= _constructMaxweight();
  GeneratedRealColumn _constructMaxweight() {
    return GeneratedRealColumn(
      'maxweight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _startarmMeta = const VerificationMeta('startarm');
  GeneratedRealColumn _startarm;
  @override
  GeneratedRealColumn get startarm => _startarm ??= _constructStartarm();
  GeneratedRealColumn _constructStartarm() {
    return GeneratedRealColumn(
      'startarm',
      $tableName,
      false,
    );
  }

  final VerificationMeta _endarmMeta = const VerificationMeta('endarm');
  GeneratedRealColumn _endarm;
  @override
  GeneratedRealColumn get endarm => _endarm ??= _constructEndarm();
  GeneratedRealColumn _constructEndarm() {
    return GeneratedRealColumn(
      'endarm',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yMeta = const VerificationMeta('y');
  GeneratedRealColumn _y;
  @override
  GeneratedRealColumn get y => _y ??= _constructY();
  GeneratedRealColumn _constructY() {
    return GeneratedRealColumn(
      'y',
      $tableName,
      false,
    );
  }

  final VerificationMeta _xMeta = const VerificationMeta('x');
  GeneratedRealColumn _x;
  @override
  GeneratedRealColumn get x => _x ??= _constructX();
  GeneratedRealColumn _constructX() {
    return GeneratedRealColumn(
      'x',
      $tableName,
      false,
    );
  }

  final VerificationMeta _multiLoadableMeta =
      const VerificationMeta('multiLoadable');
  GeneratedBoolColumn _multiLoadable;
  @override
  GeneratedBoolColumn get multiLoadable =>
      _multiLoadable ??= _constructMultiLoadable();
  GeneratedBoolColumn _constructMultiLoadable() {
    return GeneratedBoolColumn(
      'multiLoadable',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isEmptyMeta = const VerificationMeta('isEmpty');
  GeneratedBoolColumn _isEmpty;
  @override
  GeneratedBoolColumn get isEmpty => _isEmpty ??= _constructIsEmpty();
  GeneratedBoolColumn _constructIsEmpty() {
    return GeneratedBoolColumn(
      'isEmpty',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        missionid,
        type,
        id,
        location,
        dimension,
        labelalignment,
        weight,
        maxweight,
        startarm,
        endarm,
        y,
        x,
        multiLoadable,
        isEmpty
      ];
  @override
  $WabSeatsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'wab_seats';
  @override
  final String actualTableName = 'wab_seats';
  @override
  VerificationContext validateIntegrity(Insertable<WabSeat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('missionid')) {
      context.handle(_missionidMeta,
          missionid.isAcceptableOrUnknown(data['missionid'], _missionidMeta));
    } else if (isInserting) {
      context.missing(_missionidMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location'], _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('dimension')) {
      context.handle(_dimensionMeta,
          dimension.isAcceptableOrUnknown(data['dimension'], _dimensionMeta));
    } else if (isInserting) {
      context.missing(_dimensionMeta);
    }
    if (data.containsKey('labelAlignment')) {
      context.handle(
          _labelalignmentMeta,
          labelalignment.isAcceptableOrUnknown(
              data['labelAlignment'], _labelalignmentMeta));
    } else if (isInserting) {
      context.missing(_labelalignmentMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight'], _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('maxweight')) {
      context.handle(_maxweightMeta,
          maxweight.isAcceptableOrUnknown(data['maxweight'], _maxweightMeta));
    } else if (isInserting) {
      context.missing(_maxweightMeta);
    }
    if (data.containsKey('startarm')) {
      context.handle(_startarmMeta,
          startarm.isAcceptableOrUnknown(data['startarm'], _startarmMeta));
    } else if (isInserting) {
      context.missing(_startarmMeta);
    }
    if (data.containsKey('endarm')) {
      context.handle(_endarmMeta,
          endarm.isAcceptableOrUnknown(data['endarm'], _endarmMeta));
    } else if (isInserting) {
      context.missing(_endarmMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y'], _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x'], _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('multiLoadable')) {
      context.handle(
          _multiLoadableMeta,
          multiLoadable.isAcceptableOrUnknown(
              data['multiLoadable'], _multiLoadableMeta));
    } else if (isInserting) {
      context.missing(_multiLoadableMeta);
    }
    if (data.containsKey('isEmpty')) {
      context.handle(_isEmptyMeta,
          isEmpty.isAcceptableOrUnknown(data['isEmpty'], _isEmptyMeta));
    } else if (isInserting) {
      context.missing(_isEmptyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  WabSeat map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WabSeat.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WabSeatsTable createAlias(String alias) {
    return $WabSeatsTable(_db, alias);
  }
}

class WabCrew extends DataClass implements Insertable<WabCrew> {
  final String missionid;
  final String type;
  final String id;
  final String location;
  final String dimension;
  final String labelalignment;
  final double weight;
  final double maxweight;
  final double startarm;
  final double endarm;
  final double y;
  final double x;
  final bool multiLoadable;
  final bool isEmpty;
  WabCrew(
      {@required this.missionid,
      @required this.type,
      @required this.id,
      @required this.location,
      @required this.dimension,
      @required this.labelalignment,
      @required this.weight,
      @required this.maxweight,
      @required this.startarm,
      @required this.endarm,
      @required this.y,
      @required this.x,
      @required this.multiLoadable,
      @required this.isEmpty});
  factory WabCrew.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final boolType = db.typeSystem.forDartType<bool>();
    return WabCrew(
      missionid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}missionid']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      dimension: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}dimension']),
      labelalignment: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}labelAlignment']),
      weight:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      maxweight: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}maxweight']),
      startarm: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}startarm']),
      endarm:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}endarm']),
      y: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}y']),
      x: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}x']),
      multiLoadable: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}multiLoadable']),
      isEmpty:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}isEmpty']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || missionid != null) {
      map['missionid'] = Variable<String>(missionid);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || dimension != null) {
      map['dimension'] = Variable<String>(dimension);
    }
    if (!nullToAbsent || labelalignment != null) {
      map['labelAlignment'] = Variable<String>(labelalignment);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || maxweight != null) {
      map['maxweight'] = Variable<double>(maxweight);
    }
    if (!nullToAbsent || startarm != null) {
      map['startarm'] = Variable<double>(startarm);
    }
    if (!nullToAbsent || endarm != null) {
      map['endarm'] = Variable<double>(endarm);
    }
    if (!nullToAbsent || y != null) {
      map['y'] = Variable<double>(y);
    }
    if (!nullToAbsent || x != null) {
      map['x'] = Variable<double>(x);
    }
    if (!nullToAbsent || multiLoadable != null) {
      map['multiLoadable'] = Variable<bool>(multiLoadable);
    }
    if (!nullToAbsent || isEmpty != null) {
      map['isEmpty'] = Variable<bool>(isEmpty);
    }
    return map;
  }

  factory WabCrew.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WabCrew(
      missionid: serializer.fromJson<String>(json['missionid']),
      type: serializer.fromJson<String>(json['type']),
      id: serializer.fromJson<String>(json['id']),
      location: serializer.fromJson<String>(json['location']),
      dimension: serializer.fromJson<String>(json['dimension']),
      labelalignment: serializer.fromJson<String>(json['labelalignment']),
      weight: serializer.fromJson<double>(json['weight']),
      maxweight: serializer.fromJson<double>(json['maxweight']),
      startarm: serializer.fromJson<double>(json['startarm']),
      endarm: serializer.fromJson<double>(json['endarm']),
      y: serializer.fromJson<double>(json['y']),
      x: serializer.fromJson<double>(json['x']),
      multiLoadable: serializer.fromJson<bool>(json['multiLoadable']),
      isEmpty: serializer.fromJson<bool>(json['isEmpty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'missionid': serializer.toJson<String>(missionid),
      'type': serializer.toJson<String>(type),
      'id': serializer.toJson<String>(id),
      'location': serializer.toJson<String>(location),
      'dimension': serializer.toJson<String>(dimension),
      'labelalignment': serializer.toJson<String>(labelalignment),
      'weight': serializer.toJson<double>(weight),
      'maxweight': serializer.toJson<double>(maxweight),
      'startarm': serializer.toJson<double>(startarm),
      'endarm': serializer.toJson<double>(endarm),
      'y': serializer.toJson<double>(y),
      'x': serializer.toJson<double>(x),
      'multiLoadable': serializer.toJson<bool>(multiLoadable),
      'isEmpty': serializer.toJson<bool>(isEmpty),
    };
  }

  WabCrew copyWith(
          {String missionid,
          String type,
          String id,
          String location,
          String dimension,
          String labelalignment,
          double weight,
          double maxweight,
          double startarm,
          double endarm,
          double y,
          double x,
          bool multiLoadable,
          bool isEmpty}) =>
      WabCrew(
        missionid: missionid ?? this.missionid,
        type: type ?? this.type,
        id: id ?? this.id,
        location: location ?? this.location,
        dimension: dimension ?? this.dimension,
        labelalignment: labelalignment ?? this.labelalignment,
        weight: weight ?? this.weight,
        maxweight: maxweight ?? this.maxweight,
        startarm: startarm ?? this.startarm,
        endarm: endarm ?? this.endarm,
        y: y ?? this.y,
        x: x ?? this.x,
        multiLoadable: multiLoadable ?? this.multiLoadable,
        isEmpty: isEmpty ?? this.isEmpty,
      );
  @override
  String toString() {
    return (StringBuffer('WabCrew(')
          ..write('missionid: $missionid, ')
          ..write('type: $type, ')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('dimension: $dimension, ')
          ..write('labelalignment: $labelalignment, ')
          ..write('weight: $weight, ')
          ..write('maxweight: $maxweight, ')
          ..write('startarm: $startarm, ')
          ..write('endarm: $endarm, ')
          ..write('y: $y, ')
          ..write('x: $x, ')
          ..write('multiLoadable: $multiLoadable, ')
          ..write('isEmpty: $isEmpty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      missionid.hashCode,
      $mrjc(
          type.hashCode,
          $mrjc(
              id.hashCode,
              $mrjc(
                  location.hashCode,
                  $mrjc(
                      dimension.hashCode,
                      $mrjc(
                          labelalignment.hashCode,
                          $mrjc(
                              weight.hashCode,
                              $mrjc(
                                  maxweight.hashCode,
                                  $mrjc(
                                      startarm.hashCode,
                                      $mrjc(
                                          endarm.hashCode,
                                          $mrjc(
                                              y.hashCode,
                                              $mrjc(
                                                  x.hashCode,
                                                  $mrjc(
                                                      multiLoadable.hashCode,
                                                      isEmpty
                                                          .hashCode))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WabCrew &&
          other.missionid == this.missionid &&
          other.type == this.type &&
          other.id == this.id &&
          other.location == this.location &&
          other.dimension == this.dimension &&
          other.labelalignment == this.labelalignment &&
          other.weight == this.weight &&
          other.maxweight == this.maxweight &&
          other.startarm == this.startarm &&
          other.endarm == this.endarm &&
          other.y == this.y &&
          other.x == this.x &&
          other.multiLoadable == this.multiLoadable &&
          other.isEmpty == this.isEmpty);
}

class WabCrewsCompanion extends UpdateCompanion<WabCrew> {
  final Value<String> missionid;
  final Value<String> type;
  final Value<String> id;
  final Value<String> location;
  final Value<String> dimension;
  final Value<String> labelalignment;
  final Value<double> weight;
  final Value<double> maxweight;
  final Value<double> startarm;
  final Value<double> endarm;
  final Value<double> y;
  final Value<double> x;
  final Value<bool> multiLoadable;
  final Value<bool> isEmpty;
  const WabCrewsCompanion({
    this.missionid = const Value.absent(),
    this.type = const Value.absent(),
    this.id = const Value.absent(),
    this.location = const Value.absent(),
    this.dimension = const Value.absent(),
    this.labelalignment = const Value.absent(),
    this.weight = const Value.absent(),
    this.maxweight = const Value.absent(),
    this.startarm = const Value.absent(),
    this.endarm = const Value.absent(),
    this.y = const Value.absent(),
    this.x = const Value.absent(),
    this.multiLoadable = const Value.absent(),
    this.isEmpty = const Value.absent(),
  });
  WabCrewsCompanion.insert({
    @required String missionid,
    @required String type,
    @required String id,
    @required String location,
    @required String dimension,
    @required String labelalignment,
    @required double weight,
    @required double maxweight,
    @required double startarm,
    @required double endarm,
    @required double y,
    @required double x,
    @required bool multiLoadable,
    @required bool isEmpty,
  })  : missionid = Value(missionid),
        type = Value(type),
        id = Value(id),
        location = Value(location),
        dimension = Value(dimension),
        labelalignment = Value(labelalignment),
        weight = Value(weight),
        maxweight = Value(maxweight),
        startarm = Value(startarm),
        endarm = Value(endarm),
        y = Value(y),
        x = Value(x),
        multiLoadable = Value(multiLoadable),
        isEmpty = Value(isEmpty);
  static Insertable<WabCrew> custom({
    Expression<String> missionid,
    Expression<String> type,
    Expression<String> id,
    Expression<String> location,
    Expression<String> dimension,
    Expression<String> labelalignment,
    Expression<double> weight,
    Expression<double> maxweight,
    Expression<double> startarm,
    Expression<double> endarm,
    Expression<double> y,
    Expression<double> x,
    Expression<bool> multiLoadable,
    Expression<bool> isEmpty,
  }) {
    return RawValuesInsertable({
      if (missionid != null) 'missionid': missionid,
      if (type != null) 'type': type,
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (dimension != null) 'dimension': dimension,
      if (labelalignment != null) 'labelAlignment': labelalignment,
      if (weight != null) 'weight': weight,
      if (maxweight != null) 'maxweight': maxweight,
      if (startarm != null) 'startarm': startarm,
      if (endarm != null) 'endarm': endarm,
      if (y != null) 'y': y,
      if (x != null) 'x': x,
      if (multiLoadable != null) 'multiLoadable': multiLoadable,
      if (isEmpty != null) 'isEmpty': isEmpty,
    });
  }

  WabCrewsCompanion copyWith(
      {Value<String> missionid,
      Value<String> type,
      Value<String> id,
      Value<String> location,
      Value<String> dimension,
      Value<String> labelalignment,
      Value<double> weight,
      Value<double> maxweight,
      Value<double> startarm,
      Value<double> endarm,
      Value<double> y,
      Value<double> x,
      Value<bool> multiLoadable,
      Value<bool> isEmpty}) {
    return WabCrewsCompanion(
      missionid: missionid ?? this.missionid,
      type: type ?? this.type,
      id: id ?? this.id,
      location: location ?? this.location,
      dimension: dimension ?? this.dimension,
      labelalignment: labelalignment ?? this.labelalignment,
      weight: weight ?? this.weight,
      maxweight: maxweight ?? this.maxweight,
      startarm: startarm ?? this.startarm,
      endarm: endarm ?? this.endarm,
      y: y ?? this.y,
      x: x ?? this.x,
      multiLoadable: multiLoadable ?? this.multiLoadable,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (missionid.present) {
      map['missionid'] = Variable<String>(missionid.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (dimension.present) {
      map['dimension'] = Variable<String>(dimension.value);
    }
    if (labelalignment.present) {
      map['labelAlignment'] = Variable<String>(labelalignment.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (maxweight.present) {
      map['maxweight'] = Variable<double>(maxweight.value);
    }
    if (startarm.present) {
      map['startarm'] = Variable<double>(startarm.value);
    }
    if (endarm.present) {
      map['endarm'] = Variable<double>(endarm.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (multiLoadable.present) {
      map['multiLoadable'] = Variable<bool>(multiLoadable.value);
    }
    if (isEmpty.present) {
      map['isEmpty'] = Variable<bool>(isEmpty.value);
    }
    return map;
  }
}

class $WabCrewsTable extends WabCrews with TableInfo<$WabCrewsTable, WabCrew> {
  final GeneratedDatabase _db;
  final String _alias;
  $WabCrewsTable(this._db, [this._alias]);
  final VerificationMeta _missionidMeta = const VerificationMeta('missionid');
  GeneratedTextColumn _missionid;
  @override
  GeneratedTextColumn get missionid => _missionid ??= _constructMissionid();
  GeneratedTextColumn _constructMissionid() {
    return GeneratedTextColumn('missionid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dimensionMeta = const VerificationMeta('dimension');
  GeneratedTextColumn _dimension;
  @override
  GeneratedTextColumn get dimension => _dimension ??= _constructDimension();
  GeneratedTextColumn _constructDimension() {
    return GeneratedTextColumn(
      'dimension',
      $tableName,
      false,
    );
  }

  final VerificationMeta _labelalignmentMeta =
      const VerificationMeta('labelalignment');
  GeneratedTextColumn _labelalignment;
  @override
  GeneratedTextColumn get labelalignment =>
      _labelalignment ??= _constructLabelalignment();
  GeneratedTextColumn _constructLabelalignment() {
    return GeneratedTextColumn(
      'labelAlignment',
      $tableName,
      false,
    );
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedRealColumn _weight;
  @override
  GeneratedRealColumn get weight => _weight ??= _constructWeight();
  GeneratedRealColumn _constructWeight() {
    return GeneratedRealColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _maxweightMeta = const VerificationMeta('maxweight');
  GeneratedRealColumn _maxweight;
  @override
  GeneratedRealColumn get maxweight => _maxweight ??= _constructMaxweight();
  GeneratedRealColumn _constructMaxweight() {
    return GeneratedRealColumn(
      'maxweight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _startarmMeta = const VerificationMeta('startarm');
  GeneratedRealColumn _startarm;
  @override
  GeneratedRealColumn get startarm => _startarm ??= _constructStartarm();
  GeneratedRealColumn _constructStartarm() {
    return GeneratedRealColumn(
      'startarm',
      $tableName,
      false,
    );
  }

  final VerificationMeta _endarmMeta = const VerificationMeta('endarm');
  GeneratedRealColumn _endarm;
  @override
  GeneratedRealColumn get endarm => _endarm ??= _constructEndarm();
  GeneratedRealColumn _constructEndarm() {
    return GeneratedRealColumn(
      'endarm',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yMeta = const VerificationMeta('y');
  GeneratedRealColumn _y;
  @override
  GeneratedRealColumn get y => _y ??= _constructY();
  GeneratedRealColumn _constructY() {
    return GeneratedRealColumn(
      'y',
      $tableName,
      false,
    );
  }

  final VerificationMeta _xMeta = const VerificationMeta('x');
  GeneratedRealColumn _x;
  @override
  GeneratedRealColumn get x => _x ??= _constructX();
  GeneratedRealColumn _constructX() {
    return GeneratedRealColumn(
      'x',
      $tableName,
      false,
    );
  }

  final VerificationMeta _multiLoadableMeta =
      const VerificationMeta('multiLoadable');
  GeneratedBoolColumn _multiLoadable;
  @override
  GeneratedBoolColumn get multiLoadable =>
      _multiLoadable ??= _constructMultiLoadable();
  GeneratedBoolColumn _constructMultiLoadable() {
    return GeneratedBoolColumn(
      'multiLoadable',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isEmptyMeta = const VerificationMeta('isEmpty');
  GeneratedBoolColumn _isEmpty;
  @override
  GeneratedBoolColumn get isEmpty => _isEmpty ??= _constructIsEmpty();
  GeneratedBoolColumn _constructIsEmpty() {
    return GeneratedBoolColumn(
      'isEmpty',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        missionid,
        type,
        id,
        location,
        dimension,
        labelalignment,
        weight,
        maxweight,
        startarm,
        endarm,
        y,
        x,
        multiLoadable,
        isEmpty
      ];
  @override
  $WabCrewsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'wab_crews';
  @override
  final String actualTableName = 'wab_crews';
  @override
  VerificationContext validateIntegrity(Insertable<WabCrew> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('missionid')) {
      context.handle(_missionidMeta,
          missionid.isAcceptableOrUnknown(data['missionid'], _missionidMeta));
    } else if (isInserting) {
      context.missing(_missionidMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location'], _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('dimension')) {
      context.handle(_dimensionMeta,
          dimension.isAcceptableOrUnknown(data['dimension'], _dimensionMeta));
    } else if (isInserting) {
      context.missing(_dimensionMeta);
    }
    if (data.containsKey('labelAlignment')) {
      context.handle(
          _labelalignmentMeta,
          labelalignment.isAcceptableOrUnknown(
              data['labelAlignment'], _labelalignmentMeta));
    } else if (isInserting) {
      context.missing(_labelalignmentMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight'], _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('maxweight')) {
      context.handle(_maxweightMeta,
          maxweight.isAcceptableOrUnknown(data['maxweight'], _maxweightMeta));
    } else if (isInserting) {
      context.missing(_maxweightMeta);
    }
    if (data.containsKey('startarm')) {
      context.handle(_startarmMeta,
          startarm.isAcceptableOrUnknown(data['startarm'], _startarmMeta));
    } else if (isInserting) {
      context.missing(_startarmMeta);
    }
    if (data.containsKey('endarm')) {
      context.handle(_endarmMeta,
          endarm.isAcceptableOrUnknown(data['endarm'], _endarmMeta));
    } else if (isInserting) {
      context.missing(_endarmMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y'], _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x'], _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('multiLoadable')) {
      context.handle(
          _multiLoadableMeta,
          multiLoadable.isAcceptableOrUnknown(
              data['multiLoadable'], _multiLoadableMeta));
    } else if (isInserting) {
      context.missing(_multiLoadableMeta);
    }
    if (data.containsKey('isEmpty')) {
      context.handle(_isEmptyMeta,
          isEmpty.isAcceptableOrUnknown(data['isEmpty'], _isEmptyMeta));
    } else if (isInserting) {
      context.missing(_isEmptyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  WabCrew map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WabCrew.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WabCrewsTable createAlias(String alias) {
    return $WabCrewsTable(_db, alias);
  }
}

class WabCargo extends DataClass implements Insertable<WabCargo> {
  final String missionid;
  final String loadedItems;
  final String isFixed;
  final double totalWeight;
  final double loadableWidth;
  final double loadableLength;
  WabCargo(
      {@required this.missionid,
      @required this.loadedItems,
      @required this.isFixed,
      @required this.totalWeight,
      @required this.loadableWidth,
      @required this.loadableLength});
  factory WabCargo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return WabCargo(
      missionid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}missionid']),
      loadedItems: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}loadedItems']),
      isFixed: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      totalWeight: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}totalWeight']),
      loadableWidth: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}loadableWidth']),
      loadableLength: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}loadableLength']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || missionid != null) {
      map['missionid'] = Variable<String>(missionid);
    }
    if (!nullToAbsent || loadedItems != null) {
      map['loadedItems'] = Variable<String>(loadedItems);
    }
    if (!nullToAbsent || isFixed != null) {
      map['id'] = Variable<String>(isFixed);
    }
    if (!nullToAbsent || totalWeight != null) {
      map['totalWeight'] = Variable<double>(totalWeight);
    }
    if (!nullToAbsent || loadableWidth != null) {
      map['loadableWidth'] = Variable<double>(loadableWidth);
    }
    if (!nullToAbsent || loadableLength != null) {
      map['loadableLength'] = Variable<double>(loadableLength);
    }
    return map;
  }

  factory WabCargo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WabCargo(
      missionid: serializer.fromJson<String>(json['missionid']),
      loadedItems: serializer.fromJson<String>(json['loadedItems']),
      isFixed: serializer.fromJson<String>(json['isFixed']),
      totalWeight: serializer.fromJson<double>(json['totalWeight']),
      loadableWidth: serializer.fromJson<double>(json['loadableWidth']),
      loadableLength: serializer.fromJson<double>(json['loadableLength']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'missionid': serializer.toJson<String>(missionid),
      'loadedItems': serializer.toJson<String>(loadedItems),
      'isFixed': serializer.toJson<String>(isFixed),
      'totalWeight': serializer.toJson<double>(totalWeight),
      'loadableWidth': serializer.toJson<double>(loadableWidth),
      'loadableLength': serializer.toJson<double>(loadableLength),
    };
  }

  WabCargo copyWith(
          {String missionid,
          String loadedItems,
          String isFixed,
          double totalWeight,
          double loadableWidth,
          double loadableLength}) =>
      WabCargo(
        missionid: missionid ?? this.missionid,
        loadedItems: loadedItems ?? this.loadedItems,
        isFixed: isFixed ?? this.isFixed,
        totalWeight: totalWeight ?? this.totalWeight,
        loadableWidth: loadableWidth ?? this.loadableWidth,
        loadableLength: loadableLength ?? this.loadableLength,
      );
  @override
  String toString() {
    return (StringBuffer('WabCargo(')
          ..write('missionid: $missionid, ')
          ..write('loadedItems: $loadedItems, ')
          ..write('isFixed: $isFixed, ')
          ..write('totalWeight: $totalWeight, ')
          ..write('loadableWidth: $loadableWidth, ')
          ..write('loadableLength: $loadableLength')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      missionid.hashCode,
      $mrjc(
          loadedItems.hashCode,
          $mrjc(
              isFixed.hashCode,
              $mrjc(totalWeight.hashCode,
                  $mrjc(loadableWidth.hashCode, loadableLength.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WabCargo &&
          other.missionid == this.missionid &&
          other.loadedItems == this.loadedItems &&
          other.isFixed == this.isFixed &&
          other.totalWeight == this.totalWeight &&
          other.loadableWidth == this.loadableWidth &&
          other.loadableLength == this.loadableLength);
}

class WabCargosCompanion extends UpdateCompanion<WabCargo> {
  final Value<String> missionid;
  final Value<String> loadedItems;
  final Value<String> isFixed;
  final Value<double> totalWeight;
  final Value<double> loadableWidth;
  final Value<double> loadableLength;
  const WabCargosCompanion({
    this.missionid = const Value.absent(),
    this.loadedItems = const Value.absent(),
    this.isFixed = const Value.absent(),
    this.totalWeight = const Value.absent(),
    this.loadableWidth = const Value.absent(),
    this.loadableLength = const Value.absent(),
  });
  WabCargosCompanion.insert({
    @required String missionid,
    @required String loadedItems,
    @required String isFixed,
    @required double totalWeight,
    @required double loadableWidth,
    @required double loadableLength,
  })  : missionid = Value(missionid),
        loadedItems = Value(loadedItems),
        isFixed = Value(isFixed),
        totalWeight = Value(totalWeight),
        loadableWidth = Value(loadableWidth),
        loadableLength = Value(loadableLength);
  static Insertable<WabCargo> custom({
    Expression<String> missionid,
    Expression<String> loadedItems,
    Expression<String> isFixed,
    Expression<double> totalWeight,
    Expression<double> loadableWidth,
    Expression<double> loadableLength,
  }) {
    return RawValuesInsertable({
      if (missionid != null) 'missionid': missionid,
      if (loadedItems != null) 'loadedItems': loadedItems,
      if (isFixed != null) 'id': isFixed,
      if (totalWeight != null) 'totalWeight': totalWeight,
      if (loadableWidth != null) 'loadableWidth': loadableWidth,
      if (loadableLength != null) 'loadableLength': loadableLength,
    });
  }

  WabCargosCompanion copyWith(
      {Value<String> missionid,
      Value<String> loadedItems,
      Value<String> isFixed,
      Value<double> totalWeight,
      Value<double> loadableWidth,
      Value<double> loadableLength}) {
    return WabCargosCompanion(
      missionid: missionid ?? this.missionid,
      loadedItems: loadedItems ?? this.loadedItems,
      isFixed: isFixed ?? this.isFixed,
      totalWeight: totalWeight ?? this.totalWeight,
      loadableWidth: loadableWidth ?? this.loadableWidth,
      loadableLength: loadableLength ?? this.loadableLength,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (missionid.present) {
      map['missionid'] = Variable<String>(missionid.value);
    }
    if (loadedItems.present) {
      map['loadedItems'] = Variable<String>(loadedItems.value);
    }
    if (isFixed.present) {
      map['id'] = Variable<String>(isFixed.value);
    }
    if (totalWeight.present) {
      map['totalWeight'] = Variable<double>(totalWeight.value);
    }
    if (loadableWidth.present) {
      map['loadableWidth'] = Variable<double>(loadableWidth.value);
    }
    if (loadableLength.present) {
      map['loadableLength'] = Variable<double>(loadableLength.value);
    }
    return map;
  }
}

class $WabCargosTable extends WabCargos
    with TableInfo<$WabCargosTable, WabCargo> {
  final GeneratedDatabase _db;
  final String _alias;
  $WabCargosTable(this._db, [this._alias]);
  final VerificationMeta _missionidMeta = const VerificationMeta('missionid');
  GeneratedTextColumn _missionid;
  @override
  GeneratedTextColumn get missionid => _missionid ??= _constructMissionid();
  GeneratedTextColumn _constructMissionid() {
    return GeneratedTextColumn('missionid', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _loadedItemsMeta =
      const VerificationMeta('loadedItems');
  GeneratedTextColumn _loadedItems;
  @override
  GeneratedTextColumn get loadedItems =>
      _loadedItems ??= _constructLoadedItems();
  GeneratedTextColumn _constructLoadedItems() {
    return GeneratedTextColumn(
      'loadedItems',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isFixedMeta = const VerificationMeta('isFixed');
  GeneratedTextColumn _isFixed;
  @override
  GeneratedTextColumn get isFixed => _isFixed ??= _constructIsFixed();
  GeneratedTextColumn _constructIsFixed() {
    return GeneratedTextColumn('id', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _totalWeightMeta =
      const VerificationMeta('totalWeight');
  GeneratedRealColumn _totalWeight;
  @override
  GeneratedRealColumn get totalWeight =>
      _totalWeight ??= _constructTotalWeight();
  GeneratedRealColumn _constructTotalWeight() {
    return GeneratedRealColumn(
      'totalWeight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _loadableWidthMeta =
      const VerificationMeta('loadableWidth');
  GeneratedRealColumn _loadableWidth;
  @override
  GeneratedRealColumn get loadableWidth =>
      _loadableWidth ??= _constructLoadableWidth();
  GeneratedRealColumn _constructLoadableWidth() {
    return GeneratedRealColumn(
      'loadableWidth',
      $tableName,
      false,
    );
  }

  final VerificationMeta _loadableLengthMeta =
      const VerificationMeta('loadableLength');
  GeneratedRealColumn _loadableLength;
  @override
  GeneratedRealColumn get loadableLength =>
      _loadableLength ??= _constructLoadableLength();
  GeneratedRealColumn _constructLoadableLength() {
    return GeneratedRealColumn(
      'loadableLength',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        missionid,
        loadedItems,
        isFixed,
        totalWeight,
        loadableWidth,
        loadableLength
      ];
  @override
  $WabCargosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'wab_cargos';
  @override
  final String actualTableName = 'wab_cargos';
  @override
  VerificationContext validateIntegrity(Insertable<WabCargo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('missionid')) {
      context.handle(_missionidMeta,
          missionid.isAcceptableOrUnknown(data['missionid'], _missionidMeta));
    } else if (isInserting) {
      context.missing(_missionidMeta);
    }
    if (data.containsKey('loadedItems')) {
      context.handle(
          _loadedItemsMeta,
          loadedItems.isAcceptableOrUnknown(
              data['loadedItems'], _loadedItemsMeta));
    } else if (isInserting) {
      context.missing(_loadedItemsMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_isFixedMeta,
          isFixed.isAcceptableOrUnknown(data['id'], _isFixedMeta));
    } else if (isInserting) {
      context.missing(_isFixedMeta);
    }
    if (data.containsKey('totalWeight')) {
      context.handle(
          _totalWeightMeta,
          totalWeight.isAcceptableOrUnknown(
              data['totalWeight'], _totalWeightMeta));
    } else if (isInserting) {
      context.missing(_totalWeightMeta);
    }
    if (data.containsKey('loadableWidth')) {
      context.handle(
          _loadableWidthMeta,
          loadableWidth.isAcceptableOrUnknown(
              data['loadableWidth'], _loadableWidthMeta));
    } else if (isInserting) {
      context.missing(_loadableWidthMeta);
    }
    if (data.containsKey('loadableLength')) {
      context.handle(
          _loadableLengthMeta,
          loadableLength.isAcceptableOrUnknown(
              data['loadableLength'], _loadableLengthMeta));
    } else if (isInserting) {
      context.missing(_loadableLengthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  WabCargo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WabCargo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WabCargosTable createAlias(String alias) {
    return $WabCargosTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $WabMissionPlanTable _wabMissionPlan;
  $WabMissionPlanTable get wabMissionPlan =>
      _wabMissionPlan ??= $WabMissionPlanTable(this);
  $WabSeatsTable _wabSeats;
  $WabSeatsTable get wabSeats => _wabSeats ??= $WabSeatsTable(this);
  $WabCrewsTable _wabCrews;
  $WabCrewsTable get wabCrews => _wabCrews ??= $WabCrewsTable(this);
  $WabCargosTable _wabCargos;
  $WabCargosTable get wabCargos => _wabCargos ??= $WabCargosTable(this);
  WabSeatDAO _wabSeatDAO;
  WabSeatDAO get wabSeatDAO => _wabSeatDAO ??= WabSeatDAO(this as MyDatabase);
  WabCrewDAO _wabCrewDAO;
  WabCrewDAO get wabCrewDAO => _wabCrewDAO ??= WabCrewDAO(this as MyDatabase);
  WabMissionDAO _wabMissionDAO;
  WabMissionDAO get wabMissionDAO =>
      _wabMissionDAO ??= WabMissionDAO(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [wabMissionPlan, wabSeats, wabCrews, wabCargos];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$WabSeatDAOMixin on DatabaseAccessor<MyDatabase> {
  $WabSeatsTable get wabSeats => attachedDatabase.wabSeats;
}
mixin _$WabCrewDAOMixin on DatabaseAccessor<MyDatabase> {
  $WabCrewsTable get wabCrews => attachedDatabase.wabCrews;
}
mixin _$WabCargoDAOMixin on DatabaseAccessor<MyDatabase> {
  $WabCargosTable get wabCargos => attachedDatabase.wabCargos;
}
mixin _$WabMissionDAOMixin on DatabaseAccessor<MyDatabase> {
  $WabMissionPlanTable get wabMissionPlan => attachedDatabase.wabMissionPlan;
  $WabCrewsTable get wabCrews => attachedDatabase.wabCrews;
  $WabSeatsTable get wabSeats => attachedDatabase.wabSeats;
}
