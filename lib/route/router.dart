import 'package:dogspath/route/routes.dart';
import 'package:dogspath/views/home.dart';
import 'package:dogspath/views/login.dart';
import 'package:dogspath/views/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static onGenerateRoute(RouteSettings settings) {
    Widget page = Container();
    switch (settings.name) {
      case Routes.splashScreen:
        page = SplashScreen();
        break;

      case Routes.login:
        page = Login();
        break;

      case Routes.home:
        page = Home();
        break;
    }
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
