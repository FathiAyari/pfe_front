import 'package:cypros_comparator/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

extension ThemeExtension on BuildContext {
  TextStyle get textStyleMenuItem => TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: isDark
          ? const Color(0xFFFFFFFF).withOpacity(0.6)
          : const Color(0xFFFAFAFA));
  TextStyle get textStyleAppbar => TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: Theme.of(this).primaryColor);
  bool get isDark {
    return Provider.of<ThemeProvider>(this).darkTheme;
  }

  Color get backgroundColor =>
      isDark ? const Color(0xFF4d5054) : Theme.of(this).primaryColor;
}
