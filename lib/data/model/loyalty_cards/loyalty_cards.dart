class LoyaltyCards {
  final String name;
  final String barCode;
  final int storeId;
  final int id;

  LoyaltyCards({required this.name, required this.barCode, required this.storeId, required this.id});
  factory LoyaltyCards.fromJson(Map<String, dynamic> json) =>
      LoyaltyCards(name: json['name'], barCode: json['barCode'], storeId: json['storeId'], id: json['id']);
  Map<String, dynamic> toJson() => {'name': name, 'barCode': barCode, 'storeId': storeId};
}
