import 'package:cypros_comparator/util/ConstraintsConstants.dart';
import 'package:cypros_comparator/view/components/profile_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../util/color_resources.dart';
import 'components/shared_components/buildGridItem.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isVisible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (this.mounted) {
        setState(() {
          isVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.getBackGroundColor(context),
        body: Container(
          child: Column(
            children: [
              ProfileHeader(isVisible: isVisible),
              SizedBox(
                height: Constants.screenHeight * 0.06,
              ),
              Expanded(
                child: ListView(children: [
                  buildGridItem("/my_lists", "assets/images/lists.png", "${'my_lists'.tr}", Color(0xfff59e69), context),
                  buildGridItem(
                      "/connections", "assets/images/connections.png", "${'connections'.tr}", Color(0xff3dc295), context),
                  buildGridItem(
                      "/explore", "assets/images/explore.png", "${"search_for_friends".tr}", Color(0xff838edc), context),
                  buildGridItem("/my_cards", "assets/images/loaylty_card.png", "${"my_cards".tr}", Color(0xfff563a2), context),
                ]),
              ),
            ],
          ),
          decoration: const BoxDecoration(),
        ),
      ),
    );
  }
}
