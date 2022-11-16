import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/config.dart';

class MenuController extends InheritedWidget {
  final ZoomDrawerController _drawerController;

  const MenuController(this._drawerController,
      {Key? key, required Widget child})
      : super(key: key, child: child);

  static MenuController of(BuildContext context) {
    final MenuController? result =
        context.dependOnInheritedWidgetOfExactType<MenuController>();
    assert(result != null, 'No MenuController found in context');
    return result!;
  }

  void toggle() {
    _drawerController.toggle!();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
