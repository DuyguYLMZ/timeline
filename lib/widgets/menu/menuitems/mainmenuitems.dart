import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MainMenuItems {
  CONFIGURATION,
  ROUTE_EDITOR,
  WEIGHT_AND_BALANCE,
  MAP_MANAGEMENT,
  NAVDB,
  OPTIONS,
  SYNCHRONIZATION,
  DIBIRIF,
  PGP
}

class MainMenu {
  MainMenuItems item;

  MainMenu(this.item);
}

extension MenuButtonItemsExtension on MainMenuItems {
  int get id {
    switch (this) {
      case MainMenuItems.CONFIGURATION:
        return 0;
      case MainMenuItems.ROUTE_EDITOR:
        return 1;
      case MainMenuItems.WEIGHT_AND_BALANCE:
        return 2;
      case MainMenuItems.MAP_MANAGEMENT:
        return 3;
      case MainMenuItems.NAVDB:
        return 4;
      case MainMenuItems.OPTIONS:
        return 5;
      case MainMenuItems.DIBIRIF:
        return 6;
      case MainMenuItems.PGP:
        return 7;
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case MainMenuItems.CONFIGURATION:
        return "Görev Konfigürasyonu";
      case MainMenuItems.ROUTE_EDITOR:
        return "Rota Editörü";
      case MainMenuItems.WEIGHT_AND_BALANCE:
        return "Ağırlık ve Denge";
      case MainMenuItems.MAP_MANAGEMENT:
        return "Harita Yönetimi";
      case MainMenuItems.NAVDB:
        return "NavDB";
      case MainMenuItems.OPTIONS:
        return "Opsiyonlar";
      case MainMenuItems.SYNCHRONIZATION:
        return "Senkronizasyon";
      case MainMenuItems.DIBIRIF:
        return "Dibirif";
      case MainMenuItems.PGP:
        return "Planlanan Görevin Provası";
      default:
        return null;
    }
  }

  Icon get icon {
    switch (this) {
      case MainMenuItems.CONFIGURATION:
        return Icon(Icons.settings_input_component);
      case MainMenuItems.ROUTE_EDITOR:
        return Icon(Icons.settings_input_component);
      case MainMenuItems.WEIGHT_AND_BALANCE:
        return Icon(Icons.thumbs_up_down);
      case MainMenuItems.MAP_MANAGEMENT:
        return Icon(Icons.map);
      case MainMenuItems.NAVDB:
        return Icon(Icons.apps);
      case MainMenuItems.OPTIONS:
        return Icon(Icons.edit_attributes);
      case MainMenuItems.SYNCHRONIZATION:
        return Icon(Icons.sync);
      case MainMenuItems.DIBIRIF:
        return Icon(Icons.bubble_chart);
      case MainMenuItems.PGP:
        return Icon(Icons.ondemand_video);
      default:
        return null;
    }
  }
}
