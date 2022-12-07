// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/components/textfield_primary.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/styleSheet.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int isButtonActive = 1;
  bool isSearchActive = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isSearchActive == true
                  ? Expanded(
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldPrimary(
                          hint: "Search here....", padding: 5.h),
                    ))
                  : Row(
                      children: [
                        IconButton(
                            splashRadius: 20,
                            onPressed: () {
                              AppServices.popView(context);
                            },
                            icon: const Icon(Icons.close)),
                        AppServices.addWidth(20.w),
                        Text(
                          "Country",
                          style: GetTextTheme.sf18_Bold,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
              IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    setState(() {
                      isSearchActive = !isSearchActive;
                    });
                  },
                  icon:
                      Icon(isSearchActive == true ? Icons.close : Icons.search))
            ],
          ),
          const Divider(
            thickness: 1,
            color: AppColors.blackColor,
          ),
          AppServices.addHeight(15.h),
          Row(
            children: [
              customButton(
                  "Global",
                  isButtonActive == 1
                      ? AppColors.primaryColor
                      : AppColors.greyColor, () {
                setState(() {
                  isButtonActive = 1;
                });
              }, isButtonActive == 1 ? 4 : 2)
            ],
          ),
          AppServices.addHeight(15.h),
          Row(
            children: [
              customButton(
                  "Paris",
                  isButtonActive == 2
                      ? AppColors.primaryColor
                      : AppColors.greyColor, () {
                setState(() {
                  isButtonActive = 2;
                });
              }, isButtonActive == 2 ? 4 : 2),
            ],
          ),
          AppServices.addHeight(15.h),
          Row(
            children: [
              customButton(
                  "London",
                  isButtonActive == 3
                      ? AppColors.primaryColor
                      : AppColors.greyColor, () {
                setState(() {
                  isButtonActive = 3;
                });
              }, isButtonActive == 3 ? 4 : 2),
            ],
          ),
          AppServices.addHeight(15.h),
          Row(
            children: [
              customButton(
                  "Torrento",
                  isButtonActive == 4
                      ? AppColors.primaryColor
                      : AppColors.greyColor, () {
                setState(() {
                  isButtonActive = 4;
                });
              }, isButtonActive == 4 ? 4 : 2),
            ],
          ),
          AppServices.addHeight(15.h),
          Row(
            children: [
              customButton(
                  "Bali",
                  isButtonActive == 5
                      ? AppColors.primaryColor
                      : AppColors.greyColor, () {
                setState(() {
                  isButtonActive = 5;
                });
              }, isButtonActive == 5 ? 4 : 2),
            ],
          ),
          AppServices.addHeight(15.h),
          Row(
            children: [
              customButton(
                  "Delhi",
                  isButtonActive == 6
                      ? AppColors.primaryColor
                      : AppColors.greyColor, () {
                setState(() {
                  isButtonActive = 6;
                });
              }, isButtonActive == 6 ? 4 : 2),
            ],
          )
        ],
      ),
    );
  }

  Expanded customButton(
      String btnName, Color btnColor, Function onpress, double elevation) {
    return Expanded(
      child: TextButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(elevation),
              backgroundColor: MaterialStateProperty.all(btnColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ))),
          onPressed: () {
            onpress();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              children: [
                const Icon(
                  Icons.circle,
                  color: AppColors.blackColor,
                  size: 15,
                ),
                AppServices.addWidth(10.w),
                Text(
                  btnName,
                  style: GetTextTheme.sf16_Bold
                      .copyWith(color: AppColors.blackColor),
                )
              ],
            ),
          )),
    );
  }
}
