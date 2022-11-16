import 'dart:io';

import 'package:cypros_comparator/services/auth_services.dart';
import 'package:cypros_comparator/util/ConstraintsConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

import '../../../../services/Real_time_internet_connection_check/Connectivity_provider.dart';
import '../../../../services/Real_time_internet_connection_check/NoInternetConnection.dart';
import '../../../../util/color_resources.dart';
import '../../../components/will_pop.dart';
import '../components/ForgotPasswordText.dart';
import '../components/auth_button.dart';
import '../components/input_field.dart';
import '../components/password_field.dart';
import '../components/sign_in_text_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SignInScreenWidget(),
    );
  }
}

Widget PageUi() {
  return Consumer<ConnectivityProvider>(builder: (context, model, child) {
    if (model.isOnline != null) {
      return model.isOnline ? SignInScreen() : NoInternetConnection();
    }
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  });
}

class SignInScreenWidget extends StatefulWidget {
  const SignInScreenWidget({Key? key}) : super(key: key);

  @override
  _SignInScreenWidgetState createState() => _SignInScreenWidgetState();
}

class _SignInScreenWidgetState extends State<SignInScreenWidget> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  Future<bool> avoidReturnButton() async {
    NAlertDialog(
      title: WillPopTitle("want_exit".tr, context),
      actions: [
        Negative(),
        Positive(() {
          exit(0);
        })
      ],
      blur: 2,
    ).show(context, transitionType: DialogTransitionType.Bubble);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: WillPopScope(
          onWillPop: avoidReturnButton,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: ColorResources.getAuthScreenGradientColors(context),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: Constants.screenHeight,
                      child: Padding(
                        padding: EdgeInsets.only(top: Constants.screenHeight * 0.1),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Lottie.asset("assets/images/sign_in.json",
                                  height: Constants.screenHeight * 0.33, width: Constants.screenWidth * 0.9),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: Constants.screenHeight * 0.01,
                                    left: Constants.screenWidth * 0.09,
                                    right: Constants.screenWidth * 0.09),
                                child: InputField(emailController, Icons.email, "${"email".tr}", context),
                              ),
                              buildSignInPasswordField(hint: "${"password_hint".tr} ", passwordController: passwordController),
                              loading
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.03),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : AuthButton(
                                      label: "sign_in".tr,
                                      press: () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            loading = true;
                                          });

                                          AuthServices().SignIn(emailController.text, passwordController.text).then((value) {
                                            setState(() {
                                              loading = false;
                                            });

                                            if (value) {
                                              Get.offAllNamed("/home");
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
                              forgotPasswordText(context),
                              Spacer(),
                              buildSignUpTextButton(context)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
