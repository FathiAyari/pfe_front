import 'package:cypros_comparator/view/screens/navigation_drawer/components/menu_item.dart';

class MenuItems {
  static const homePage = MenuItemElement(label: "Home", imagePath: "assets/images/home.png");
  static const accountSettings = MenuItemElement(label: "Account settings", imagePath: "assets/images/user_settings.png");
  static const appSettings = MenuItemElement(label: "App settings", imagePath: "assets/images/setting.png");

  static const allPages = [homePage, accountSettings, appSettings];
}
