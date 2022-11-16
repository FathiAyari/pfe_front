import 'package:cypros_comparator/services/google/sing_up_google.dart';
import 'package:flutter/cupertino.dart';

import '../../../../services/facebook/sign_up_facebook.dart';
import 'SocialAuthComponent.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialAuth("assets/images/facebook.png", () {
          SignUpWithFacebook();
        }),
        SocialAuth("assets/images/gmail.png", () {
          SignUpWithGoogle();
        }),
      ],
    );
  }
}
