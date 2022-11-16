import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../util/ConstraintsConstants.dart';

Positioned topReturnButton(bool resetButton, Function() press) {
  return Positioned(
    right: 5,
    bottom: 5,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: resetButton ? Constants.screenHeight * 0.1 : 0,
      width: resetButton ? Constants.screenWidth * 0.15 : 0,
      child: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        child: Icon(
          Icons.keyboard_arrow_up_outlined,
          color: Colors.white,
        ),
        onPressed: press,
      ),
    ),
  );
}
