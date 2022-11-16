import 'package:flutter/cupertino.dart';

import '../../../../../../../util/ConstraintsConstants.dart';

Container superMarketTab(double height, double width, String imagePath) {
  return Container(
      child: Image.asset(
    "$imagePath",
    height: Constants.screenHeight * height,
    width: Constants.screenHeight * width,
    fit: BoxFit.fill,
  ));
}
