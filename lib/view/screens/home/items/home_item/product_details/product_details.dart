import 'package:barcode_widget/barcode_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cypros_comparator/data/model/ProductModel/Product.dart';
import 'package:cypros_comparator/util/ConstraintsConstants.dart';
import 'package:cypros_comparator/util/app_constants.dart';
import 'package:cypros_comparator/view/screens/home/items/home_item/product_details/components/close_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../util/color_resources.dart';
import '../components/add_product_button.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> with TickerProviderStateMixin {
  late TabController _tabController;

  int color = 0;
  ScrollController scrollController = ScrollController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  List<int> getAvaliableStores() {
    List<int> stores = [];
    widget.product.offers.forEach((store) {
      stores.add(store.storeId);
    });
    print(stores);
    return stores;
  }

  void initState() {
    getAvaliableStores();
    super.initState();
    _tabController = TabController(length: getAvaliableStores().length, vsync: this, initialIndex: 0)
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
        floatingActionButton: AddProductToList(),
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: Constants.screenHeight,
                  width: double.infinity,
                  child: Hero(
                      tag: "${widget.product.id}",
                      child: Image.network(
                        "${widget.product.image}",
                      )),
                ),
              ),
              closeButton(),
              Container(
                decoration: BoxDecoration(
                    color: ColorResources.getBackGroundColor(context),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                margin: EdgeInsets.only(
                  top: Constants.screenHeight * 0.25,
                ),
                padding: EdgeInsets.only(
                    top: Constants.screenHeight * 0.01, right: Constants.screenWidth * 0.03, left: Constants.screenWidth * 0.03),
                child: RawScrollbar(
                  thumbColor: Colors.blueAccent,
                  thickness: 3,
                  radius: Radius.circular(20),
                  controller: scrollController,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Constants.screenHeight * 0.03,
                          ),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: Constants.screenWidth * 0.06,
                                      ),
                                      child: Text(
                                        "${widget.product.name}",
                                        style: TextStyle(
                                            color: ColorResources.getTextColor(context),
                                            fontFamily: "NunitoBold",
                                            fontSize: Constants.screenHeight * 0.02),
                                      ),
                                    ),
                                  )),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    decoration: BoxDecoration(
                                        color: Color(0xff42b95e),
                                        borderRadius:
                                            BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                          child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "15.3 ",
                                            style: TextStyle(
                                              fontSize: Constants.screenHeight * 0.02,
                                              fontFamily: "NunitoBold",
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "TND ",
                                            style: TextStyle(
                                              fontSize: Constants.screenHeight * 0.015,
                                              fontFamily: "NunitoBold",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Constants.screenWidth * 0.06,
                          ),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: ReadMoreText(
                              '${widget.product.description}',
                              trimLines: 2,
                              style: TextStyle(color: ColorResources.getTextColor(context), fontFamily: "SourceSansPro"),
                              colorClickableText: Colors.blueAccent,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: "${"show_more".tr}",
                              trimExpandedText: "${"see_less".tr}",
                            ),
                          ),
                        ),
                        widget.product.barCode.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.015),
                                child: Container(
                                    height: Constants.screenHeight * 0.09,
                                    width: Constants.screenWidth * 0.5,
                                    child: BarcodeWidget(
                                      color: ColorResources.getTextColor(context),
                                      data: '${widget.product.barCode}',
                                      barcode: Barcode.code128(),
                                    )),
                              )
                            : Container(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Constants.screenWidth * 0.06,
                                        right: Constants.screenWidth * 0.06,
                                        top: Constants.screenHeight * 0.023,
                                        bottom: Constants.screenHeight * 0.023),
                                    child: Container(
                                      width: double.infinity,
                                      child: SlidableButton(
                                        isRestart: true,
                                        completeSlideAt: 0.1,
                                        borderRadius: BorderRadius.circular(30),
                                        width: MediaQuery.of(context).size.width / 3,
                                        buttonWidth: Constants.screenWidth * 0.6,
                                        color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                                        buttonColor: Theme.of(context).primaryColor,
                                        dismissible: false,
                                        label: Center(
                                            child: Lottie.asset('assets/images/scan.json', height: Constants.screenHeight * 0.5)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(right: Constants.screenWidth * 0.02),
                                              child: Text(
                                                "${"scan_barcode".tr}",
                                                style: TextStyle(
                                                    color: ColorResources.getTextColor(context),
                                                    fontSize: Constants.screenHeight * 0.02,
                                                    fontFamily: "SourceSansPro"),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Theme.of(context).primaryColor,
                                              ),
                                            )
                                          ],
                                        ),
                                        onChanged: (position) {},
                                        height: Constants.screenHeight * 0.06,
                                      ),
                                    )),
                              ),
                        Padding(
                          padding: EdgeInsets.only(top: Constants.screenHeight * 0.01, bottom: Constants.screenHeight * 0.01),
                          child: Container(
                            child: TabBar(
                              isScrollable: true,
                              unselectedLabelColor: Colors.blueAccent,
                              labelPadding: EdgeInsets.symmetric(horizontal: Constants.screenWidth * 0.021),
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorResources.getTabsColor(context),
                              ),
                              controller: _tabController,
                              tabs: getAvaliableStores().map((storeId) {
                                return AppConstants.superMarketTabs[storeId];
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                          height: Constants.screenHeight * 0.4,
                          child: TabBarView(
                            controller: _tabController,
                            children: getAvaliableStores().map((storeId) {
                              return ChartWidget(
                                product: widget.product,
                                storeId: storeId,
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: Constants.screenHeight * 0.1),
                          child: CarouselSlider(
                            options: CarouselOptions(
                                autoPlay: true, autoPlayInterval: Duration(seconds: 7), height: Constants.screenHeight * 0.15),
                            items: [1, 2, 3, 4, 5].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: Constants.screenWidth * 0.8,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container AddProductToList() {
    return Container(
      width: Constants.screenWidth * 0.8,
      height: Constants.screenHeight * 0.06,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xff42b95e),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18), bottomRight: Radius.circular(18), bottomLeft: Radius.circular(18)))),
          onPressed: () {
            ShowBottomSheet(context);
          },
          child: Text(
            "${"add_product_to_list".tr}",
            style: TextStyle(fontFamily: "NunitoBold"),
          )),
    );
  }
}

class ChartWidget extends StatefulWidget {
  final Product product;
  final int storeId;
  ChartWidget({
    Key? key,
    required this.product,
    required this.storeId,
  });

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      header: "",
    );
    super.initState();
  }

  getProductOffersData() {
    List<ChartData> chartData = <ChartData>[];
    for (int i = 0; i < widget.product.offers.length; i++) {
      if (widget.product.offers[i].storeId == widget.storeId) {
        for (int j = 0; j < widget.product.offers[i].priceList.length; j++) {
          chartData.add(
            ChartData(
                date: widget.product.offers[i].priceList[j].creationDate, price: widget.product.offers[i].priceList[j].amount),
          );
        }
      }
    }

    if (chartData.isNotEmpty && DateTime.now().difference(chartData[chartData.length - 1].date).inHours > 24) {
      chartData.add(ChartData(date: DateTime.now(), price: chartData[chartData.length - 1].price));
    }

    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        SfCartesianChart(
            tooltipBehavior: _tooltipBehavior,
            primaryXAxis: DateTimeAxis(
              intervalType: DateTimeIntervalType.days,
              title: AxisTitle(
                text: "${"date".tr}",
              ),
              minimum: getProductOffersData()[0].date,
            ),
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: "${"price".tr}"),
            ),
            series: <ChartSeries>[
              LineSeries<ChartData, DateTime>(
                  color: Colors.green,
                  dataSource: getProductOffersData(),
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    useSeriesColor: true,
                    textStyle: TextStyle(color: Colors.white),
                    labelAlignment: ChartDataLabelAlignment.outer,
                  ),
                  markerSettings: const MarkerSettings(isVisible: false, color: Colors.white),
                  enableTooltip: true,
                  xValueMapper: (ChartData data, _) => data.date,
                  yValueMapper: (ChartData data, _) => data.price)
            ]),
      ],
    ));
  }
}

class ChartData {
  ChartData({required this.date, required this.price});
  final DateTime date;
  final double price;
}
