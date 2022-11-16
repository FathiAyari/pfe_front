import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../util/ConstraintsConstants.dart';
import '../../../../util/color_resources.dart';

Widget InputField(TextEditingController emailController, IconData prefixIcon, String hint, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: Constants.screenWidth * 0.01,
    ),
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorResources.bottomNavigationBarColor(context),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
          ]),
      height: 60,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "invalid_input".tr;
          }
        },
        controller: emailController,
        style: TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              prefixIcon,
              color: ColorResources.inputFieldsColor(context),
            ),
            hintText: hint,
            hintStyle: TextStyle(color: ColorResources.inputFieldsColor(context), fontFamily: "NunitoBold")),
      ),
    ),
  );
}
