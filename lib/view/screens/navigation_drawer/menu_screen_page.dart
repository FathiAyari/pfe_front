import 'package:cypros_comparator/services/auth_services.dart';
import 'package:cypros_comparator/util/ConstraintsConstants.dart';
import 'package:cypros_comparator/view/screens/navigation_drawer/components/menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ndialog/ndialog.dart';

import '../../../util/color_resources.dart';
import '../../components/will_pop.dart';
import 'components/menu_items.dart';

class MenuScreenPage extends StatefulWidget {
  final MenuItemElement currentItem;
  final ValueChanged<MenuItemElement> onSelectedItem;
  const MenuScreenPage({Key? key, required this.currentItem, required this.onSelectedItem}) : super(key: key);

  @override
  _MenuScreenPageState createState() => _MenuScreenPageState();
}

class _MenuScreenPageState extends State<MenuScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.menuDrawer(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8, top: Constants.screenHeight * 0.13),
              child: const CircleAvatar(
                radius: 31,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
              ),
            ),
            ...MenuItems.allPages.map((element) => buildMenuItem(element)).toList(),
            SizedBox(
              height: Constants.screenHeight * 0.06,
            ),
            GestureDetector(
              onTap: () {
                NAlertDialog(
                  title: WillPopTitle("${"want_logout".tr}", context),
                  actions: [
                    Negative(),
                    Positive(() {
                      AuthServices().logout();
                    })
                  ],
                  blur: 2,
                ).show(context, transitionType: DialogTransitionType.Bubble);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset("assets/images/logout.png", height: Constants.screenHeight * 0.04, color: Color(0xfff563a2)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "logout".tr,
                            style: TextStyle(color: Color(0xfff563a2), fontFamily: "NunitoBold"),
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: ColorResources.bottomNavigationBarColor(context), borderRadius: BorderRadius.circular(15)),
                  height: Constants.screenHeight * 0.07,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildMenuItem(MenuItemElement menuItem) {
    return GestureDetector(
      onTap: () => widget.onSelectedItem(menuItem),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  "${menuItem.imagePath}",
                  color: menuItem == widget.currentItem ? Color(0xff3dc295) : Color(0xff838edc),
                  height: Constants.screenHeight * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${menuItem.label}",
                    style: TextStyle(
                        color: menuItem == widget.currentItem ? Color(0xff3dc295) : Color(0xff838edc), fontFamily: "NunitoBold"),
                  ),
                )
              ],
            ),
          ),
          decoration:
              BoxDecoration(color: ColorResources.bottomNavigationBarColor(context), borderRadius: BorderRadius.circular(15)),
          height: Constants.screenHeight * 0.07,
        ),
      ),
    );
  }
}
