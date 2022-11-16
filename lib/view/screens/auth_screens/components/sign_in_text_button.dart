import 'package:cypros_comparator/view/screens/auth_screens/components/social_auth_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../util/ConstraintsConstants.dart';
import '../../../../util/color_resources.dart';

Padding buildSignUpTextButton(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: Constants.screenHeight * 0.03),
    child: Container(
      child: Column(
        children: [
          Text(
            "sign_in_with".tr,
            style: TextStyle(color: ColorResources.getAuthTextColors(context), fontFamily: "NunitoBold"),
          ),
          SocialAuthButtons(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "create_account".tr,
                style: TextStyle(fontFamily: "NunitoBold", color: ColorResources.getAuthTextColors(context)),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/sign_up');
                },
                child: Text(
                  "sign_up_here".tr,
                  style: TextStyle(
                    color: ColorResources.getAuthTextColors(context),
                    fontSize: Constants.screenHeight * 0.0195,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
