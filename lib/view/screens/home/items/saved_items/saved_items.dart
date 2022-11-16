import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';

import '../../../../../util/ConstraintsConstants.dart';
import '../../../../../util/color_resources.dart';

class SavedItems extends StatefulWidget {
  const SavedItems({Key? key}) : super(key: key);

  @override
  _SavedItemsState createState() => _SavedItemsState();
}

class _SavedItemsState extends State<SavedItems> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorResources.getBackGroundColor(context),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Row(
                        children: [
                          Container(
                              height: Constants.screenHeight * 0.06,
                              child: Lottie.asset(
                                "assets/images/saved_animation.json",
                              )),
                          Text(
                            "saved_items".tr,
                            style: TextStyle(
                                fontSize: Constants.screenHeight * 0.02, fontFamily: "NunitoBold", color: Color(0xff3dc295)),
                          ),
                        ],
                      )),
                      Container(
                        alignment: Alignment.center,
                        height: Constants.screenHeight * 0.06,
                        width: Constants.screenWidth * 0.15,
                        child: Text(
                          "15",
                          style: TextStyle(
                            fontFamily: "NunitoBold",
                            color: ColorResources.darkModeSwitcher(context),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: Constants.screenWidth * 0.007,
                              color: ColorResources.darkModeSwitcher(context),
                            ),
                            color: ColorResources.bottomNavigationBarColor(context),
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.015),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorResources.bottomNavigationBarColor(context),
                          ),
                          child: ListTile(
                            title: Container(
                              height: Constants.screenHeight * 0.08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/images/user.png",
                                      height: Constants.screenHeight * 0.05,
                                    ),
                                  ),
                                  Text(
                                    "Item",
                                    style: TextStyle(
                                        color: Color(0xff5686E1),
                                        fontFamily: "NunitoBold",
                                        fontSize: Constants.screenHeight * 0.02),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          )),
    );
  }
}
