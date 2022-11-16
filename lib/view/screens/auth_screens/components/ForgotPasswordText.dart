import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../util/ConstraintsConstants.dart';
import '../../../../util/color_resources.dart';

Padding forgotPasswordText(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: Constants.screenWidth * 0.09),
    child: TextButton(
      onPressed: () {
        Get.toNamed("/reset_password");
      },
      child: Container(
        alignment: Alignment.topRight,
        width: double.infinity,
        child: Text(
          "forgot_password".tr,
          style: TextStyle(
            fontSize: 14,
            color: ColorResources.getAuthTextColors(context),
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ),
  );
}
