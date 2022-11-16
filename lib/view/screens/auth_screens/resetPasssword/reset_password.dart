import 'package:cypros_comparator/util/ConstraintsConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../../util/color_resources.dart';
import '../../home/items/profile_item/components/ui_components/back_button.dart';
import '../components/auth_button.dart';
import '../components/input_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPAsswordState createState() => _ResetPAsswordState();
}

class _ResetPAsswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: ColorResources.getAuthScreenGradientColors(context)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  backButton("", context),
                  Lottie.asset(
                    "assets/images/reset_password.json",
                    height: Constants.screenHeight * 0.2,
                    repeat: false,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: Constants.screenHeight * 0.01,
                        left: Constants.screenWidth * 0.09,
                        right: Constants.screenWidth * 0.09),
                    child: InputField(emailController, Icons.email, "email".tr, context),
                  ),
                  AuthButton(
                    press: () {
                      Get.toNamed("/verify");
                    },
                    label: "reset".tr,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
