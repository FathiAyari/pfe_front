import 'package:cypros_comparator/data/auth_response.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/model/User.dart';
import '../util/app_constants.dart';
import '../view/screens/auth_screens/signIn/sign_in_screen.dart';

class AuthServices {
  Future<bool> SignUp(String name, String lastName, String phone, String email, String password) async {
    try {
      var dio = Dio();
      Map<String, dynamic> data = {
        "name": name,
        "lastName": lastName,
        "phoneNumber": phone,
        "email": email,
        "password": password
      };
      var url = "${AppConstants.BASE_URL2}${AppConstants.SignUp}";
      dio.options.headers['content-Type'] = 'application/json';
      var request = await dio.post(
        url,
        data: data,
      );

      var response = AuthResponse.fromJson(request.data);
      if (response.result == "SUCCESSFULLY") {
        User user = response.user!;
        GetStorage().write("auth", 1);
        GetStorage().write(
            "user", {"id": user.id, 'name': user.name, 'last_name': user.lastName, 'phone': user.phone, 'email': user.email});
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> SignIn(String email, String password) async {
    try {
      var dio = Dio();
      Map<String, String> data = {"email": email, "password": password};
      var url = "${AppConstants.BASE_URL2}${AppConstants.SignIn}";
      dio.options.headers['content-Type'] = 'application/json';
      var request = await dio.post(
        url,
        data: data,
      );
      var response = AuthResponse.fromJson(request.data);
      if (response.result == "SUCCESSFULLY") {
        User user = response.user!;
        GetStorage().write("auth", 1);
        GetStorage().write(
            "user", {"id": user.id, 'name': user.name, 'last_name': user.lastName, 'phone': user.phone, 'email': user.email});
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  logout() {
    GetStorage().remove("auth");
    Get.to(SignInScreen());
  }
}
