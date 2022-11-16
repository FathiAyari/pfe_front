import 'package:cypros_comparator/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorResources {
  static Color getGreyColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFb2b8bd) : Color(0xFFE4EAEF);
  }

  static Color getTimeColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFFFFFFF) : Color(0xFFE4EAEF);
  }

  static Color getBackGroundColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF25282B) : Color(0xfff1f5f6);
  }

  static Color getAuthTextColors(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xffcdcfd0) : Color(0xfff1f5f6);
  }

  static List<Color> getAuthScreenGradientColors(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? [Color(0xFF25282B), Color(0xFF25282B)]
        : [
            Colors.indigo,
            Colors.blueGrey,
          ];
  }

  static Color unSelecteNavigationItemdColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xffb0aeae) : Color(0xff838edc);
  }

  static Color selecteNavigationItemdColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xff838edc) : Color(0xff3dc295);
  }

  static Color bottomNavigationBarColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF4d5054) : Colors.white;
  }

  static Color searchFieldColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF4d5054) : Color(0xff3dc295).withOpacity(0.5);
  }

  static Color closeSerachFieldIconColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Colors.amber.withOpacity(0.9) : Color(0xfff563a2);
  }

  static Color searchIconColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xff8d8b8b) : Color(0xff3dc295);
  }

  static Color inputFieldsColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xff8d8b8b) : Colors.indigo;
  }

  static Color darkModeSwitcher(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xffcec9c9) : Color(0xff838edc);
  }

  static Color profileHeader(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xff009167).withOpacity(0.5) : Color(0xff3dc295);
  }

  static Color languageItem(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xffcec9c9) : Color(0xfff59e69);
  }

  static Color menuDrawer(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xff2d2e2f) : Color(0xff838edc);
  }

  static Color gridItemColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF4d5054) : Colors.white;
  }

  static Color getDarkColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF4d5054) : Color(0xFF25282B);
  }

  static Color getALertTextColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFFFFFFF) : Color(0xfff563a2);
  }

  static Color getCardBgColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFFFFFFF).withOpacity(0.05) : Color(0xFFFFFFFF);
  }

  static Color getTabsColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFFFFFFF).withOpacity(0.3) : Color(0xff3dc295);
  }

  static Color getTextColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFFFFFFF).withOpacity(0.6) : Color(0xFF1F1F1F);
  }

  static Color getHintColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF98a1ab) : Color(0xFF7A7A7A);
  }

  static Color getBackgroundColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF4d5054) : Color(0xFFFAFAFA);
  }

  static Color getGreyLightColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFb2b8bd) : Color(0xFF98a1ab);
  }

  static Color getYellow(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF916129) : Color(0xFFFFAA47);
  }

  static Color getGreen(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF167d3c) : Color(0xFF23CB60);
  }

  static Color getCategoryBgColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFFFFFFF) : Color(0xFFb2b8bd);
  }

  static Color getOrderColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF4d5054) : Color(0xFFE4EAEF).withOpacity(0.9);
  }
}
