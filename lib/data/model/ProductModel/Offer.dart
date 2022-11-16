import 'Price.dart';

class Offer {
  String link;
  String externalId;
  List<Price> priceList;
  int storeId;

  Offer({required this.link, required this.externalId, required this.priceList, required this.storeId});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      link: (json['link'] ?? '').toString(),
      externalId: (json['externalId'] ?? '').toString(),
      storeId: json['storeId'] as int,
      priceList: (List<Price>.from(json['priceList'].map((price) => Price.fromJson(price)))),
    );
  }
}
