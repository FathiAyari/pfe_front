import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../util/color_resources.dart';
import '../../../../auth_screens/components/auth_button.dart';
import '../../../../auth_screens/components/password_field.dart';
import '../../../../home/items/profile_item/components/ui_components/back_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.getBackGroundColor(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                backButton('change_password'.tr, context),
                SizedBox(
                  height: Constants.screenHeight * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Constants.screenHeight * 0.03),
                  child: buildSignInPasswordField(hint: 'old_password_hint'.tr, passwordController: passwordController),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Constants.screenHeight * 0.03),
                  child: buildSignInPasswordField(hint: 'new_password_hint'.tr, passwordController: passwordController),
                ),
                buildSignInPasswordField(hint: 'new_password_hint'.tr, passwordController: passwordController),
                AuthButton(
                  label: 'update'.tr,
                  press: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
