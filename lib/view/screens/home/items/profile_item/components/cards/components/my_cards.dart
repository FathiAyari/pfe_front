import 'package:barcode_widget/barcode_widget.dart';
import 'package:cypros_comparator/data/model/loyalty_cards/loyalty_cards.dart';
import 'package:cypros_comparator/util/ConstraintsConstants.dart';
import 'package:cypros_comparator/view/screens/home/items/profile_item/components/ui_components/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../../../../util/color_resources.dart';

class MyCards extends StatefulWidget {
  final LoyaltyCards loyaltyCards;
  const MyCards({Key? key, required this.loyaltyCards}) : super(key: key);

  @override
  _MonoprixCardsState createState() => _MonoprixCardsState();
}

class _MonoprixCardsState extends State<MyCards> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorResources.getBackGroundColor(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            backButton("${"my_card".tr}", context),
            SizedBox(
              height: Constants.screenHeight * 0.1,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.screenWidth * 0.06, vertical: Constants.screenHeight * 0.01),
                child: Container(
                    height: Constants.screenHeight * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffebf0ec),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: BarcodeWidget(
                        data: '${widget.loyaltyCards.barCode}',
                        barcode: Barcode.code128(),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
