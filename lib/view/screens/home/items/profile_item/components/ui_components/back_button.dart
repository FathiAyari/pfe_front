import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../../util/color_resources.dart';

Container backButton(String label, BuildContext context) {
  return Container(
    child: Row(
      children: [
        Container(
          height: Constants.screenHeight * 0.07,
          width: Constants.screenWidth * 0.15,
          child: InkResponse(
            child: Padding(
              padding: EdgeInsets.all(Constants.screenHeight * 0.015),
              child: Image.asset(
                'assets/images/arrow_left.png',
                color: ColorResources.searchIconColor(context),
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
          decoration: BoxDecoration(
              border: Border.all(
                width: Constants.screenWidth * 0.006,
                color: ColorResources.searchIconColor(context),
              ),
              color: ColorResources.bottomNavigationBarColor(context),
              borderRadius: BorderRadius.circular(20)),
        ),
        SizedBox(
          width: Constants.screenWidth * 0.15,
        ),
        Text(
          "$label",
          style: TextStyle(
            fontFamily: "NunitoBold",
            color: ColorResources.searchIconColor(context),
          ),
        )
      ],
    ),
  );
}
