// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../app_config.dart';

class AppServices {
  /* Height and Width Factors */
  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static addHeight(double space) => SizedBox(height: space);
  static addWidth(double space) => SizedBox(width: space);

  static bool isSmallScreen(BuildContext context) =>
      getScreenWidth(context) <= 360;

  static String getCurrencySymbol = "\u{20B9}";

  /* Navigation and routing */
  static pushTo(BuildContext context, Widget screen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  static pushAndRemove(BuildContext context, Widget screen) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => screen), (route) => false);
  static popView(BuildContext context) => Navigator.of(context).pop();

  static keyboardUnfocus(BuildContext context) =>
      FocusScope.of(context).unfocus();

  /* UI Scale Factor */
  static double scaleFactor(BuildContext context) {
    if (getScreenWidth(context) > AppConfigs.designWidth) {
      return AppConfigs.designWidth / getScreenWidth(context);
    } else {
      return getScreenWidth(context) / AppConfigs.designWidth;
    }
  }
}
