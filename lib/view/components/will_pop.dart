import 'package:cypros_comparator/provider/theme_provider.dart';
import 'package:cypros_comparator/services/loyalty_cards_services.dart';
import 'package:cypros_comparator/util/app_constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:slidable_button/slidable_button.dart';

import '../../util/ConstraintsConstants.dart';
import '../../util/color_resources.dart';
import '../screens/auth_screens/components/input_field.dart';

class WillPop {
  showAlertDialog(BuildContext context, String title) {
    NAlertDialog(
      title: WillPopTitle(title, context),
      actions: [Negative(), Positive(() {})],
      blur: 2,
    ).show(context, transitionType: DialogTransitionType.Bubble);
  }

  showAddCardDialog(BuildContext context, Function() onPressed) {
    String? barCodeResult;
    bool doneBarCode = false;
    TextEditingController cardNameController = TextEditingController();
    final List items = [
      {
        "storeId": 0,
        "storName": AppConstants.storeIdMarkets['0'],
      },
      {
        "storeId": 1,
        "storName": AppConstants.storeIdMarkets['1'],
      },
      {
        "storeId": 2,
        "storName": AppConstants.storeIdMarkets['2'],
      },
      {
        "storeId": 3,
        "storName": AppConstants.storeIdMarkets['3'],
      },
    ];
    String? selectedValue;
    bool loading = false;
    bool done = false;

    Map<String, String> addCardResult = {};
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: ColorResources.getBackGroundColor(context),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: Text(
                "add_card_title".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorResources.inputFieldsColor(context),
                ),
              ),
              content: Container(
                height: Constants.screenHeight * 0.3,
                child: !done
                    ? Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: Constants.screenHeight * 0.01,
                            ),
                            child: InputField(cardNameController, Icons.credit_card_outlined, "card_name".tr, context),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  Icon(
                                    Icons.list,
                                    size: 16,
                                    color: ColorResources.inputFieldsColor(context),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'store'.tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorResources.inputFieldsColor(context),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item['storeId'].toString(),
                                        child: Text(
                                          item['storName'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: ColorResources.inputFieldsColor(context),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: ColorResources.inputFieldsColor(context),
                              iconDisabledColor: Colors.grey,
                              buttonHeight: Constants.screenHeight * 0.075,
                              buttonWidth: Constants.screenWidth * 0.6,
                              buttonPadding: const EdgeInsets.only(top: 14, left: 14, bottom: 14),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: ColorResources.bottomNavigationBarColor(context),
                              ),
                              buttonElevation: 1,
                              itemHeight: 40,
                              itemPadding: const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 200,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(15, 0),
                            ),
                          ),
                          SizedBox(
                            height: Constants.screenHeight * 0.022,
                          ),
                          barCodeResult == null || barCodeResult == "-1"
                              ? Container(
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                        left: Constants.screenWidth * 0.022,
                                        right: Constants.screenWidth * 0.022,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        child: SlidableButton(
                                          isRestart: true,
                                          completeSlideAt: 0.1,
                                          borderRadius: BorderRadius.circular(15),
                                          buttonWidth: Constants.screenWidth * 0.6,
                                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                                          buttonColor: Theme.of(context).primaryColor,
                                          dismissible: false,
                                          label: Center(
                                              child:
                                                  Lottie.asset('assets/images/scan.json', height: Constants.screenHeight * 0.5)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Theme.of(context).primaryColor,
                                                ),
                                              )
                                            ],
                                          ),
                                          onChanged: (position) async {
                                            try {
                                              String scanResult = await FlutterBarcodeScanner.scanBarcode(
                                                  "#ff6666", "${"cancel".tr}", true, ScanMode.BARCODE);
                                              setState(() {
                                                barCodeResult = scanResult;
                                              });
                                            } on PlatformException {
                                              setState(() {
                                                barCodeResult = "-1";
                                              });
                                            }
                                          },
                                          height: Constants.screenHeight * 0.06,
                                        ),
                                      )),
                                )
                              : Column(
                                  children: [
                                    Text("${barCodeResult}"),
                                    !loading
                                        ? Container(
                                            width: Constants.screenWidth * 0.6,
                                            height: Constants.screenHeight * 0.07,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                    primary: Colors.indigo),
                                                onPressed: () async {
                                                  if (selectedValue != null && cardNameController.text.isNotEmpty) {
                                                    setState(() {
                                                      loading = true;
                                                    });
                                                    LoyaltyCardsServices()
                                                        .createLoyaltyCard(
                                                            cardNameController.text, barCodeResult!, int.parse(selectedValue!))
                                                        .then((value) {
                                                      if (value) {
                                                        setState(() {
                                                          loading = false;
                                                          done = true;
                                                          addCardResult = AppConstants.addCardSuccess;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          loading = false;
                                                          done = true;
                                                          addCardResult = AppConstants.addCardFailed;
                                                        });
                                                      }
                                                      onPressed();
                                                    });
                                                  }
                                                },
                                                child: Text(
                                                  "add".tr,
                                                  style: TextStyle(fontFamily: "NunitoBold"),
                                                )),
                                          )
                                        : Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                  ],
                                )
                        ],
                      )
                    : doneAddCard(addCardResult: addCardResult),
              ),
            );
          });
        });
  }
}

WillPopTitle(String title, BuildContext context) {
  return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
    return Column(
      children: [
        Image.asset(
          "assets/images/dexclamation.png",
          height: Constants.screenHeight * 0.06,
          color: ColorResources.getALertTextColor(context),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: ColorResources.getALertTextColor(context),
            fontFamily: "NunitoBold",
          ),
        ),
      ],
    );
  });
}

Widget Positive(VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xfff563a2),
      ),
      child: Container(
        height: 20,
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              "${"yes".tr}",
              style: TextStyle(
                fontFamily: "NunitoBold",
                color: Color(0xffEAEDEF),
              ),
            )),
      ),
    ),
  );
}

Widget Negative() {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff3dc295),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "${"no".tr}",
              style: TextStyle(
                fontFamily: "NunitoBold",
                color: Color(0xffEAEDEF),
              ),
            )),
      ),
    );
  });
}

class doneAddCard extends StatefulWidget {
  final Map addCardResult;
  const doneAddCard({Key? key, required this.addCardResult}) : super(key: key);

  @override
  _doneAddCardState createState() => _doneAddCardState();
}

class _doneAddCardState extends State<doneAddCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(widget.addCardResult['image'], height: Constants.screenHeight * 0.1, repeat: false),
        Text(
          "${widget.addCardResult['label']}",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "NunitoBold", color: ColorResources.inputFieldsColor(context), fontSize: Constants.screenHeight * 0.02),
        ),
        SizedBox(
          height: Constants.screenHeight * 0.08,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {
              setState(() {});
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("close".tr),
            ))
      ],
    );
  }
}
