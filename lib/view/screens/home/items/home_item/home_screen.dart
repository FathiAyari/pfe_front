import 'package:cypros_comparator/util/app_constants.dart';
import 'package:cypros_comparator/view/screens/home/items/home_item/product_details/product_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../data/model/ProductModel/Product.dart';
import '../../../../../util/ConstraintsConstants.dart';
import '../../../../../util/color_resources.dart';
import 'components/add_product_button.dart';
import 'components/loadingLottie.dart';
import 'components/open_menu_button.dart';
import 'components/save_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productsList = [];
  int currentPageIndex = 0;
  bool switchToList = false;
  bool resetButton = false;
  bool searchVisiblity = false;
  int initialPage = 0;
  bool visibleClearButton = false;
  bool loading = false;
  bool gridViewDisplay = true;

  ScrollController _controller = ScrollController();
  TextEditingController searchController = TextEditingController();

  Future getProdcuts() async {
    setState(() {
      loading = true;
    });
    var dio = Dio();
    Map<String, String> queryParams = {'size': '50', 'page': '${initialPage}'};
    var url = "${AppConstants.BASE_URL}${AppConstants.Products}";
    var request = await dio.get(url, queryParameters: queryParams);
    var result = request.data;

    List resultData = result["content"];

    productsList.addAll(resultData.map((product) => Product.fromJson(product as Map<String, dynamic>)).toList());

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    searchController.dispose();
  }

  @override
  void initState() {
    super.initState();
    getProdcuts();
    searchController.addListener(() {
      setState(() {
        visibleClearButton = searchController.text.isNotEmpty;
      });
    });
    _controller.addListener(() {
      searchVisiblity = false;
      if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
        setState(() {
          initialPage++;
        });
        getProdcuts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: ColorResources.getBackGroundColor(context),
        elevation: 0,
        leading: openMenuButton(context),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorResources.bottomNavigationBarColor(context)),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    searchVisiblity = !searchVisiblity;
                  });
                },
                icon: searchVisiblity
                    ? Icon(
                        Icons.close,
                        color: ColorResources.closeSerachFieldIconColor(context),
                      )
                    : Icon(
                        Icons.search,
                        color: ColorResources.searchIconColor(context),
                      ),
              ),
            ),
          ),
          changeDisplay(context),
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        color: ColorResources.getBackGroundColor(context),
        height: Constants.screenHeight,
        child: Column(
          children: [
            SizedBox(
              height: Constants.screenHeight * 0.04,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 600),
              height: searchVisiblity ? Constants.screenHeight * 0.1 : 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: searchVisiblity,
                  child: Row(
                    children: [
                      Expanded(
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
                            fillColor: ColorResources.searchFieldColor(context),
                            hintText: "Search",
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
                      SizedBox(
                        width: Constants.screenWidth * 0.03,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorResources.searchFieldColor(context), borderRadius: BorderRadius.circular(15)),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.filter_list_alt,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: productsList.isNotEmpty
                  ? (gridViewDisplay
                      ? Stack(
                          children: [
                            RawScrollbar(
                              controller: _controller,
                              thumbColor: Colors.blueAccent,
                              radius: Radius.circular(20),
                              thickness: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                    itemCount: productsList.length,
                                    controller: _controller,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
                                    itemBuilder: (BuildContext context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Get.to(ProductDetails(product: productsList[index]));
                                        },
                                        child: Container(
                                          child: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                        child: Hero(
                                                      tag: productsList[index].id,
                                                      child: Image.network(
                                                        "${productsList[index].image}",
                                                      ),
                                                    )),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding: EdgeInsets.all(Constants.screenHeight * 0.001),
                                                            child: Container(
                                                              child: Text(
                                                                "${productsList[index].name}",
                                                                style: TextStyle(
                                                                    color: Colors.black.withOpacity(0.8),
                                                                    fontFamily: "SourceSansPro",
                                                                    fontSize: Constants.screenHeight * 0.02),
                                                                maxLines: 2,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5, top: 5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            child: Container(
                                                              decoration: const BoxDecoration(
                                                                  color: Colors.green,
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius.circular(20),
                                                                      bottomRight: Radius.circular(15))),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(3.0),
                                                                child: Text(
                                                                  "${productsList[index].offers[0].priceList[0].amount} TND",
                                                                  style: const TextStyle(
                                                                      color: Colors.white,
                                                                      fontFamily: "NunitoBold",
                                                                      fontSize: 17),
                                                                ),
                                                              ),
                                                            ),
                                                            alignment: Alignment.topRight,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              addProductButton(productsList[index], context),
                                              SaveItem(productsList[index]),
                                            ],
                                          ),
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            if (loading) ...[
                              loadingLottie(),
                            ],
                            // return to the top of listView
                            /*     topReturnButton(resetButton, _scrollTop)*/
                          ],
                        )
                      : ListView.builder(itemBuilder: (context, index) {
                          return Container();
                        }))
                  : Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }

  Padding changeDisplay(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorResources.bottomNavigationBarColor(context)),
        child: IconButton(
          onPressed: () {
            setState(() {
              gridViewDisplay = !gridViewDisplay;
            });
          },
          icon: Icon(
            gridViewDisplay ? Icons.grid_view : Icons.format_list_bulleted,
            color: ColorResources.searchIconColor(context),
          ),
        ),
      ),
    );
  }
}

/* child: ListView.builder(
                      controller: _controller,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: Constants.screenHeight * 0.242,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.network(
                                        "${Product.fromJson(data[index]).image}"),
                                  )
                                  /* Text("${Product.fromJson(data[index]).name}"),*/
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffe3eaef),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        );
                      }),*/
