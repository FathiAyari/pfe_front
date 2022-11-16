import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Stack notificationBottomItem() {
  return Stack(
    alignment: Alignment.topLeft,
    children: [
      Image.asset(
        "assets/images/notification.png",
      ),
      const Padding(
        padding: EdgeInsetsDirectional.only(top: 3, start: 3),
        child: CircleAvatar(
          radius: 3,
          backgroundColor: Colors.red,
        ),
      )
    ],
  );
}
