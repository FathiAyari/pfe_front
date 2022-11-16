import 'package:cypros_comparator/data/model/ProductModel/Offer.dart';

class Product {
  String name;
  String brand;
  String description;
  String barCode;
  String image;
  String id;
  List<Offer> offers;

  Product({
    required this.name,
    required this.id,
    required this.brand,
    required this.description,
    required this.barCode,
    required this.image,
    required this.offers,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: (json['name'] ?? '').toString(),
      brand: (json['brand'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      barCode: (json['barCode'] ?? '').toString(),
      image: (json['image'] ?? '').toString(),
      id: (json['id'] ?? '').toString(),
      offers: (List<Offer>.from(json["offers"].map((offer) => Offer.fromJson(offer)))),
    );
  }
  Map<String, dynamic> Tojson() {
    return {};
  }
}
