import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  check() {
    var storage = GetStorage();
    storage.write("seen", 1);
  }
}
