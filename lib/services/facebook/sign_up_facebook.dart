import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<bool> SignUpWithFacebook() async {
  try {
    final result =
        await FacebookAuth.i.login(permissions: ["public_profile", "email"]);
    if (result.status == LoginStatus.success) {
      final requestData =
          await FacebookAuth.i.getUserData(fields: "name,email,picture");
      print(requestData);
    }
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
