import 'User.dart';

class FriendRequest {
  final int id;
  final User sender;
  final DateTime sentAt;
  FriendRequest({required this.id, required this.sender, required this.sentAt});

  factory FriendRequest.fromJson(Map<String, dynamic> json) {
    return FriendRequest(
      id: json['id'],
      sender: User.fromJson(json['sender']),
      sentAt: DateTime.parse(json['sentAt']),
    );
  }
}
