import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/values/strings.dart';
import 'package:tablet_app/values/theme.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;
  String _themeName = Strings.LIGHT_THEME;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

  getThemeName() => _themeName;

  changeThemeName() async {
    if (getTheme() == darkTheme) {
      _themeName = Strings.LIGHT_THEME;
    } else {
      _themeName = Strings.DARK_THEME;
    }

    notifyListeners();
  }
}
