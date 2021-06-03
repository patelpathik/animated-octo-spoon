import 'package:dogspath/route/router.dart';
import 'package:dogspath/route/routes.dart';
import 'package:dogspath/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog\'s Path',
      theme: AppTheme.theme(),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
    );
  }
}
