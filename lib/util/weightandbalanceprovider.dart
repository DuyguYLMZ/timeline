import 'package:flutter/cupertino.dart';
import 'package:tablet_app/util/wabconfigurationmodel.dart';
import 'package:tablet_app/util/wabitems/WABItem.dart';
import 'package:tablet_app/util/wabitems/WABItemLoadable.dart';
import 'package:tablet_app/util/wabitems/WABItemSeat.dart';

class WABProvider extends ChangeNotifier {
  static WABConfigurationModel _model = new WABConfigurationModel();

  WABConfigurationModel getAll() {
    return _model;
  }

  void updateSeat(WABItemSeat seat, WABItemLoadable item) {
    List<WABItemSeat> seatModel = _model.seats;
    int index = 0;
    for (var s in seatModel) {
      if (s.id == seat.id) {
        s.loadedItems[0] = item;
        _model.seats[index] = s;
      }
      index++;
    }
    notifyListeners();
  }

  void addFixedCargo(WABItem item) {
    _model.fixedCargo.add(item);
    notifyListeners();
  }

  void addFreeCargo(WABItem item) {
    _model.freeCargo.add(item);
    notifyListeners();
  }

  List getCrews() {
    return _model.crewsList;
  }

  List getSeats() {
    return _model.seats;
  }

  List getFixedCargo() {
    return _model.fixedCargo;
  }

  List getFreeCargo() {
    return _model.freeCargo;
  }

  List getFuel() {
    return _model.fuelTanks;
  }

  List getCargo() {
    return _model.cargos;
  }

  void setModel(WABConfigurationModel model) {
    _model = model;
  }

  void deleteCargoItem(WABItem item) {
    _model.cargos.remove(item);
    notifyListeners();
  }

  void deleteFixedItem(WABItem item) {
    _model.fixedCargo.remove(item);
    notifyListeners();
  }

  void deleteFreeCargoItem(WABItem item) {
    _model.freeCargo.remove(item);
    notifyListeners();
  }

  void setCrewWeight(int i, double value) {
    _model.crewsList.elementAt(i).weight = value;
    notifyListeners();
  }

  void setSeatWeight(int i, double value) {
    _model.seats.elementAt(i).weight = value;
    notifyListeners();
  }
  void loadCrew(int i, bool value) {
    _model.crewsList.elementAt(i).multiLoadable = value;
    notifyListeners();
  }


}
