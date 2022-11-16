import 'package:cypros_comparator/util/ConstraintsConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../../../util/color_resources.dart';
import '../ui_components/back_button.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  TextEditingController searchController = TextEditingController();
  bool visibleClearButton = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(() {
      setState(() {
        visibleClearButton = searchController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            backButton("${"search_for_friends".tr}", context),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.015),
              child: TextFormField(
                controller: searchController,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ), // OutlineInputBorder
                  filled: true,
                  fillColor: Color(0xff838edc),
                  hintText: "${"search".tr}",
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: Visibility(
                    visible: visibleClearButton,
                    child: IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ), //Icon
                ), // InputDecoration
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.015),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorResources.bottomNavigationBarColor(context),
                  ),
                  child: ListTile(
                    title: Container(
                      height: Constants.screenHeight * 0.1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(Constants.screenHeight * 0.01),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff5686E1).withOpacity(0.5), borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: EdgeInsets.all(Constants.screenHeight * 0.008),
                                child: Image.asset(
                                  "assets/images/user.png",
                                  height: Constants.screenHeight * 0.05,
                                  color: Color(0xff5686E1),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Melek Beldi",
                              style: TextStyle(
                                  color: Color(0xff5686E1), fontFamily: "NunitoBold", fontSize: Constants.screenHeight * 0.02),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "request_sent",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                            child: Container(
                                decoration: BoxDecoration(color: Color(0xff3dc295), borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
