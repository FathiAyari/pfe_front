import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../data/model/shopping_list.dart';
import '../data/response.dart';
import '../util/app_constants.dart';

class ShoppingListsServices {
  var user = GetStorage().read("user");

  Future<List<ShoppingList>> getShoppingLists() async {
    try {
      var dio = Dio();
      var url = "${AppConstants.BASE_URL2}${AppConstants.ShoppingLists}/${user['id']}";
      dio.options.headers['content-Type'] = 'application/json';
      var request = await dio.get(
        url,
      );

      var response = request.data;
      print(response);
      List<ShoppingList> shoppingLists = [];
      for (var item in response) {
        shoppingLists.add(ShoppingList.fromJson(item));
      }

      return shoppingLists;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> shareShoppingLists(
    int shoppingListId,
    int receiverId,
    int senderId,
  ) async {
    try {
      var dio = Dio();
      var url = "${AppConstants.BASE_URL2}${AppConstants.ShoppingLists}/${shoppingListId}/${receiverId}/${senderId}";
      dio.options.headers['content-Type'] = 'application/json';
      var request = await dio.get(
        url,
      );

      var response = request.data;
      if (ApiResponse.fromJson(response).result == "SUCCESSFULLY") {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
