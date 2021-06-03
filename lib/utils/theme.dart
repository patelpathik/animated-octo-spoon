import 'package:flutter/material.dart';

class AppTheme {
  static Color textColor = Color(0xFFADADAD);
  static Color loginLabelColor = Color(0xFFF2F2F2);

  static TextStyle defTextStyle() {
    return TextStyle(color: textColor);
  }

  static ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xFF383838),
      textTheme: TextTheme(
        headline1: defTextStyle(),
        headline2: defTextStyle(),
        headline3: defTextStyle(),
        headline4: defTextStyle(),
        headline5: defTextStyle(),
        headline6: defTextStyle(),
        subtitle1: defTextStyle(),
        subtitle2: defTextStyle(),
      ),
    );
  }
}
