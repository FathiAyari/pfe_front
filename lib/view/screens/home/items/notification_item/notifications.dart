import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';

import '../../../../../util/ConstraintsConstants.dart';
import '../../../../../util/color_resources.dart';

class Notifcations extends StatefulWidget {
  const Notifcations({Key? key}) : super(key: key);

  @override
  _NotifcationsState createState() => _NotifcationsState();
}

class _NotifcationsState extends State<Notifcations> {
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
                                "assets/images/notification_animation.json",
                              )),
                          Text(
                            "notifications".tr,
                            style: TextStyle(
                                fontSize: Constants.screenHeight * 0.02, fontFamily: "NunitoBold", color: Color(0xff3dc295)),
                          ),
                        ],
                      )),
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: Constants.screenHeight * 0.06,
                            width: Constants.screenWidth * 0.15,
                            child: Text(
                              "2",
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
                          ),
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: Color(0xfff563a2),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    ClipRRect(
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
                              height: Constants.screenHeight * 0.1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(Constants.screenHeight * 0.01),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xff5686E1).withOpacity(0.5), borderRadius: BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: EdgeInsets.all(Constants.screenHeight * 0.008),
                                        child: Image.asset(
                                          "assets/images/report.png",
                                          height: Constants.screenHeight * 0.05,
                                          color: Color(0xff5686E1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "received_report".tr,
                                      style: TextStyle(
                                          color: Color(0xff5686E1),
                                          fontFamily: "NunitoBold",
                                          fontSize: Constants.screenHeight * 0.02),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
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
                              height: Constants.screenHeight * 0.1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(Constants.screenHeight * 0.01),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xff5686E1).withOpacity(0.5), borderRadius: BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: EdgeInsets.all(Constants.screenHeight * 0.008),
                                        child: Image.asset(
                                          "assets/images/explore.png",
                                          height: Constants.screenHeight * 0.05,
                                          color: Color(0xff5686E1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "friend_request_received".tr,
                                      style: TextStyle(
                                          color: Color(0xff5686E1),
                                          fontFamily: "NunitoBold",
                                          fontSize: Constants.screenHeight * 0.02),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
                /*      Expanded(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
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
                ),*/
              ],
            ),
          )),
    );
  }
}
