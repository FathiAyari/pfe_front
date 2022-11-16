import 'package:cypros_comparator/services/google/GoogleSignInApi.dart';

void SignUpWithGoogle() async {
  try {
    final data = await GoogleSignInApi.login();
    print(data);
  } catch (e) {
    print('Operation failed!');
  }
}
