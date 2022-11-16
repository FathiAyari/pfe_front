import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../util/ConstraintsConstants.dart';
import '../../../../../util/color_resources.dart';
import '../../../../components/profile_header.dart';
import '../../../home/items/profile_item/components/shared_components/buildGridItem.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<AccountSettings> {
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
    return Scaffold(
      backgroundColor: ColorResources.getBackGroundColor(context),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ProfileHeader(
                isVisible: isVisible,
              ),
              SizedBox(
                height: Constants.screenHeight * 0.06,
              ),
              Expanded(
                child: ListView(children: [
                  buildGridItem(
                      "/change_email", "assets/images/change_email.png", "${"change_email".tr}", Color(0xff3dc295), context),
                  buildGridItem("/change_user_name", "assets/images/change_user_name.png", "${"change_user_name".tr}",
                      Color(0xff838edc), context),
                  buildGridItem("/change_password", "assets/images/change_password.png", "${"change_password".tr}",
                      Color(0xfff59e69), context),
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
