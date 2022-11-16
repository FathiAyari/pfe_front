class User {
  final String? name;
  final String? lastName;
  final String? email;
  final String? phone;

  final int? id;

  User({this.name, this.email, this.phone, this.id, this.lastName});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phoneNumber'],
      lastName: json['lastName'],
    );
  }
}
