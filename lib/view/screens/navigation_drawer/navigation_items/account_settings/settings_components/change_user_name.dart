import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../util/color_resources.dart';
import '../../../../auth_screens/components/auth_button.dart';
import '../../../../auth_screens/components/input_field.dart';
import '../../../../auth_screens/components/password_field.dart';
import '../../../../home/items/profile_item/components/ui_components/back_button.dart';

class ChangeUserName extends StatefulWidget {
  const ChangeUserName({Key? key}) : super(key: key);

  @override
  _ChangeUserNameState createState() => _ChangeUserNameState();
}

class _ChangeUserNameState extends State<ChangeUserName> {
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
                backButton('change_user_name'.tr, context),
                SizedBox(
                  height: Constants.screenHeight * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Constants.screenHeight * 0.03),
                  child: InputField(emailController, Icons.email, 'first_name'.tr, context),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Constants.screenHeight * 0.03),
                  child: InputField(emailController, Icons.email, "last_name".tr, context),
                ),
                buildSignInPasswordField(hint: 'password_hint'.tr, passwordController: passwordController),
                AuthButton(
                  label: "update".tr,
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
