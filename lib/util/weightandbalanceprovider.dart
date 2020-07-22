import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:tablet_app/model/weightandbalancemodel/crew.dart';
import 'package:tablet_app/model/weightandbalancemodel/seat.dart';
import 'package:tablet_app/model/weightandbalancemodel/seats.dart';

class WABProvider extends ChangeNotifier {

  static Seats _seatList = new Seats();
  static List<Crew> _crewList = new List<Crew>();
  static List<int> _selectedSeatIndexList = new List();
  static List<bool> _selectedCrewIndexList = new List();

  changeSeatWeight(int index, double weight) {
    _seatList.seatList[index].setWeight(weight);
    notifyListeners();
  }

  addSeat(Seat seat) {
    _seatList.addSeat(seat);
    notifyListeners();
  }

  getSeatList() {
    return _seatList.seatList;
  }

  changeCrewWeight(int index, double weight) {
    _crewList[index].setWeight(weight);
    notifyListeners();
  }

  addCrew(Crew crew) {
    _crewList.add(crew);
    notifyListeners();
  }

  getCrewList() {
    return _crewList;
  }

  addSelectedSeatIndexList(int index) {
    _selectedSeatIndexList.add(index);
    notifyListeners();
  }

  List<int> getSelectedSeatIndexList() {
    return _selectedSeatIndexList;
  }

  addSelectedCrewIndexList(bool isSelected) {
    _selectedCrewIndexList.add(isSelected);
    notifyListeners();
  }

  changeSelectedCrewIndexList(int index, bool isSelected) {
    _selectedCrewIndexList[index] = isSelected;
    notifyListeners();
  }

  List<bool> getSelectedCrewIndexList() {
    return _selectedCrewIndexList;
  }
}
