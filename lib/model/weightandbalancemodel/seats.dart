import 'package:tablet_app/model/weightandbalancemodel/seat.dart';

class Seats{
  static List<Seat> _seatList = new List<Seat>();

   List<Seat> get seatList => _seatList;

   set seatList(List<Seat> value) {
    _seatList = value;
  }

  void addSeat(Seat seat) {
    _seatList.add(seat);
  }


}