
import 'package:tablet_app/widgets/menu/menuitems/appbarmenubuttonitems.dart';
import 'package:tablet_app/widgets/menu/menuitems/context_menu_items.dart';
import 'package:tablet_app/widgets/menu/menuitems/menu_button_items.dart';

List<MenuButtonItem> getHomeMenuItems(){
  List<MenuButtonItem> menuItemList = [];
  menuItemList.add(new ContextMenuItem(AppbarMenuButtonItemsEnum.TASK_MANAGEMENT.id, AppbarMenuButtonItemsEnum.TASK_MANAGEMENT.name.toString()));
  menuItemList.add(new ContextMenuItem(AppbarMenuButtonItemsEnum.NEW_TASK.id, AppbarMenuButtonItemsEnum.NEW_TASK.name.toString()));
  menuItemList.add(new ContextMenuItem(AppbarMenuButtonItemsEnum.SAVE_TASK.id, AppbarMenuButtonItemsEnum.SAVE_TASK.name.toString()));
  menuItemList.add(new ContextMenuItem(AppbarMenuButtonItemsEnum.OPEN_TASK.id, AppbarMenuButtonItemsEnum.OPEN_TASK.name.toString()));
  menuItemList.add(new ContextMenuItem(AppbarMenuButtonItemsEnum.SHARE_TASK.id, AppbarMenuButtonItemsEnum.SHARE_TASK.name.toString()));

  return menuItemList;
}