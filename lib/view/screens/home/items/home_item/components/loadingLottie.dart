import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../util/ConstraintsConstants.dart';

Transform loadingLottie() {
  return Transform.translate(
      offset:
          Offset(Constants.screenWidth * 0.4, Constants.screenHeight * 0.81),
      child: Lottie.asset("assets/images/loading.json", height: 80));
}
