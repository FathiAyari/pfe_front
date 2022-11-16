import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../util/ConstraintsConstants.dart';

Container back_button(Color color) {
  return Container(
    width: double.infinity,
    height: Constants.screenHeight * 0.08,
    child: Row(
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: color,
            ))
      ],
    ),
  );
}
