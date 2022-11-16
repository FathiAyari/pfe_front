import 'dart:ui';

import 'package:cypros_comparator/view/screens/auth_screens/components/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../../../util/color_resources.dart';

class AddCardAlert extends StatelessWidget {
  final String lottieFile;
  final String action;
  final void Function() press;
  final TextEditingController cardNameController = TextEditingController();
  AddCardAlert({required this.press, required this.action, required this.lottieFile});

  show(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: ColorResources.getBackGroundColor(context), borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: Constants.screenHeight * 0.3,
                      width: size.width * 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InputField(cardNameController, Icons.credit_card_outlined, "card_name".tr, context),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(15),
                              ),
                              onPressed: press,
                              child: Text("${action}")),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material();
  }
}
