import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';

class RouteProvider extends ChangeNotifier {

  static List<Marker> _markerList = new List<Marker>();
  bool _isNewMission = false;
  bool _editMission = false;
  bool _distMeasuremnet = false;
  RouteProvider(this._isNewMission);


  List<Marker> get markerList => _markerList;

  void set markerList(List<Marker> value) {
    _markerList = value;
  }

  setMission(bool isNewMission) {
    this._isNewMission = isNewMission;
    notifyListeners();
  }

  getMission() {
    return _isNewMission;
  }

  setEditMission(bool editMission) {
    this._editMission = editMission;
    notifyListeners();
  }

  getEditMission() {
    return _editMission;
  }

  getdistMeasuremnet() => _distMeasuremnet;

   void setdistMeasuremnet(bool value) {
    _distMeasuremnet = value;
    notifyListeners();
  }


}