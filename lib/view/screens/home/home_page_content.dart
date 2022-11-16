import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:cypros_comparator/util/ConstraintsConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/app_constants.dart';
import '../../../util/color_resources.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(child: Container(child: AppConstants.pages[currentPageIndex])),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.02),
            child: Container(
              width: double.infinity,
              height: Constants.screenHeight * 0.07,
              child: Container(
                color: Colors.transparent,
                child: CustomNavigationBar(
                  strokeColor: Color(0xff04BF20),
                  unSelectedColor: ColorResources.unSelecteNavigationItemdColor(context),
                  selectedColor: ColorResources.selecteNavigationItemdColor(context),
                  items: AppConstants.customNavigationBarItem,
                  currentIndex: currentPageIndex,
                  borderRadius: Radius.circular(20),
                  isFloating: true,
                  backgroundColor: ColorResources.bottomNavigationBarColor(context),
                  onTap: (index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
