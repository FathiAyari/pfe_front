import 'package:cypros_comparator/data/model/loyalty_cards/loyalty_cards.dart';
import 'package:cypros_comparator/util/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../../../util/color_resources.dart';
import 'my_cards.dart';

class LoyaltyCard extends StatelessWidget {
  final LoyaltyCards loyaltyCards;

  const LoyaltyCard({required this.loyaltyCards});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.13), borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        onTap: () {
          Get.to(MyCards(
            loyaltyCards: loyaltyCards,
          ));
        },
        title: Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                "${AppConstants.superMarketLogos[loyaltyCards.storeId]}",
                height: Constants.screenHeight * 0.07,
                width: Constants.screenWidth * 0.3,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: ColorResources.searchIconColor(context),
            ),
          ],
        ),
      ),
    );
  }
}
