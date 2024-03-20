import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static late double refMobileHeight, refMobileWidth;

  void init(BuildContext context) {
    refMobileHeight = 760;
    refMobileWidth = 360;
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    double navBarHeight = 56;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom +
        navBarHeight;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }

  static double getMobileWidthRatio(double val) {
    double res = (val / refMobileWidth) * 100;
    return res * blockSizeHorizontal;
  }

  static double getMobileHeightRatio(double val) {
    double res = (val / refMobileHeight) * 100;
    return res * blockSizeVertical;
  }

  static double getMobileFontRatio(double val) {
    double res = (val / refMobileWidth) * 100;
    if (screenWidth < screenHeight) {
      return res * safeBlockHorizontal;
    } else {
      return res * safeBlockVertical;
    }
  }
}

extension SizeUtils on num {
  double get toMobileWidth => SizeConfig.getMobileWidthRatio(toDouble());

  double get toMobileHeight => SizeConfig.getMobileHeightRatio(toDouble());

  double get toMobileFont => SizeConfig.getMobileFontRatio(toDouble());
}
