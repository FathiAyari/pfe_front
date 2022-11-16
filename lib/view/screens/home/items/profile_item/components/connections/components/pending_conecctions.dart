import 'package:basic_utils/basic_utils.dart';
import 'package:cypros_comparator/data/model/friend_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../services/connections_services.dart';
import '../../../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../../../util/color_resources.dart';

class PendingConnections extends StatefulWidget {
  const PendingConnections({Key? key}) : super(key: key);

  @override
  _PendingConnectionsState createState() => _PendingConnectionsState();
}

class _PendingConnectionsState extends State<PendingConnections> {
  var user = GetStorage().read("user");
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: ColorResources.getBackGroundColor(context),
        body: FutureBuilder(
            future: ConnectionsServices().getFriendsRequests(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<FriendRequest> friendRequests = [];
                snapshot.data.forEach((element) {
                  friendRequests.add(element);
                });

                if (friendRequests.length != 0) {
                  return ListView.builder(
                      itemCount: friendRequests.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Constants.screenHeight * 0.015, horizontal: Constants.screenWidth * 0.01),
                            child: Container(
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
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(Constants.screenHeight * 0.01),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xff5686E1).withOpacity(0.2), borderRadius: BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: EdgeInsets.all(Constants.screenHeight * 0.01),
                                            child: Image.asset(
                                              "assets/images/user.png",
                                              height: Constants.screenHeight * 0.05,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                StringUtils.capitalize("${friendRequests[index].sender.name}"),
                                                style: TextStyle(
                                                    color: ColorResources.darkModeSwitcher(context),
                                                    fontFamily: "NunitoBold",
                                                    fontSize: Constants.screenHeight * 0.02),
                                              ),
                                              Text(
                                                StringUtils.capitalize("${friendRequests[index].sender.lastName}"),
                                                style: TextStyle(
                                                    color: ColorResources.darkModeSwitcher(context),
                                                    fontFamily: "NunitoBold",
                                                    fontSize: Constants.screenHeight * 0.02),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // WillPop().showAlertDialog(context, "accept_friend_request".tr);

                                                    ConnectionsServices()
                                                        .acceptFriendRequest(
                                                            friendRequests[index].sender.id!, friendRequests[index].id)
                                                        .then((value) {
                                                      setState(() {});
                                                      if (value) {
                                                        Fluttertoast.showToast(
                                                            msg: "accepted".tr,
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
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Color(0xff3dc295), borderRadius: BorderRadius.circular(10)),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(5.0),
                                                        child: Text(
                                                          "accept_friend".tr,
                                                          style: TextStyle(color: Colors.white, fontFamily: "NunitoBold"),
                                                        ),
                                                      )),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    ConnectionsServices()
                                                        .deleteFriendRequest(friendRequests[index].id)
                                                        .then((value) {
                                                      setState(() {});
                                                      if (value) {
                                                        Fluttertoast.showToast(
                                                            msg: "deleted".tr,
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
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Color(0xfff563a2), borderRadius: BorderRadius.circular(10)),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Text(
                                                          "${"delete_friend".tr}",
                                                          style: TextStyle(color: Colors.white, fontFamily: "NunitoBold"),
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: Constants.screenWidth * 0.05),
                                    child: Text(
                                      "${"sent_at".tr} ${DateFormat("yyyy-MM-dd hh:mm").format(friendRequests[index].sentAt)}",
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
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
