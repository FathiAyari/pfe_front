class ListModel {
  String name;
  String? listOfProducts;
  bool state;

  ListModel({
    required this.name,
    this.listOfProducts,
    required this.state,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      name: (json['name']),
      listOfProducts: (json['listOfProducts'] ?? []),
      state: (json['state'] ?? false),
    );
  }
  Map<String, dynamic> Tojson() {
    return {};
  }
}
