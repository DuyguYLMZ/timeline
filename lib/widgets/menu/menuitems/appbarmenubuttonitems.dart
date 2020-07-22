enum AppbarMenuButtonItemsEnum {
  TASK_MANAGEMENT,
  NEW_TASK,
  CLOSE_TASK,
  SAVE_TASK,
  OPEN_TASK,
  SHARE_TASK
}

class MenuButtonItems {
  AppbarMenuButtonItemsEnum item;

  MenuButtonItems(this.item);
}

extension MenuButtonItemsExtension on AppbarMenuButtonItemsEnum {
  int get id {
    switch (this) {
      case AppbarMenuButtonItemsEnum.TASK_MANAGEMENT:
        return 0;
      case AppbarMenuButtonItemsEnum.NEW_TASK:
        return 1;
      case AppbarMenuButtonItemsEnum.CLOSE_TASK:
        return 2;
      case AppbarMenuButtonItemsEnum.SAVE_TASK:
        return 3;
      case AppbarMenuButtonItemsEnum.OPEN_TASK:
        return 4;
      case AppbarMenuButtonItemsEnum.SHARE_TASK:
        return 5;
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case AppbarMenuButtonItemsEnum.TASK_MANAGEMENT:
        return "Görev Yönetimi";
      case AppbarMenuButtonItemsEnum.NEW_TASK:
        return "Yeni Görev";
      case AppbarMenuButtonItemsEnum.CLOSE_TASK:
        return "Görevi Temizle";
      case AppbarMenuButtonItemsEnum.SAVE_TASK:
        return "Görevi Kaydet";
      case AppbarMenuButtonItemsEnum.OPEN_TASK:
        return "Görev Aç";
      case AppbarMenuButtonItemsEnum.SHARE_TASK:
        return "Görevi Paylaş";
      default:
        return null;
    }
  }
}
