import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import '../../util/ConstraintsConstants.dart';
import '../../util/color_resources.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({
    Key? key,
    required this.isVisible,
  }) : super(key: key);

  final bool isVisible;
  var user = GetStorage().read("user");
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.screenHeight * 0.3,
      decoration: BoxDecoration(
          color: ColorResources.profileHeader(context),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(110), bottomRight: Radius.circular(0), bottomLeft: Radius.circular(110))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      ZoomDrawer.of(context)!.open();
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      height: Constants.screenHeight * 0.08,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/avatar.png"),
                      ),
                    )),
              ),
              Container(
                height: Constants.screenHeight * 0.15,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: Constants.screenHeight * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "welcome_back".tr,
                              style: TextStyle(
                                  fontFamily: "NunitoBold", fontSize: Constants.screenHeight * 0.03, color: Colors.white),
                            ),
                            Text(
                              "${user["name"]} ${user["last_name"]}",
                              style: TextStyle(
                                  fontFamily: "NunitoBold", fontSize: Constants.screenHeight * 0.02, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Visibility(
                          visible: isVisible,
                          child: Container(
                            child: Lottie.asset("assets/images/hello.json",
                                repeat: false, height: Constants.screenHeight * 0.2, width: Constants.screenWidth * 0.3),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
