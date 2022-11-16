import 'package:cypros_comparator/data/model/loyalty_cards/loyalty_cards.dart';
import 'package:cypros_comparator/view/components/will_pop.dart';
import 'package:cypros_comparator/view/screens/home/items/profile_item/components/cards/components/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';
import 'package:ndialog/ndialog.dart';

import '../../../../../../../services/loyalty_cards_services.dart';
import '../../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../../util/color_resources.dart';
import '../ui_components/back_button.dart';

class MyLoyaltyCards extends StatefulWidget {
  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyLoyaltyCards> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<LoyaltyCards> loyaltyCards = [];
  getLoyalCards() {
    LoyaltyCardsServices().getLoyaltyCards().then((value) {
      setState(() {
        loyaltyCards = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        setState(() {});
      },
      child: SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: ColorResources.getBackGroundColor(context),
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorResources.searchIconColor(context),
              onPressed: () async {
                await WillPop().showAddCardDialog(context, () {
                  setState(() {});
                });
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  backButton("${"my_cards".tr}", context),
                  Expanded(
                    child: FutureBuilder(
                      future: LoyaltyCardsServices().getLoyaltyCards(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<LoyaltyCards> loyaltyCards = [];
                          snapshot.data.forEach((element) {
                            loyaltyCards.add(element);
                          });
                          if (loyaltyCards.length != 0) {
                            return ListView.builder(
                                itemCount: loyaltyCards.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.01),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
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
                                                  icon: Icons.delete,
                                                  label: "delete".tr,
                                                  onPressed: (ctx) {
                                                    NAlertDialog(
                                                      title: WillPopTitle("confirm_delete_card".tr, context),
                                                      actions: [
                                                        Negative(),
                                                        Positive(() {
                                                          LoyaltyCardsServices()
                                                              .deleteLoyaltyCard(loyaltyCards[index].id)
                                                              .then((value) {
                                                            Fluttertoast.showToast(
                                                                msg: "card_deleted".tr,
                                                                toastLength: Toast.LENGTH_SHORT,
                                                                gravity: ToastGravity.BOTTOM,
                                                                timeInSecForIosWeb: 1,
                                                                backgroundColor: Colors.grey,
                                                                textColor: Colors.white,
                                                                fontSize: 16.0);
                                                          });
                                                          Navigator.of(context).pop();
                                                          setState(() {});
                                                        })
                                                      ],
                                                      blur: 2,
                                                    ).show(context, transitionType: DialogTransitionType.Bubble);
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: LoyaltyCard(loyaltyCards: loyaltyCards[index]))),
                                  );
                                });
                          }
                          return Padding(
                            padding: EdgeInsets.only(top: Constants.screenHeight * 0.2),
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Center(child: Lottie.asset("assets/images/empty.json"));
                                }),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
