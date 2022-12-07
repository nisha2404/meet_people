// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/helpers/styleSheet.dart';

class ExpandedButtonView extends StatelessWidget {
  String btnName;
  Color bgColor, txtColor;
  Function onPress;
  double radius;
  double padding;
  ExpandedButtonView(
      {super.key,
      required this.btnName,
      required this.onPress,
      this.radius = 8,
      this.padding = 19,
      this.bgColor = AppColors.primaryColor,
      this.txtColor = AppColors.blackColor});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Expanded(
        child: SizedBox(
          child: TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius.r))),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: padding.h)),
                  backgroundColor: MaterialStateProperty.all(bgColor)),
              onPressed: () => onPress(),
              child: Text(
                btnName,
                style: GetTextTheme.sf14_Bold.copyWith(color: txtColor),
              )),
        ),
      );
    });
  }
}
