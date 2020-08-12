import 'package:tablet_app/data/wab_database.dart';
import 'package:tablet_app/util/wabitems/WABItem.dart';
import 'package:tablet_app/util/wabitems/WABItemCargo.dart';
import 'package:tablet_app/util/wabitems/WABItemCargoDefinition.dart';
import 'package:tablet_app/util/wabitems/WABItemLoadable.dart';
import 'package:tablet_app/util/wabitems/WABItemSeat.dart';

import 'aircraftinfo.dart';

class WABConfigurationModel {
  int _staticTypeId;
  AircraftInfo _acInfo = new AircraftInfo();
  List _crews = new List<WABItem>();
  List _seats = new List<WABItemSeat>();
  List _cargos = new List<WABItemCargo>(); //WABItemCargo implement edilecek
  List _fixedCargo = new List<WABItem>();
  List _itemsForSeats = new List<WABItemLoadable>();
  List _itemsForCargo = new List<WABItemLoadable>();
  List _itemsForFixedCargo = new List<WABItemLoadable>();
  List _freeCargo = new List<WABItem>();
  List _fuelTanks = new List<WABItem>();
  List _viewOnly = new List<WABItem>();
  WABItemCargoDefinition cargoDefinition = new WABItemCargoDefinition();
  List _cargoConstraints = new List<double>();
  List _stationList = new List<WABItem>();
  List<List<String>> _drawItems = new List<List<String>>();

  WABConfigurationModel({WabSeat seats, crews});

  List get cargoConstraints => _cargoConstraints;

  set cargoConstraints(List value) {
    _cargoConstraints = value;
  }

  List get viewOnly => _viewOnly;

  set viewOnly(List value) {
    _viewOnly = value;
  }

  List get cargos => _cargos;

  set cargos(List value) {
    _cargos = value;
  }

  List get fuelTanks => _fuelTanks;

  set fuelTanks(List value) {
    _fuelTanks = value;
  }

  List get freeCargo => _freeCargo;

  set freeCargo(List value) {
    _freeCargo = value;
  }

  List get itemsForSeats => _itemsForSeats;

  set itemsForSeats(List value) {
    _itemsForSeats = value;
  }

  List get itemsForCargo => _itemsForCargo;

  set itemsForCargo(List value) {
    _itemsForCargo = value;
  }

  List get seats => _seats;

  set seats(List value) {
    _seats = value;
  }

  List get crewsList => _crews;

  set crewsList(List value) {
    _crews = value;
  }

  AircraftInfo get acInfo => _acInfo;

  set acInfo(AircraftInfo value) {
    _acInfo = value;
  }

  int get staticTypeId => _staticTypeId;

  set staticTypeId(int value) {
    _staticTypeId = value;
  }

  List<List<String>> get drawItems => _drawItems;

  set drawItems(List<List<String>> value) {
    _drawItems = value;
  }

  List get stationList => _stationList;

  set stationList(List value) {
    _stationList = value;
  }

  get cargoPayload => cargos
      .map((element) => element.totalWeight)
      .reduce((sum, element) => sum + element);

  get freeCargoPayload => freeCargo
      .map((element) => element.weight)
      .reduce((sum, element) => sum + element);

  get crewPayload => crewsList
      .map((element) => element.weight)
      .reduce((sum, element) => sum + element);

  get passengersPayload => seats
      .map((element) => element.loadedItem.weight)
      .reduce((sum, element) => sum + element);

  get fuelPayload => fuelTanks
      .map((element) => element.weight)
      .reduce((sum, element) => sum + element);

  get airdroppedItemPayload => cargos
      .map((element) => element.airdroppedItemsWeight)
      .reduce((sum, element) => sum + element);

  List get itemsForFixedCargo => _itemsForFixedCargo;

  set itemsForFixedCargo(List value) {
    _itemsForFixedCargo = value;
  }

  List get fixedCargo => _fixedCargo;

  set fixedCargo(List value) {
    _fixedCargo = value;
  }

  get copy {
    WABConfigurationModel copyModel = new WABConfigurationModel();
    copyModel.staticTypeId = this._staticTypeId;
    copyModel.acInfo = this._acInfo;
    copyModel.crewsList = this._crews;
    copyModel.seats = this._seats;
    copyModel.cargos = this._cargos;
    copyModel.fixedCargo = this._fixedCargo;
    copyModel.itemsForSeats = this._itemsForSeats;
    copyModel.itemsForCargo = this._itemsForCargo;
    copyModel.itemsForFixedCargo = this._itemsForFixedCargo;
    copyModel.freeCargo = this._freeCargo;
    copyModel.fuelTanks = this._fuelTanks;
    copyModel.viewOnly = this._viewOnly;
    copyModel.cargoDefinition = this.cargoDefinition;
    copyModel.cargoConstraints = this._cargoConstraints;
    copyModel.stationList = this._stationList;
    copyModel.drawItems = this._drawItems;
  }
}
