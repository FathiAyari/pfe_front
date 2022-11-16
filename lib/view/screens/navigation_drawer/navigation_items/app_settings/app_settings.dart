import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/theme_provider.dart';
import '../../../../../util/ConstraintsConstants.dart';
import '../../../../../util/color_resources.dart';
import '../../../home/items/home_item/components/open_menu_button.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<AppSettings> {
  String getCurrentLocale() {
    String locale = Get.locale.toString().split("_")[0];

    return locale.tr;
  }

  var localeInit = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getBackGroundColor(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Constants.screenHeight * 0.04,
            ),
            openMenuButton(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: Constants.screenHeight * 0.1,
                  decoration:
                      BoxDecoration(color: ColorResources.gridItemColor(context), borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Constants.screenWidth * 0.06, vertical: Constants.screenHeight * 0.01),
                        child: Container(
                          height: Constants.screenHeight * 0.06,
                          decoration:
                              BoxDecoration(color: Color(0xff838edc).withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/dark_mode.png",
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "${Provider.of<ThemeProvider>(context, listen: false).darkTheme ? "dark_mode".tr : "light_mode".tr}",
                        style: TextStyle(fontFamily: "NunitoBold", color: ColorResources.darkModeSwitcher(context)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.scale(
                          scale: 1.8,
                          child: Consumer<ThemeProvider>(
                            builder: (context, themeProvider, child) => Switch(
                              inactiveTrackColor: Colors.amber.withOpacity(0.5),
                              inactiveThumbImage: AssetImage("assets/images/day.png"),
                              activeColor: Colors.black.withOpacity(0.1),
                              activeThumbImage: AssetImage("assets/images/night.png"),
                              onChanged: (value) {
                                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                              },
                              value: themeProvider.darkTheme,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(color: ColorResources.gridItemColor(context), borderRadius: BorderRadius.circular(20)),
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: Constants.screenWidth * 0.015,
                              top: Constants.screenHeight * 0.01,
                              right: Constants.screenWidth * 0.06,
                              bottom: Constants.screenHeight * 0.01),
                          child: Container(
                            height: Constants.screenHeight * 0.06,
                            decoration:
                                BoxDecoration(color: Color(0xfff59e69).withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/images/language.png",
                                color: Color(0xfff59e69),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "${"language".tr}: ${getCurrentLocale()}",
                          style: TextStyle(fontFamily: "NunitoBold", color: ColorResources.languageItem(context)),
                        ),
                      ],
                    ),
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.updateLocale(const Locale('en', 'US'));
                          localeInit.write("locale", "en_US");
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: Constants.screenHeight * 0.02,
                            left: Constants.screenWidth * 0.015,
                          ),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            height: Constants.screenHeight * 0.1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: Constants.screenWidth * 0.06,
                                      top: Constants.screenHeight * 0.01,
                                      right: Constants.screenWidth * 0.06,
                                      bottom: Constants.screenHeight * 0.01),
                                  child: Container(
                                    child: Image.asset(
                                      "assets/images/united-kingdom.png",
                                      height: Constants.screenHeight * 0.08,
                                      width: Constants.screenWidth * 0.13,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Text("${"en".tr}",
                                    style: TextStyle(fontFamily: "NunitoBold", color: ColorResources.languageItem(context))),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.blueAccent,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.updateLocale(const Locale('fr', 'FR'));
                          localeInit.write("locale", "fr_FR");
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: Constants.screenHeight * 0.02,
                            left: Constants.screenWidth * 0.015,
                          ),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            height: Constants.screenHeight * 0.1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: Constants.screenWidth * 0.06,
                                      top: Constants.screenHeight * 0.01,
                                      right: Constants.screenWidth * 0.06,
                                      bottom: Constants.screenHeight * 0.01),
                                  child: Container(
                                    child: Image.asset(
                                      "assets/images/france.png",
                                      height: Constants.screenHeight * 0.08,
                                      width: Constants.screenWidth * 0.13,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Text("${"fr".tr}",
                                    style: TextStyle(fontFamily: "NunitoBold", color: ColorResources.languageItem(context))),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.blueAccent,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
