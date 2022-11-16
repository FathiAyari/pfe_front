import 'package:cypros_comparator/data/model/ProductModel/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../util/color_resources.dart';

Positioned addProductButton(Product product, BuildContext context) {
  return Positioned(
    top: Constants.screenHeight * 0.176,
    left: 0,
    child: Container(
      height: Constants.screenHeight * 0.045,
      width: Constants.screenWidth * 0.11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff838edc).withOpacity(0.5),
      ),
      child: IconButton(
        onPressed: () {
          ShowBottomSheet(context);
        },
        icon: Icon(
          Icons.add,
          color: Color(0xff838edc),
        ),
      ),
    ),
  );
}

ShowBottomSheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
            height: Constants.screenHeight * 0.7,
            decoration: BoxDecoration(
                color: ColorResources.getBackGroundColor(context),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: Constants.screenHeight * 0.005,
                    width: Constants.screenWidth * 0.2,
                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorResources.bottomNavigationBarColor(context),
                            ),
                            height: Constants.screenHeight * 0.1,
                            child: Container(
                              height: Constants.screenHeight * 0.1,
                              color: ColorResources.bottomNavigationBarColor(context),
                              child: ListTile(
                                onTap: () {},
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/images/list.png",
                                      color: Color(0xff3dc295),
                                      height: Constants.screenHeight * 0.05,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Nom :Chats ",
                                            style: TextStyle(color: Color(0xff838edc), fontFamily: "NunitoBold"),
                                          ),
                                          Text(
                                            "Produits : 20",
                                            style: TextStyle(color: Color(0xff838edc), fontFamily: "NunitoBold"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.check_box_outline_blank_sharp)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ));
}
