import 'package:cypros_comparator/data/model/ProductModel/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../util/app_constants.dart';
import '../../saved_items/saved_items.dart';

Positioned SaveItem(Product product) {
  return Positioned(
    left: -Constants.screenHeight * 0.001,
    top: -Constants.screenHeight * 0.001,
    child: Padding(
      padding: EdgeInsets.all(5),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xfff563a2)),
              borderRadius: BorderRadius.circular(10)),
          child: GestureDetector(
            onTap: () {
              Get.rawSnackbar(
                titleText: Text(
                  "${AppConstants.APP_NAME}",
                  style:
                      TextStyle(fontFamily: "NunitoBold", color: Colors.white),
                ),
                messageText: Text(
                  "${product.name}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontFamily: "NunitoBold", color: Colors.white),
                ),
                icon: Icon(Icons.done, color: Colors.white),
                snackPosition: SnackPosition.TOP,
                borderRadius: 20,
                backgroundColor: Color(0xff838edc),
                margin: EdgeInsets.symmetric(
                    vertical: Constants.screenHeight * 0.01,
                    horizontal: Constants.screenWidth * 0.01),
                onTap: (GetSnackBar test) {
                  Get.closeCurrentSnackbar();
                  Get.to(SavedItems());
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Icon(
                Icons.bookmark,
                color: Color(0xfff563a2),
              ),
            ),
          )),
    ),
  );
}
