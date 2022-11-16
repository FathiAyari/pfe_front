import 'package:cypros_comparator/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';

import '../../../../util/ConstraintsConstants.dart';
import '../../../../util/color_resources.dart';
import '../../home/items/profile_item/components/ui_components/back_button.dart';
import '../components/auth_button.dart';
import '../components/input_field.dart';
import '../components/password_field.dart';
import '../components/social_auth_buttons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: ColorResources.getAuthScreenGradientColors(context)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                backButton("", context),
                Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: Constants.screenHeight,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Lottie.asset("assets/images/sign_up.json",
                                height: Constants.screenHeight * 0.2, width: Constants.screenWidth * 0.9),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: Constants.screenHeight * 0.01,
                                  left: Constants.screenWidth * 0.09,
                                  right: Constants.screenWidth * 0.09),
                              child: InputField(nameController, Icons.account_circle_outlined, "${"first_name".tr}", context),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: Constants.screenHeight * 0.01,
                                  left: Constants.screenWidth * 0.09,
                                  right: Constants.screenWidth * 0.09),
                              child: InputField(lastNameController, Icons.account_circle_outlined, "${"last_name".tr}", context),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: Constants.screenHeight * 0.01,
                                  left: Constants.screenWidth * 0.09,
                                  right: Constants.screenWidth * 0.09),
                              child: InputField(phoneController, Icons.phone, "${"phone_number".tr}", context),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: Constants.screenHeight * 0.01,
                                  left: Constants.screenWidth * 0.09,
                                  right: Constants.screenWidth * 0.09),
                              child: InputField(emailController, Icons.email, "${"email".tr}", context),
                            ),
                            buildSignInPasswordField(hint: "${"password_hint".tr}", passwordController: passwordController),
                            loading
                                ? Padding(
                                    padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.03),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : AuthButton(
                                    label: "sign_up".tr,
                                    press: () {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          loading = true;
                                        });
                                        AuthServices()
                                            .SignUp(
                                          nameController.text,
                                          lastNameController.text,
                                          phoneController.text,
                                          emailController.text,
                                          passwordController.text,
                                        )
                                            .then((value) {
                                          setState(() {
                                            loading = false;
                                          });
                                          if (value) {
                                            Get.toNamed('/home');
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "invalid_credentials".tr,
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.grey,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        });
                                      }
                                    },
                                  ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.001),
                              child: Column(
                                children: [
                                  Text(
                                    "sign_up_with".tr,
                                    style: TextStyle(color: ColorResources.getAuthTextColors(context), fontFamily: "NunitoBold"),
                                  ),
                                  SocialAuthButtons(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
