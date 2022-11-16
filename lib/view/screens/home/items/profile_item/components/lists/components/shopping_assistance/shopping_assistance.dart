import 'package:cypros_comparator/util/color_resources.dart';
import 'package:cypros_comparator/view/screens/home/items/profile_item/components/cards/components/alertTask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ndialog/ndialog.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../../../components/will_pop.dart';

class ShoppingAssistance extends StatefulWidget {
  const ShoppingAssistance({Key? key}) : super(key: key);

  @override
  _ShoppingAssistanceState createState() => _ShoppingAssistanceState();
}

class _ShoppingAssistanceState extends State<ShoppingAssistance> {
  Future<bool> avoidReturnButton() async {
    NAlertDialog(
      title: WillPopTitle("want_exit".tr, context),
      actions: [
        Negative(),
        Positive(() {
          Get.back();
          Get.back();
        })
      ],
      blur: 2,
    ).show(context, transitionType: DialogTransitionType.Bubble);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: avoidReturnButton,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorResources.getBackGroundColor(context),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.05),
                  child: LinearPercentIndicator(
                    width: Constants.screenWidth * 0.9,
                    barRadius: Radius.circular(20),
                    lineHeight: 20,
                    percent: 0,
                    widgetIndicator: Transform.translate(
                        offset: Offset(-10, -Constants.screenHeight * 0.03),
                        child: Image.asset(
                          "assets/images/marker.png",
                          height: Constants.screenHeight * 0.035,
                          color: Color(0xff3dc295),
                        )),
                    animateFromLastPercent: true,
                    backgroundColor: Color(0xfff563a2),
                    progressColor: Color(0xff3dc295),
                    center: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        "0/20dt",
                        style: TextStyle(fontFamily: "NunitoBold", color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: index == 1 ? Colors.red.withOpacity(0.5) : Colors.green.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Slidable(
                                    key: ValueKey(1),
                                    startActionPane: ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          backgroundColor: Color(0xff3dc295),
                                          foregroundColor: Colors.white,
                                          icon: Icons.cancel,
                                          label: "cancel".tr,
                                          onPressed: (BuildContext context) {},
                                        ),
                                        SlidableAction(
                                          backgroundColor: Color(0xfff563a2),
                                          foregroundColor: Colors.white,
                                          icon: Icons.done,
                                          label: "delete".tr,
                                          onPressed: (context) {},
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Constants.screenHeight * 0.01,
                                        horizontal: Constants.screenWidth * 0.08,
                                      ),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          ClipRRect(
                                            child: Container(
                                              width: double.infinity,
                                              height: Constants.screenHeight * 0.15,
                                              color: Colors.white,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: Constants.screenWidth * 0.13, right: Constants.screenWidth * 0.09),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Litière minérale Absorbante TAY-CAT",
                                                      style: TextStyle(
                                                          decorationThickness: 6,
                                                          fontFamily: "NunitoBold",
                                                          color: Colors.black54),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(3.0),
                                                        child: Container(
                                                            child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              "15.3 ",
                                                              style: TextStyle(
                                                                fontSize: Constants.screenHeight * 0.02,
                                                                fontFamily: "NunitoBold",
                                                                color: Color(0xffeb394d),
                                                              ),
                                                            ),
                                                            Text(
                                                              "TND ",
                                                              style: TextStyle(
                                                                fontSize: Constants.screenHeight * 0.015,
                                                                fontFamily: "NunitoBold",
                                                                color: Color(0xffeb394d),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          Positioned(
                                            left: -30,
                                            top: 25,
                                            child: Container(
                                              decoration: BoxDecoration(boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 0.8,
                                                  blurRadius: 1,
                                                  offset: Offset(0, 2), // changes position of shadow
                                                ),
                                              ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                              width: Constants.screenWidth * 0.17,
                                              height: Constants.screenHeight * 0.08,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Image.network(
                                                  "https://animalzone.tn/1511-side_product_default/tay-cat-10l-tunisie.webp",
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: -20,
                                            top: 22,
                                            child: Container(
                                              decoration: BoxDecoration(boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 0.1,
                                                  blurRadius: 1,
                                                  offset: Offset(0, 2), // changes position of shadow
                                                ),
                                              ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                              width: Constants.screenWidth * 0.1,
                                              height: Constants.screenHeight * 0.1,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(3.0),
                                                    child: GestureDetector(
                                                        onTap: () {},
                                                        child: Image.asset(
                                                          "assets/images/plus.png",
                                                          height: Constants.screenHeight * 0.027,
                                                        )),
                                                  ),
                                                  Text(
                                                    "2",
                                                    style: TextStyle(fontFamily: "NunitoBold"),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(3.0),
                                                    child: GestureDetector(
                                                        onTap: () {},
                                                        child: Image.asset(
                                                          "assets/images/minus.png",
                                                          height: Constants.screenHeight * 0.027,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xfff563a2),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              avoidReturnButton();
                            },
                            icon: const ImageIcon(
                              AssetImage(
                                'assets/images/cross-circle.png',
                              ),
                            ),
                            label: Text("finish".tr),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff838edc),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                            onPressed: () async {
                              try {
                                String scanResult =
                                    await FlutterBarcodeScanner.scanBarcode("#ff6666", "${"cancel".tr}", true, ScanMode.BARCODE);
                                print(scanResult);
                                return alertTask(
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                  action: "${"close".tr}",
                                  lottieFile: "assets/images/success.json",
                                  message: 'Prdouit ajouté avec succès',
                                ).show(context);
                              } on PlatformException {
                                print('failed');
                              }
                            },
                            icon: const ImageIcon(
                              AssetImage(
                                'assets/images/barcode-scan.png',
                              ),
                            ),
                            label: Text("scan".tr),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
