import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../util/ConstraintsConstants.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.label,
    required this.press,
  }) : super(key: key);
  final String label;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Constants.screenHeight * 0.02,
        horizontal: Constants.screenWidth * 0.1,
      ),
      child: Container(
          width: Constants.screenWidth * 0.85,
          height: Constants.screenHeight * 0.06,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Colors.indigo),
              onPressed: press,
              child: Text(
                "$label",
                style: TextStyle(fontFamily: "NunitoBold"),
              ))),
    );
  }
}
