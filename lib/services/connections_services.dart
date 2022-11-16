import 'package:cypros_comparator/data/model/User.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../data/model/friend_request.dart';
import '../data/response.dart';
import '../util/app_constants.dart';

class ConnectionsServices {
  var user = GetStorage().read("user");

  Future<List<User>> getFriends() async {
    try {
      var dio = Dio();
      var url = "${AppConstants.BASE_URL2}${AppConstants.Friends}/${user['id']}";
      dio.options.headers['content-Type'] = 'application/json';
      var request = await dio.get(
        url,
      );

      var response = request.data;

      List<User> friends = [];
      for (var item in response) {
        friends.add(User.fromJson(item));
      }
      print(friends);
      return friends;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<FriendRequest>> getFriendsRequests() async {
    var dio = Dio();
    var url = "${AppConstants.BASE_URL2}${AppConstants.FriendsRequests}/${user['id']}";
    dio.options.headers['content-Type'] = 'application/json';
    var request = await dio.get(
      url,
    );

    var response = request.data;
    List<FriendRequest> friendRequests = [];
    for (var friendRequest in response) {
      friendRequests.add(FriendRequest.fromJson(friendRequest));
    }
    return friendRequests;
  }

  Future<bool> acceptFriendRequest(int userId, int requestId) async {
    try {
      var dio = Dio();
      Map<String, dynamic> data = {"userId": userId, "receiverId": user['id'], "id": requestId};
      var url = "${AppConstants.BASE_URL2}${AppConstants.AcceptFriendRequest}";
      dio.options.headers['content-Type'] = 'application/json';
      var request = await dio.post(
        url,
        data: data,
      );

      if (ApiResponse.fromJson(request.data).result == "SUCCESSFULLY") {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> deleteFriendRequest(int requestId) async {
    try {
      var dio = Dio();
      var url = "${AppConstants.BASE_URL2}${AppConstants.DeleteFriendRequest}/${requestId}";
      dio.options.headers['content-Type'] = 'application/json';
      var request = await dio.get(
        url,
      );

      if (ApiResponse.fromJson(request.data).result == "SUCCESSFULLY") {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> deleteFriend(int friendId) async {
    try {
      var dio = Dio();
      var url = "${AppConstants.BASE_URL2}${AppConstants.DeleteFriend}/${user['id']}/${friendId}";
      dio.options.headers['content-Type'] = 'application/json';
      var request = await dio.get(
        url,
      );

      if (ApiResponse.fromJson(request.data).result == "SUCCESSFULLY") {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
