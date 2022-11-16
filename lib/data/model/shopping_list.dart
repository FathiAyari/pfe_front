import 'package:cypros_comparator/data/model/shopping_list_item.dart';

import 'User.dart';

class ShoppingList {
  final int id;
  final String name;
  final String status;
  final DateTime creationDate;
  final User owner;
  User? sharedWith;
  final List<ShoppingListItem> items;

  ShoppingList(
      {required this.id,
      required this.name,
      required this.status,
      required this.creationDate,
      required this.owner,
      this.sharedWith,
      required this.items});

  factory ShoppingList.fromJson(Map<String, dynamic> json) {
    ShoppingList list = ShoppingList(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      creationDate: DateTime.parse(json['creationDate']),
      owner: User.fromJson(json['owner']),
      items: (List<ShoppingListItem>.from(json["shoppingListItemResponses"].map((item) => ShoppingListItem.fromJson(item)))),
    );
    if (json['sharedWith'] != null) {
      list.sharedWith = User.fromJson(json['sharedWith']);
    }
    return list;
  }
}
