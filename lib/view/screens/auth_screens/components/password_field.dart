import 'package:cypros_comparator/util/ConstraintsConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../util/color_resources.dart';

class buildSignInPasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final String hint;
  const buildSignInPasswordField({Key? key, required this.passwordController, required this.hint}) : super(key: key);

  @override
  _buildSignInPasswordFieldState createState() => _buildSignInPasswordFieldState();
}

class _buildSignInPasswordFieldState extends State<buildSignInPasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.screenWidth * 0.1),
      child: Container(
        height: 60,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: ColorResources.bottomNavigationBarColor(context),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
            ]),
        child: TextFormField(
          controller: widget.passwordController,
          validator: (value) {
            if (value!.isEmpty) {
              return "invalid_input".tr;
            }
          },
          obscureText: obscureText,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: obscureText
                    ? Icon(
                        Icons.remove_red_eye,
                        color: ColorResources.inputFieldsColor(context),
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: ColorResources.inputFieldsColor(context),
                      ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              hintText: widget.hint,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: ColorResources.inputFieldsColor(context),
              ),
              hintStyle: TextStyle(color: ColorResources.inputFieldsColor(context), fontFamily: "NunitoBold")),
        ),
      ),
    );
  }
}
