import 'dart:io';

import 'package:cypros_comparator/view/screens/home/home_page_content.dart';
import 'package:cypros_comparator/view/screens/navigation_drawer/components/menu_item.dart';
import 'package:cypros_comparator/view/screens/navigation_drawer/components/menu_items.dart';
import 'package:cypros_comparator/view/screens/navigation_drawer/menu_screen_page.dart';
import 'package:cypros_comparator/view/screens/navigation_drawer/navigation_items/account_settings/account_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ndialog/ndialog.dart';

import '../../../util/color_resources.dart';
import '../../components/will_pop.dart';
import 'navigation_items/app_settings/app_settings.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  MenuItemElement currentItem = MenuItems.homePage;
  Future<bool> avoidReturnButton() async {
    NAlertDialog(
      title: WillPopTitle("${"want_exit".tr}", context),
      actions: [
        Negative(),
        Positive(() {
          exit(0);
        })
      ],
      blur: 2,
    ).show(context, transitionType: DialogTransitionType.Bubble);
    return true;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: avoidReturnButton,
        child: ZoomDrawer(
            menuBackgroundColor: ColorResources.menuDrawer(context),
            borderRadius: 20,
            style: DrawerStyle.defaultStyle,
            showShadow: false,
            androidCloseOnBackTap: true,
            openCurve: Curves.fastOutSlowIn,
            closeCurve: Curves.fastOutSlowIn,
            slideWidth: MediaQuery.of(context).size.width * 0.67,
            duration: const Duration(milliseconds: 500),
            menuScreen: Builder(builder: (context) {
              return MenuScreenPage(
                currentItem: currentItem,
                onSelectedItem: (item) {
                  setState(() {
                    currentItem = item;
                  });
                  ZoomDrawer.of(context)!.close();
                },
              );
            }),
            angle: 0,
            controller: zoomDrawerController,
            mainScreen: getScreen()),
      );

  getScreen() {
    switch (currentItem) {
      case MenuItems.homePage:
        return HomePageContent();
      case MenuItems.accountSettings:
        return AccountSettings();
      case MenuItems.appSettings:
        return AppSettings();
    }
  }
}
