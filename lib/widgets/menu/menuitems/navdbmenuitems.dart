enum NavdbMenuButtonItemsEnum {
ADVANCED_SEARCH
}

extension MenuButtonItemsExtension on NavdbMenuButtonItemsEnum {
  int get id {
    switch (this) {
      case NavdbMenuButtonItemsEnum.ADVANCED_SEARCH:
        return 0;
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case NavdbMenuButtonItemsEnum.ADVANCED_SEARCH:
        return "Advanced Search";
      default:
        return null;
    }
  }
}
