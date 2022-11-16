import 'dart:io';

import 'package:cypros_comparator/theme/dark_theme.dart';
import 'package:cypros_comparator/theme/light_theme.dart';
import 'package:cypros_comparator/util/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'data/datasource/internacionalization/languages.dart';
import 'data/datasource/remote/dio/HttpOverrides.dart';
import 'di_container.dart' as di;
import 'helper/route_helper.dart';
import 'provider/theme_provider.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  var locale = GetStorage().read("locale") ?? "en";
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
      locale: Locale(locale, ''),
      fallbackLocale: const Locale('en', 'US'),
      onGenerateRoute: RouteHelper.router.generator,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      navigatorKey: MyApp.navigatorKey,
      getPages: AppConstants.routes,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      initialRoute: '/',
    );
  }
}
