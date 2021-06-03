import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = new MediaQueryData();
  static double screenWidth = 1;
  static double screenHeight = 1;
  static double blockSizeHorizontal = 1;
  static double blockSizeVertical = 1;
  static double _safeAreaHorizontal = 1;
  static double _safeAreaVertical = 1;
  static double safeBlockHorizontal = 1;
  static double safeBlockVertical = 1;

  static double statusBarHeight = 1;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    statusBarHeight = (blockSizeVertical * 100) - (safeBlockVertical * 100);
  }
}
