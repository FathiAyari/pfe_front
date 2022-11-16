import 'package:cypros_comparator/view/screens/home/items/profile_item/components/ui_components/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../../util/color_resources.dart';
import 'components/my_connections.dart';
import 'components/pending_conecctions.dart';

class Connections extends StatefulWidget {
  const Connections({Key? key}) : super(key: key);

  @override
  _ConnectionsState createState() => _ConnectionsState();
}

class _ConnectionsState extends State<Connections> with TickerProviderStateMixin {
  int color = 0;
  late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0)
      ..addListener(() {
        setState(() {
          color = _tabController.index;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorResources.getBackGroundColor(context),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                backButton("${'connections'.tr}", context),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Container(
                    child: TabBar(
                      labelColor: Colors.white,
                      splashBorderRadius: BorderRadius.circular(20),
                      isScrollable: true,
                      unselectedLabelColor: Colors.blueAccent,
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
                            child: Text("my_friends_list".tr)),
                        Container(
                            padding: EdgeInsets.only(
                              left: Constants.screenHeight * 0.009,
                              right: Constants.screenHeight * 0.009,
                              top: Constants.screenHeight * 0.009,
                              bottom: Constants.screenHeight * 0.009,
                            ),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "friends_requests".tr,
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  controller: _tabController,
                  children: [
                    Myconnections(),
                    PendingConnections(),
                  ],
                )),
              ],
            ),
          )),
    );
  }
}
