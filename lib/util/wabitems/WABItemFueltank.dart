
import 'WABItem.dart';

class WABItemFueltank extends WABItem{
  double _maxCapacity;
  double _fuelDensity;

  double _taxiFuel = 0;
  double _tripFuel = 0;
  double _payload = 0;
  double _instantFuel = 0;

  WABItemFueltank();

  double get fuelDensity => _fuelDensity;

  set fuelDensity(double value) {
    _fuelDensity = value;
  }

  double get maxCapacity => _maxCapacity;

  set maxCapacity(double value) {
    _maxCapacity = value;
  }

  double get tripFuel => _tripFuel;

  set tripFuel(double value) {
    _tripFuel = value;
  }

  double get taxiFuel => _taxiFuel;

  set taxiFuel(double value) {
    _taxiFuel = value;
  }


  double get payload => _payload;

  set payload(double value) {
    _payload = value;
  }

  double get instantFuel => _instantFuel;

  set instantFuel(double value) {
    _instantFuel = value;
  }

  @override
  double get weight => getAnyWeight(_instantFuel);

  double get taxiFuelWeight => getAnyWeight(_taxiFuel);

  double get tripFuelWeight => getAnyWeight(_tripFuel);

  double getAnyWeight(double volume) => volume * _fuelDensity;




}