
import 'package:tablet_app/widgets/menu/menuitems/menu_button_items.dart';
import 'package:tablet_app/widgets/menu/menuitems/navdb_menu_items.dart';

List<MenuButtonItem> getMenuItems(){
  List<MenuButtonItem> menuItemList = [];
  menuItemList.add(new NavDBMenuItem(0, "Advanced Search"));
  menuItemList.add(new NavDBMenuItem(1, "Example 1"));
  menuItemList.add(new NavDBMenuItem(2, "Example 2"));
  return menuItemList;
}
