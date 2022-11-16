class Price {
  DateTime creationDate;
  double amount;

  Price({required this.creationDate, required this.amount});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      creationDate: DateTime.parse("${json['creationDate']}"),
      amount: (json['amount'] ?? ''),
    );
  }
}
