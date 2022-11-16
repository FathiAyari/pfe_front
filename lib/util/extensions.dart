import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

extension LocaleExtensions on Locale {
  toLanguageFullName() {
    return tr('languages.$languageCode');
  }
}
