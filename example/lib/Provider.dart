import 'package:flutter/cupertino.dart';

import 'data.dart';

class DataProvider extends ChangeNotifier{
  static List<Doodle> _doodles = new List<Doodle>();

  void addDoodle(Doodle doodle){
    doodles.add(doodle);
    notifyListeners();
  }

  void deleteDoodle(Doodle doodle){
    doodles.remove(doodle);
    notifyListeners();
  }
}