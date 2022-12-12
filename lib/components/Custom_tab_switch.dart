// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/helpers/styleSheet.dart';

class CustomTabSwitch extends StatelessWidget {
  double margin;
  double width;
  List<Widget> values;
  double radius;
  Color activeColor, inActiveColor;
  TextStyle activeStyle, inActiveStyle;
  int activeIndex;
  Function(int) onValueChange;
  CustomTabSwitch({
    super.key,
    required this.values,
    required this.activeIndex,
    required this.onValueChange,
    required this.width,
    this.margin = 4,
    this.radius = 15,
    this.activeColor = AppColors.blackColor,
    this.inActiveColor = AppColors.primaryColor,
    this.activeStyle = const TextStyle(),
    this.inActiveStyle = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
      child: Row(
        children: List.generate(
            values.length,
            (index) => InkWell(
                  onTap: () => onValueChange(index),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: margin),
                    width: width,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color:
                            activeIndex == index ? activeColor : inActiveColor,
                        borderRadius: BorderRadius.circular(radius)),
                    child: Center(
                      child: values[index],
                    ),
                  ),
                )),
      ),
    );
  }
}
