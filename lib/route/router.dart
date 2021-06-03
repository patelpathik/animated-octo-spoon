import 'package:dogspath/route/routes.dart';
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
        page = Scaffold(body: Center(child: Text("WIP")));
        break;
    }
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
