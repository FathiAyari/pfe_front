import 'package:cypros_comparator/view/screens/home/items/profile_item/components/lists/components/shopping_assistance/shopping_assistance.dart';
import 'package:cypros_comparator/view/screens/home/items/profile_item/components/ui_components/back_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../../../../data/model/ProductModel/Product.dart';
import '../../../../../../../../util/ConstraintsConstants.dart';
import '../../../../../../../../util/app_constants.dart';
import '../../../../../../../../util/color_resources.dart';

class ListDetails extends StatefulWidget {
  const ListDetails({Key? key}) : super(key: key);

  @override
  _ListDetailsState createState() => _ListDetailsState();
}

class _ListDetailsState extends State<ListDetails> {
  Future<List<Product>> getProdcuts() async {
    var dio = Dio();
    Map<String, String> queryParams = {'page': '0'};
    var url = "${AppConstants.BASE_URL}${AppConstants.Products}";
    var request = await dio.get(url, queryParameters: queryParams);
    var result = request.data;

    List resultData = result["content"];
    List<Product> productsList = [];
    productsList.addAll(resultData.map((product) => Product.fromJson(product as Map<String, dynamic>)).toList());
    return productsList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorResources.getBackGroundColor(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: Color(0xff3dc295),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20)))),
        onPressed: () {
          Get.to(ShoppingAssistance());
        },
        icon: const ImageIcon(
          AssetImage('assets/images/basket.png'),
        ),
        label: Text("start_shopping".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            backButton("alimentaires de chats", context),
            Expanded(
                child: FutureBuilder(
              future: getProdcuts(),
              builder: (
                context,
                AsyncSnapshot snapshot,
              ) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListDetailsItem(
                          product: snapshot.data[index],
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ))
          ],
        ),
      ),
    ));
  }
}

class ListDetailsItem extends StatefulWidget {
  final Product product;

  const ListDetailsItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ListDetailsItem> {
  getProductBestPrice() {
    Product product = widget.product;
    List data = [];
    for (var i = 0; i < product.offers.length; i++) {
      data.add({
        "store": AppConstants.storeIdMarkets['${product.offers[i].storeId}'],
        "price": product.offers[i].priceList.last.amount
      });
    }
    data.sort((a, b) => a.price.compareTo(b.price));
    print(data.first);
    return data.first;
  }

  int quantity = 1;
  @override
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
              label: "${"cancel".tr}",
              onPressed: (BuildContext context) {},
            ),
            SlidableAction(
              backgroundColor: Color(0xfff563a2),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: "${"delete".tr}",
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
                  color: ColorResources.bottomNavigationBarColor(context),
                  child: Padding(
                    padding: EdgeInsets.only(left: Constants.screenWidth * 0.15, right: Constants.screenWidth * 0.06),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "${widget.product.name}",
                              style: TextStyle(fontFamily: "NunitoBold", color: Colors.black54),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                  child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Image.asset(
                                      "assets/images/${getProductBestPrice()["store"]}.png".toLowerCase(),
                                    ),
                                    height: Constants.screenHeight * 0.035,
                                  ),
                                  Text(
                                    "${(getProductBestPrice()["price"] * quantity).toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: Constants.screenHeight * 0.02,
                                      fontFamily: "NunitoBold",
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    "TND ",
                                    style: TextStyle(
                                      fontSize: Constants.screenHeight * 0.015,
                                      fontFamily: "NunitoBold",
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              )),
                            ),
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
                      "${widget.product.image}",
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -20,
                top: 19,
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.1,
                      blurRadius: 1,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ], color: ColorResources.bottomNavigationBarColor(context), borderRadius: BorderRadius.circular(15)),
                  width: Constants.screenWidth * 0.13,
                  height: Constants.screenHeight * 0.11,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: Image.asset(
                              "assets/images/plus.png",
                              height: Constants.screenHeight * 0.03,
                            )),
                      ),
                      Text(
                        "$quantity",
                        style: TextStyle(fontFamily: "NunitoBold"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GestureDetector(
                            onTap: () {
                              if (quantity.isGreaterThan(1)) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                            child: Image.asset(
                              "assets/images/minus.png",
                              height: Constants.screenHeight * 0.03,
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
    );
  }
}
