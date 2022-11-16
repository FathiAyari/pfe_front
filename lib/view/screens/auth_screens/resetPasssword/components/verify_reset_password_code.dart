import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../util/ConstraintsConstants.dart';
import '../../../../../util/color_resources.dart';
import '../../../home/items/profile_item/components/ui_components/back_button.dart';
import '../../components/auth_button.dart';

class VerifyResetCode extends StatefulWidget {
  const VerifyResetCode({Key? key}) : super(key: key);

  @override
  _VerifyResetCodeState createState() => _VerifyResetCodeState();
}

class _VerifyResetCodeState extends State<VerifyResetCode> {
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
                    "assets/images/otp.json",
                    height: Constants.screenHeight * 0.2,
                    repeat: false,
                  ),
                  Row(
                    children: [
                      CodeVerification(),
                      CodeVerification(),
                      CodeVerification(),
                      CodeVerification(),
                      CodeVerification()
                    ],
                  ),
                  AuthButton(
                    press: () {
                      Get.toNamed('/new_password');
                    },
                    label: "validate".tr,
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class CodeVerification extends StatelessWidget {
  const CodeVerification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: Constants.screenHeight * 0.07,
        width: Constants.screenWidth * 0.15,
        child: TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration:
              InputDecoration(border: InputBorder.none, hintStyle: TextStyle(color: Colors.indigo, fontFamily: "NunitoBold")),
        ),
      ),
    );
  }
}
