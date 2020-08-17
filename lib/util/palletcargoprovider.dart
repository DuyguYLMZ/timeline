import 'package:flutter/cupertino.dart';
import 'package:tablet_app/model/weightandbalancemodel/palletcargo_model.dart';


class PalletCargoProvider extends ChangeNotifier{

  void addDoodle(Doodle doodle){
    doodles.add(doodle);
    notifyListeners();
  }

  void deleteDoodle(Doodle doodle){
    doodles.remove(doodle);
    notifyListeners();
  }
}