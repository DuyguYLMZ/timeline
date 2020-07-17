
import 'package:tablet_app/widgets/menu/menuitems/menu_button_items.dart';

class NavDBMenuItem extends MenuButtonItem{


  NavDBMenuItem(int id, String name){
    super.itemId = id;
    super.itemName = name;
  }

  @override
  int get id => itemId;

  @override
  String get name => itemName;

}