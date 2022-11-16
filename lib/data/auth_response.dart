import 'model/User.dart';

class AuthResponse {
  final User? user;
  final String? result;
  AuthResponse({this.result, this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      result: json['authenticationResult'],
      user: User.fromJson(json['user']),
    );
  }
}
