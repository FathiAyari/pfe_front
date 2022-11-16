import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import '../../../util/color_resources.dart';
import '../OnBoarding/on_boarding_page.dart';
import '../auth_screens/signIn/sign_in_screen.dart';
import '../navigation_drawer/navigation_menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<SplashScreen> {
  var resultSeen = GetStorage().read("seen");
  var auth = GetStorage().read("auth");
  @override
  void initState() {
    Timer(
      Duration(seconds: 4),
      () => Get.to(resultSeen == 1 ? (auth == 1 ? NavigationMenu() : SignInScreen()) : OnBoardingPage()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: ColorResources.getAuthScreenGradientColors(context)),
          ),
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(child: Lottie.asset("assets/images/basket_animation.json")),
              ),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    "caption".tr,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'NunitoBold',
                    ),
                    speed: Duration(milliseconds: 40),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
