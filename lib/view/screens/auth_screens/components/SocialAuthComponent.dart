import 'package:flutter/material.dart';

import '../../../../../util/ConstraintsConstants.dart';

InkWell SocialAuth(String image, Function() tap) {
  return InkWell(
    onTap: tap,
    child: Padding(
      padding: EdgeInsets.all(
        Constants.screenHeight * 0.01,
      ),
      child: Container(
          height: Constants.screenHeight * 0.07,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(
              Constants.screenHeight * 0.01,
            ),
            child: Image.asset("$image"),
          )),
    ),
  );
}
