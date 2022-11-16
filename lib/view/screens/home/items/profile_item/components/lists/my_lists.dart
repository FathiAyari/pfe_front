/*
import 'package:basic_utils/basic_utils.dart';
import 'package:cypros_comparator/data/model/shopping_list.dart';
import 'package:cypros_comparator/services/connections_services.dart';
import 'package:cypros_comparator/services/shopping_lists_services.dart';
import 'package:cypros_comparator/util/ConstraintsConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../data/model/User.dart';
import '../../../../../../../util/color_resources.dart';
import '../ui_components/back_button.dart';

class MyLists extends StatefulWidget {
  const MyLists({Key? key}) : super(key: key);

  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyLists> with TickerProviderStateMixin {
  List<Color> colors = [
    Color(0xff3dc295),
  ];
  int color = 0;
  late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0)
      ..addListener(() {
        setState(() {
          color = _tabController.index;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorResources.searchIconColor(context),
            onPressed: () async {},
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          backgroundColor: ColorResources.getBackGroundColor(context),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                backButton("${"my_lists".tr}", context),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Container(
                    child: TabBar(
                      splashBorderRadius: BorderRadius.circular(20),
                      isScrollable: true,
                      unselectedLabelColor: Colors.blueAccent,
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff3dc295),
                      ),
                      controller: _tabController,
                      tabs: [
                        Container(
                            padding: EdgeInsets.only(
                              left: Constants.screenHeight * 0.009,
                              right: Constants.screenHeight * 0.009,
                              top: Constants.screenHeight * 0.009,
                              bottom: Constants.screenHeight * 0.009,
                            ),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: Text("pending".tr)),
                        Container(
                            padding: EdgeInsets.only(
                              left: Constants.screenHeight * 0.009,
                              right: Constants.screenHeight * 0.009,
                              top: Constants.screenHeight * 0.009,
                              bottom: Constants.screenHeight * 0.009,
                            ),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: Text("in_progress".tr)),
                        Container(
                            padding: EdgeInsets.only(
                              left: Constants.screenHeight * 0.009,
                              right: Constants.screenHeight * 0.009,
                              top: Constants.screenHeight * 0.009,
                              bottom: Constants.screenHeight * 0.009,
                            ),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: Text("done".tr)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: FutureBuilder(
                  future: ShoppingListsServices().getShoppingLists(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<ShoppingList> shoppingList = [];
                      snapshot.data.forEach((element) {
                        shoppingList.add(element);
                      });
                      if (shoppingList.length != 0) {
                        return ListView.builder(
                            itemCount: shoppingList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.015),
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
                                          onPressed: (context) {},
                                        ),
                                      ],
                                    ),
                                    endActionPane: ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          backgroundColor: Color(0xff838edc),
                                          foregroundColor: Colors.white,
                                          icon: Icons.send,
                                          label: "share".tr,
                                          onPressed: (BuildContext context) {
                                            ShowFriendsBottomSheet(context, shoppingList[index]);
                                          },
                                        ),
                                        SlidableAction(
                                          backgroundColor: Color(0xff3dc295),
                                          foregroundColor: Colors.white,
                                          icon: Icons.cancel,
                                          label: "cancel".tr,
                                          onPressed: (BuildContext context) {},
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      height: Constants.screenHeight * 0.1,
                                      color: ColorResources.bottomNavigationBarColor(context),
                                      child: ListTile(
                                        onTap: () {
                                          // Get.to(ListDetails());
                                        },
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
                                                children: [
                                                  Text(
                                                    "${"name".tr} : ${shoppingList[index].name} ",
                                                    style: TextStyle(
                                                        color: ColorResources.darkModeSwitcher(context),
                                                        fontFamily: "NunitoBold"),
                                                  ),
                                                  Text(
                                                    "${"products".tr} : ${shoppingList[index].items.length}",
                                                    style: TextStyle(
                                                        color: ColorResources.darkModeSwitcher(context),
                                                        fontFamily: "NunitoBold"),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(top: Constants.screenHeight * 0.2),
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Center(child: Lottie.asset("assets/images/empty.json"));
                              }),
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
              ],
            ),
          )),
    );
  }

  ShowFriendsBottomSheet(BuildContext context, ShoppingList shoppingList) {
    var user = GetStorage().read("user");
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
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
                  child: FutureBuilder(
                      future: ConnectionsServices().getFriends(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<User> friends = [];
                          snapshot.data.forEach((element) {
                            friends.add(element);
                          });
                          if (friends.length != 0) {
                            return ListView.builder(
                                itemCount: friends.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      ShoppingListsServices()
                                          .shareShoppingLists(shoppingList.id, friends[index].id!, user['id'])
                                          .then((value) {
                                        if (value) {
                                          Get.back();
                                        }
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Constants.screenHeight * 0.015, horizontal: Constants.screenWidth * 0.02),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: ColorResources.bottomNavigationBarColor(context),
                                          ),
                                          child: Container(
                                            height: Constants.screenHeight * 0.1,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Color(0xff3dc295).withOpacity(0.2),
                                                        borderRadius: BorderRadius.circular(15)),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Image.asset(
                                                        "assets/images/user.png",
                                                        color: Color(0xff3dc295),
                                                        height: Constants.screenHeight * 0.05,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "${StringUtils.capitalize(friends[index].name!)} ${friends[index].lastName!.toUpperCase()}",
                                                      style: TextStyle(
                                                          color: ColorResources.darkModeSwitcher(context),
                                                          fontFamily: "NunitoBold"),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
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
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ],
            ),
          );
        });
  }
}
*/
import 'package:cypros_comparator/util/ConstraintsConstants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../ui_components/back_button.dart';
import 'components/list_details.dart';

class MyLists extends StatefulWidget {
  const MyLists({Key? key}) : super(key: key);

  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyLists> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xfff1f5f6),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                backButton(tr("my_lists"), context),
                Expanded(
                  child: Container(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.015),
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
                                  label: tr('cancel'),
                                  onPressed: (BuildContext context) {},
                                ),
                                SlidableAction(
                                  backgroundColor: Color(0xfff563a2),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: tr('delete'),
                                  onPressed: (context) {},
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  backgroundColor: Color(0xff838edc),
                                  foregroundColor: Colors.white,
                                  icon: Icons.send,
                                  label: tr("share"),
                                  onPressed: (BuildContext context) {},
                                ),
                                SlidableAction(
                                  backgroundColor: Color(0xff3dc295),
                                  foregroundColor: Colors.white,
                                  icon: Icons.cancel,
                                  label: tr('cancel'),
                                  onPressed: (BuildContext context) {},
                                ),
                              ],
                            ),
                            child: Container(
                              height: Constants.screenHeight * 0.1,
                              color: Colors.grey.withOpacity(0.13),
                              child: ListTile(
                                onTap: () {
                                  Get.to(ListDetails());
                                },
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
                                            "Name:Dinner",
                                            style: TextStyle(color: Color(0xff838edc), fontFamily: "NunitoBold"),
                                          ),
                                          Text(
                                            "Items:20",
                                            style: TextStyle(color: Color(0xff838edc), fontFamily: "NunitoBold"),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
