import 'package:flutter/cupertino.dart';
import 'package:tablet_app/widgets/homefloatingactionbutton.dart';

class WABProvider extends ChangeNotifier {
  HomeFloatingActionButtonState floatingActionButton =HomeFloatingActionButtonState() ;
  WABProvider(this.floatingActionButton);
  getFloatingBtn() {return floatingActionButton;}
}
