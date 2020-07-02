enum ToolMenuItemsEnum {
  DISTANCE,
  DIRECTION,
  COORDINATE,
}

class ToolMenuItems {
  ToolMenuItemsEnum item;

  ToolMenuItems(this.item);
}

extension ToolMenuItemsExtension on ToolMenuItemsEnum {
  int get id {
    switch (this) {
      case ToolMenuItemsEnum.DISTANCE:
        return 0;
      case ToolMenuItemsEnum.DIRECTION:
        return 1;
      case ToolMenuItemsEnum.COORDINATE:
        return 2;
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case ToolMenuItemsEnum.DISTANCE:
        return "Mesafe Ölçümü";
      case ToolMenuItemsEnum.DIRECTION:
        return "Yön Ölçümü";
      case ToolMenuItemsEnum.COORDINATE:
        return "Koordinat Ölçümü";
      default:
        return null;
    }
  }

}
