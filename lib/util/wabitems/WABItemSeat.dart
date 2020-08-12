import 'IAssignableItem.dart';
import 'WABItem.dart';
import 'WABItemLoadable.dart';

class WABItemSeat extends WABItem implements IAssignableItem {
  int _rowNumber;
  List<WABItemLoadable> _loadedItems = new List<WABItemLoadable>(1);

  WABItemSeat();

  int get rowNumber => _rowNumber;

  set rowNumber(int value) {
    _rowNumber = value;
  }

  @override
  get loadedItems => this._loadedItems;

  @override
  loadItem(WABItemLoadable assignItem) {
    loadedItems.first = assignItem;
    this.weight = assignItem.weight;
  }
}
