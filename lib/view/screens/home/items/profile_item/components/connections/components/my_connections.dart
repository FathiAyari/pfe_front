import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';
import 'package:ndialog/ndialog.dart';

import '../../../../../../../../data/model/User.dart';
import '../../../../../../../../services/connections_services.dart';
import '../../../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../../../util/color_resources.dart';
import '../../../../../../../components/will_pop.dart';

class Myconnections extends StatefulWidget {
  const Myconnections({Key? key}) : super(key: key);

  @override
  _MyconnectionsState createState() => _MyconnectionsState();
}

class _MyconnectionsState extends State<Myconnections> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        setState(() {});
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorResources.getBackGroundColor(context),
          body: FutureBuilder(
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
                                    spacing: 1,
                                    onPressed: (BuildContext context) {},
                                  ),
                                  SlidableAction(
                                    backgroundColor: Color(0xfff563a2),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: "delete".tr,
                                    onPressed: (ctx) {
                                      NAlertDialog(
                                        title: WillPopTitle("delete_friend_alert".tr, context),
                                        actions: [
                                          Negative(),
                                          Positive(() {
                                            ConnectionsServices().deleteFriend(friends[index].id!).then((value) {
                                              setState(() {});
                                              if (value) {
                                                Fluttertoast.showToast(
                                                    msg: "deleted_friend".tr,
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.grey,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg: "failed".tr,
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.grey,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
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
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorResources.bottomNavigationBarColor(context),
                                ),
                                child: ExpansionTile(
                                  expandedAlignment: Alignment.topLeft,
                                  title: Container(
                                    height: Constants.screenHeight * 0.1,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xff3dc295).withOpacity(0.2), borderRadius: BorderRadius.circular(15)),
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
                                                color: ColorResources.darkModeSwitcher(context), fontFamily: "NunitoBold"),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  children: [
                                    Text(
                                      "${"email".tr} : ${friends[index].email}",
                                      style: TextStyle(
                                          color: ColorResources.darkModeSwitcher(context),
                                          fontFamily: "NunitoBold",
                                          fontSize: Constants.screenHeight * 0.02),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: Constants.screenWidth * 0.05),
                                      child: Text(
                                        "${"phone_number".tr} : ${friends[index].phone}",
                                        style: TextStyle(
                                            color: ColorResources.darkModeSwitcher(context),
                                            fontFamily: "NunitoBold",
                                            fontSize: Constants.screenHeight * 0.02),
                                      ),
                                    ),
                                  ],
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
          ),
        ),
      ),
    );
  }
}
