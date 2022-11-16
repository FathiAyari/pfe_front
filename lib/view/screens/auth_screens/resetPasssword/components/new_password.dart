import 'package:cypros_comparator/view/screens/auth_screens/components/password_field.dart';
import 'package:cypros_comparator/view/screens/home/items/profile_item/components/ui_components/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';

import '../../../../../util/ConstraintsConstants.dart';
import '../../../../../util/color_resources.dart';
import '../../components/auth_button.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController passwordController = TextEditingController();
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
                    padding: EdgeInsets.only(bottom: Constants.screenHeight * 0.03),
                    child: buildSignInPasswordField(
                      passwordController: passwordController,
                      hint: "${"new_password".tr}",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Constants.screenHeight * 0.03),
                    child: buildSignInPasswordField(
                      passwordController: passwordController,
                      hint: "${"confirm_password".tr}",
                    ),
                  ),
                  AuthButton(
                    press: () {},
                    label: 'reset'.tr,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
