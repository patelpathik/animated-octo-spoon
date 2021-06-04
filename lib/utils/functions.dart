import 'package:flutter_facebook_login/flutter_facebook_login.dart';

Future<bool> facebookLogin() async {
  final facebookLogin = FacebookLogin();
  facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
  final result = await facebookLogin.logIn(['email']);
  bool loginStatus = false;
  if (result.status == FacebookLoginStatus.loggedIn) {
    final FacebookAccessToken accessToken = result.accessToken;
    loginStatus = true;
  } else if (result.status == FacebookLoginStatus.cancelledByUser) {
    print('Login Cancelled by User');
  } else if (result.status == FacebookLoginStatus.error) {
    print("Login error occurred :: ${result.errorMessage}");
  }
  return loginStatus;
}

Future<void> logOut() async {
  await FacebookLogin().logOut();
}
