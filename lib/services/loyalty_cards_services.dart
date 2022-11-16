import 'dart:convert';

import 'package:cypros_comparator/data/model/loyalty_cards/loyalty_cards.dart';
import 'package:cypros_comparator/data/response.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../util/app_constants.dart';

class LoyaltyCardsServices {
  var user = GetStorage().read("user");
  Future<List<LoyaltyCards>> getLoyaltyCards() async {
    var dio = Dio();
    var url = "${AppConstants.BASE_URL2}${AppConstants.LoyaltsCards}/${user['id']}";
    var request = await dio.get(url);
    var response = request.data;
    List<LoyaltyCards> loyaltyCards = [];

    for (var item in response) {
      loyaltyCards.add(LoyaltyCards.fromJson(item));
    }
    print(loyaltyCards);
    return loyaltyCards;
  }

  Future<bool> createLoyaltyCard(String name, String barCode, int storeId) async {
    try {
      Map<String, dynamic> data = {"name": name, "barCode": barCode, "storeId": storeId, "userId": user['id']};
      var dio = Dio();
      var url = Uri.parse("${AppConstants.BASE_URL2}${AppConstants.createLoyaltyCard}");

      var request = await http.post(
        url,
        body: json.encode(data),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );
      var response = json.decode(request.body);
      if (ApiResponse.fromJson(response).result == "SUCCESSFULLY") {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> deleteLoyaltyCard(int id) async {
    try {
      var url = Uri.parse("${AppConstants.BASE_URL2}${AppConstants.deleteLoyaltyCard}/$id");

      var request = await http.get(
        url,
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );
      var response = json.decode(request.body);
      print(response);
      if (ApiResponse.fromJson(response).result == "SUCCESSFULLY") {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
