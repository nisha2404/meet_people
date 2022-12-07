// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../classes/basic_models.dart';
import '../helpers/baseGetters.dart';
import '../helpers/styleSheet.dart';

class MyBottomNavBar extends StatelessWidget {
  List<MyBottomBarItems> items;
  double iconSize;
  int activeIndex;
  Color activeColor, inActiveColor;
  Function(int) onChange;
  MyBottomNavBar(
      {super.key,
      required this.items,
      required this.onChange,
      required this.activeIndex,
      this.activeColor = AppColors.blackColor,
      this.inActiveColor = AppColors.greyColor,
      this.iconSize = 18});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppServices.getScreenWidth(context),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          boxShadow: [
            BoxShadow(
                color: AppColors.greyColor, offset: Offset(0, 2), blurRadius: 3)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            items.length,
            (i) => Expanded(
                  child: SizedBox(
                    child: InkWell(
                        onTap: () => onChange(i),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(items[i].icon,
                                color: activeIndex == i
                                    ? activeColor
                                    : inActiveColor,
                                scale: AppServices.scaleFactor(context),
                                height: iconSize.h),
                            AppServices.addHeight(3.h),
                            Text(items[i].title,
                                style: GetTextTheme.sf10_Bold.copyWith(
                                    color: activeIndex == i
                                        ? activeColor
                                        : inActiveColor))
                          ],
                        )),
                  ),
                )),
      ),
    );
  }
}
