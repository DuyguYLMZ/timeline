
import 'package:tablet_app/widgets/menu/menuitems/mainmenuitems.dart';
import 'package:tablet_app/widgets/menu/menuitems/menu_button_items.dart';
import 'package:tablet_app/widgets/menu/menuitems/context_menu_items.dart';

List<MenuButtonItem> getMenuItems() {
  List<MenuButtonItem> menuItemList = [];
  menuItemList.add(new ContextMenuItem(0, "Advanced Search"));
  menuItemList.add(new ContextMenuItem(1, "Regional Search"));
  return menuItemList;
}



