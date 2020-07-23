import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum WeightAndBalanceMenuItems {
  BASIC_CONFIGURATION,
  WEIGHT_CALCULATION,
  CREW_MEMBER,
  SEATS,
  CARGO,
  FUEL,
  SUMMARY,
 CG
}

class WeightAndBalanceMenu {
  WeightAndBalanceMenuItems item;

  WeightAndBalanceMenu(this.item);
}

extension MenuButtonItemsExtension on WeightAndBalanceMenuItems {
  int get id {
    switch (this) {
      case WeightAndBalanceMenuItems.BASIC_CONFIGURATION:
        return 0;
      case WeightAndBalanceMenuItems.WEIGHT_CALCULATION:
        return 1;
      case WeightAndBalanceMenuItems.CREW_MEMBER:
        return 2;
      case WeightAndBalanceMenuItems.SEATS:
        return 3;
      case WeightAndBalanceMenuItems.CARGO:
        return 4;
      case WeightAndBalanceMenuItems.FUEL:
        return 5;
      case WeightAndBalanceMenuItems.SUMMARY:
        return 6;
      case WeightAndBalanceMenuItems.CG:
        return 7;
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case WeightAndBalanceMenuItems.BASIC_CONFIGURATION:
        return "Temel Konfigürasyon";
      case WeightAndBalanceMenuItems.WEIGHT_CALCULATION:
        return "Yük Ağırlığı Hesaplama";
      case WeightAndBalanceMenuItems.CREW_MEMBER:
        return "Uçuş Ekibi";
      case WeightAndBalanceMenuItems.SEATS:
        return "Koltuk/Konsol";
      case WeightAndBalanceMenuItems.CARGO:
        return "Kargo";
      case WeightAndBalanceMenuItems.FUEL:
        return "Yakıt Tankı";
      case WeightAndBalanceMenuItems.SUMMARY:
        return "Özet";
      case WeightAndBalanceMenuItems.CG:
        return "CG(%MAC) Sonuçları";
      default:
        return null;
    }
  }

  Icon get icon {
    switch (this) {
      case WeightAndBalanceMenuItems.BASIC_CONFIGURATION:
        return Icon(Icons.settings_input_component);
      case WeightAndBalanceMenuItems.WEIGHT_CALCULATION:
        return Icon(Icons.settings_input_component);
      case WeightAndBalanceMenuItems.CREW_MEMBER:
        return Icon(Icons.thumbs_up_down);
      case WeightAndBalanceMenuItems.SEATS:
        return Icon(Icons.map);
      case WeightAndBalanceMenuItems.CARGO:
        return Icon(Icons.apps);
      case WeightAndBalanceMenuItems.FUEL:
        return Icon(Icons.edit_attributes);
      case WeightAndBalanceMenuItems.SUMMARY:
        return Icon(Icons.bubble_chart);
      case WeightAndBalanceMenuItems.CG:
        return Icon(Icons.ondemand_video);
      default:
        return null;
    }
  }
}
