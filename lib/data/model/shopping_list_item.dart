import 'package:cypros_comparator/data/model/ProductModel/Product.dart';

class ShoppingListItem {
  final Product product;
  final int quantity;
  final bool status;
  final DateTime addedAt;

  ShoppingListItem({required this.product, required this.quantity, required this.status, required this.addedAt});

  factory ShoppingListItem.fromJson(Map<String, dynamic> json) {
    return ShoppingListItem(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
      status: json['status'],
      addedAt: DateTime.parse(json['addedAt']),
    );
  }
}
