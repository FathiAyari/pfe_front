import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../../../util/color_resources.dart';

Widget openMenuButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorResources.bottomNavigationBarColor(context)),
      child: IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: Icon(
          Icons.menu,
          color: ColorResources.searchIconColor(context),
        ),
      ),
    ),
  );
}
