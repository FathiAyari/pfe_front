import 'dart:ui';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:cypros_comparator/view/screens/auth_screens/resetPasssword/components/new_password.dart';
import 'package:cypros_comparator/view/screens/home/items/profile_item/components/connections/connections.dart';
import 'package:cypros_comparator/view/screens/home/items/profile_item/components/explore/explore.dart';
import 'package:cypros_comparator/view/screens/home/items/profile_item/components/lists/my_lists.dart';
import 'package:cypros_comparator/view/screens/navigation_drawer/navigation_items/account_settings/settings_components/change_email.dart';
import 'package:cypros_comparator/view/screens/navigation_drawer/navigation_items/account_settings/settings_components/change_user_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../view/screens/OnBoarding/on_boarding_content.dart';
import '../view/screens/SplashScreen/splashScreen.dart.dart';
import '../view/screens/auth_screens/resetPasssword/components/verify_reset_password_code.dart';
import '../view/screens/auth_screens/resetPasssword/reset_password.dart';
import '../view/screens/auth_screens/signIn/sign_in_screen.dart';
import '../view/screens/auth_screens/signUp/sign_up_screen.dart';
import '../view/screens/home/items/home_item/home_screen.dart';
import '../view/screens/home/items/home_item/product_details/components/superMarketTab.dart';
import '../view/screens/home/items/notification_item/notifications.dart';
import '../view/screens/home/items/profile_item/components/cards/my_cards.dart';
import '../view/screens/home/items/profile_item/profile_screen.dart';
import '../view/screens/home/items/saved_items/saved_items.dart';
import '../view/screens/navigation_drawer/navigation_items/account_settings/settings_components/change_password.dart';
import '../view/screens/navigation_drawer/navigation_menu.dart';

class AppConstants {
  static const String APP_NAME = 'Comparator';

  static const String Products = '/products';
  static const String LoyaltsCards = '/cards';
  static const String SignUp = '/register';
  static const String SignIn = '/login';
  static const String Friends = '/friends';
  static const String FriendsRequests = '/friend_requests';
  static const String AcceptFriendRequest = '/accept_request';
  static const String DeleteFriendRequest = '/delete_request';
  static const String DeleteFriend = '/delete_friend';
  static const String createLoyaltyCard = '/create_card';
  static const String deleteLoyaltyCard = '/delete_card';
  static const String ShoppingLists = '/get_shopping_lists';

  static const String BASE_URL = 'http://141.95.193.15:8080';
  static const String BASE_URL2 = 'http://192.168.1.95:8080/api/v1';

  static const String CONFIG_URI = '/api/v1/config';
  static const String BANNER_URI = '/api/v1/banners';
  static const String CATEGORY_URI = '/api/v1/categories';
  static const String SUB_CATEGORY_URI = '/api/v1/categories/childes/';
  static const String CATEGORY_PRODUCT_URI = '/api/v1/categories/products/';
  static const String POPULAR_PRODUCT_URI = '/api/v1/products/latest';
  static const String DAILY_ITEM_URI = '/api/v1/products/daily-needs';
  static const String SEARCH_PRODUCT_URI = '/api/v1/products/details/';
  static const String SEARCH_URI = '/api/v1/products/search?name=';
  static const String MESSAGE_URI = '/api/v1/customer/message/get';
  static const String SEND_MESSAGE_URI = '/api/v1/customer/message/send';
  static const String NOTIFICATION_URI = '/api/v1/notifications';
  static const String REGISTER_URI = '/api/v1/auth/register';
  static const String LOGIN_URI = '/api/v1/auth/signIn';
  static const String FORGET_PASSWORD_URI = '/api/v1/auth/forgot-password';
  static const String RESET_PASSWORD_URI = '/api/v1/auth/reset-password';
  static const String CHECK_PHONE_URI = '/api/v1/auth/check-phone?phone=';
  static const String VERIFY_PHONE_URI = '/api/v1/auth/verify-phone';
  static const String CHECK_EMAIL_URI = '/api/v1/auth/check-email';
  static const String VERIFY_EMAIL_URI = '/api/v1/auth/verify-email';
  static const String VERIFY_TOKEN_URI = '/api/v1/auth/verify-token';
  static const String PRODUCT_DETAILS_URI = '/api/v1/products/details/';
  static const String SUBMIT_REVIEW_URI = 'api/v1/products/reviews/submit';
  static const String COUPON_URI = '/api/v1/coupon/list';
  static const String COUPON_APPLY_URI = '/api/v1/coupon/apply?code=';
  static const String CUSTOMER_INFO_URI = '/api/v1/customer/info';
  static const String UPDATE_PROFILE_URI = '/api/v1/customer/update-profile';
  static const String ADDRESS_LIST_URI = '/api/v1/customer/address/list';
  static const String REMOVE_ADDRESS_URI = '/api/v1/customer/address/delete?address_id=';
  static const String ADD_ADDRESS_URI = '/api/v1/customer/address/add';
  static const String UPDATE_ADDRESS_URI = '/api/v1/customer/address/update/';
  static const String ORDER_LIST_URI = '/api/v1/customer/order/list';
  static const String ORDER_CANCEL_URI = '/api/v1/customer/order/cancel';
  static const String ORDER_DETAILS_URI = '/api/v1/customer/order/details?order_id=';
  static const String TRACK_URI = '/api/v1/customer/order/track?order_id=';
  static const String PLACE_ORDER_URI = '/api/v1/customer/order/place';
  static const String LAST_LOCATION_URI = '/api/v1/delivery-man/last-location?order_id=';
  static const String TIMESLOT_URI = '/api/v1/timeSlot';
  static const String TOKEN_URI = '/api/v1/customer/cm-firebase-token';
  static const String UPDATE_METHOD_URI = '/api/v1/customer/order/payment-method';
  static const String REVIEW_URI = '/api/v1/products/reviews/submit';
  static const String DELIVER_MAN_REVIEW_URI = '/api/v1/delivery-man/reviews/submit';

  // Shared Key
  static const String THEME = 'theme';
  static const String TOKEN = 'token';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String CART_LIST = 'cart_list';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_ADDRESS = 'user_address';
  static const String USER_NUMBER = 'user_number';
  static const String SEARCH_ADDRESS = 'search_address';
  static const String TOPIC = 'grofresh';
  static Map<String, String> addCardSuccess = {
    'image': 'assets/images/success.json',
    'label': '${"add_card_success".tr}',
  };
  static Map<String, String> addCardFailed = {
    'image': 'assets/images/error.json',
    'label': '${"add_card_failed".tr}',
  };
  static List<Content> onBoardingContentList = [
    Content(
      img: 'assets/images/welcome.json',
      description: 'onboarding_1'.tr,
      title: 'onboarding_1_title'.tr,
    ),
    Content(
      img: 'assets/images/save_money.json',
      description: 'onboarding_2'.tr,
      title: '',
    ),
    Content(
      img: 'assets/images/friends.json',
      description: 'onboarding_3'.tr,
      title: '',
    ),
    Content(
      img: 'assets/images/scan.json',
      description: 'onboarding_4'.tr,
      title: '',
    ),
  ];

  static Map storeIdMarkets = {
    "0": "Aziza",
    "1": "Carrefour",
    "2": "Geant",
    "3": "Monoprix",
  };
  static List superMarketLogos = [
    "assets/images/aziza.png",
    "assets/images/carrefour.png",
    "assets/images/geant.png",
    "assets/images/monoprix.png"
  ];
  static List<Widget> superMarketTabs = [
    superMarketTab(0.04, 0.1, "assets/images/aziza.png"),
    superMarketTab(0.04, 0.07, "assets/images/carrefour.png"),
    superMarketTab(0.055, 0.07, "assets/images/geant.png"),
    superMarketTab(0.035, 0.07, "assets/images/monoprix.png"),
  ];

  /* Routes */
  static List<GetPage> routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/sign_in', page: () => SignInScreen()),
    GetPage(
      name: '/reset_password',
      page: () => ResetPassword(),
    ),
    GetPage(
      name: '/verify',
      page: () => VerifyResetCode(),
    ),
    GetPage(
      name: '/sign_up',
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: '/new_password',
      page: () => NewPassword(),
    ),
    GetPage(
      name: '/home',
      page: () => NavigationMenu(),
    ),
    GetPage(
      name: '/my_lists',
      page: () => const MyLists(),
    ),
    GetPage(
      name: '/connections',
      page: () => const Connections(),
    ),
    GetPage(
      name: '/explore',
      page: () => const Explore(),
    ),
    GetPage(
      name: '/my_cards',
      page: () => MyLoyaltyCards(),
    ),
    GetPage(
      name: '/change_password',
      page: () => ChangePassword(),
    ),
    GetPage(
      name: '/change_email',
      page: () => ChangeEmail(),
    ),
    GetPage(
      name: '/change_user_name',
      page: () => ChangeUserName(),
    ),
  ];
  static List<CustomNavigationBarItem> customNavigationBarItem = [
    CustomNavigationBarItem(
      icon: const ImageIcon(
        AssetImage('assets/images/home.png'),
      ),
    ),
    CustomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/images/saved.png'),
      ),
    ),
    CustomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/notification.png"),
      ),
    ),
    CustomNavigationBarItem(
      icon: const ImageIcon(
        AssetImage('assets/images/profil.png'),
      ),
    ),
  ];

  static List<Widget> pages = [HomeScreen(), SavedItems(), Notifcations(), ProfileScreen()];
}

class Locales {
  static const en = Locale('en');
  static const fr = Locale('fr');
  static const List<Locale> supportedLocales = [en, fr];
  static const transationFilesPath = 'assets/translations';
}
