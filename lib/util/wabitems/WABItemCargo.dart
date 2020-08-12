import 'WABItem.dart';
import 'WABItemLoadable.dart';
import 'IAssignableItem.dart';

class WABItemCargo extends WABItem implements IAssignableItem {
  List _loadedItems = new List<WABItemLoadable>(1);
  String _isFixed;
  double _totalWeight = 0;
  double _loadableWidth;
  double _loadableLength;

  WABItemCargo() {
    if (multiLoadable) {
      _loadedItems = new List<WABItemLoadable>();
    }
  }

  String get isFixed => _isFixed;

  set isFixed(String value) {
    _isFixed = value;
  }

  double get totalWeight => _totalWeight;

  set totalWeight(double value) {
    _totalWeight = value;
  }


  @override
  set multiLoadable(bool value) {
    this.multiLoadable = value;
    _loadedItems = _loadedItems.toList(growable: true);
    _loadedItems.clear();
  }

  List get loadedItems => _loadedItems;

  set loadedItems(List value) {
    _loadedItems = value;
  }

  double get loadableWidth => _loadableWidth;

  set loadableWidth(double value) {
    _loadableWidth = value;
  }

  @override
  set weight(double value) {
    this.weight = value;
    _totalWeight = weight;
  }

  getTotalWeightOfLoadedItems() =>
      _loadedItems
          .map((element) => element.weight)
          .reduce((value, element) => value + element);

  get loadableVolume => _loadableWidth * _loadableLength;

  double get loadableLength => _loadableLength;

  set loadableLength(double value) {
    _loadableLength = value;
  }

  get airdroppedItemsWeight {
    return loadedItems
        .map((item) => item.weight)
        .reduce((sum, droppedItem) => sum + droppedItem)
        .where((item) => item.isAirdropped == 'true');
  }

  @override
  loadItem(WABItemLoadable assignItem) {
    if (multiLoadable) {
      loadedItems.add(IAssignableItem);
    } else {
      loadedItems.first = assignItem;
    }
    _totalWeight += assignItem.weight;
  }

  get availableWeight => maxWeight - weight;

  @override
  List<WABItemLoadable> get validItems {
    return super.validItems;
  }


}


