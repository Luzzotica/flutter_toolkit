import 'package:flutter/material.dart';
import 'package:flutter_toolkit/resources/app_colors.dart';
import 'package:flutter_toolkit/util/constants.dart';

enum StyleType { header1, header2, header3, header4, body, button }

class AppStyles {
  static String fontFamily = 'Segoe UI';

  static TextStyle getButtonStyle({bool primary = true}) {
    return TextStyle(
      fontFamily: fontFamily,
      color: AppColors.buttonColorPrimary,
      fontSize: Constants.fontSizeButton,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle getTitleStyle() {
    return TextStyle(
      fontFamily: fontFamily,
      color: AppColors.fontColor,
      fontSize: Constants.fontSizeH1,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle getBodyStyle() {
    return TextStyle(
      fontFamily: fontFamily,
      color: AppColors.fontColor,
      fontSize: Constants.fontSizeBody,
      fontWeight: FontWeight.normal,
    );
  }
}
