
import 'WABItemLoadable.dart';

abstract class IAssignableItem {
  get loadedItems => loadedItems;

  loadItem(WABItemLoadable assignItem);
}
