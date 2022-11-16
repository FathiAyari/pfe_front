import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../util/color_resources.dart';
import '../../../../auth_screens/components/auth_button.dart';
import '../../../../auth_screens/components/input_field.dart';
import '../../../../auth_screens/components/password_field.dart';
import '../../../../home/items/profile_item/components/ui_components/back_button.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  TextEditingController emailController = TextEditingController();
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
                backButton('change_email'.tr, context),
                SizedBox(
                  height: Constants.screenHeight * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Constants.screenHeight * 0.03),
                  child: InputField(emailController, Icons.email, "email".tr, context),
                ),
                buildSignInPasswordField(hint: 'password_hint'.tr, passwordController: passwordController),
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
