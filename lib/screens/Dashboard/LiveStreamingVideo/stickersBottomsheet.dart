// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/components/expanded_btn.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/helpers/styleSheet.dart';

import 'diamondshop.dart';

class StickersBottomSheet extends StatefulWidget {
  const StickersBottomSheet({Key? key}) : super(key: key);

  @override
  State<StickersBottomSheet> createState() => _StickersBottomSheetState();
}

class _StickersBottomSheetState extends State<StickersBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Row(
                    children: [
                      Image.asset(AppImages.diamondImage, height: 20.h),
                      AppServices.addWidth(10.w),
                      Text("2500", style: GetTextTheme.sf14_Bold)
                    ],
                  ),
                ),
              ),
              AppServices.addWidth(15.w),
              ExpandedButtonView(
                  btnName: "Add Diamonds",
                  onPress: () {
                    AppServices.popView(context);
                    showModalBottomSheet(
                        isScrollControlled: true,
                        constraints: BoxConstraints.expand(
                            height: AppServices.getScreenHeight(context) * 0.6),
                        backgroundColor: AppColors.blackColor.withOpacity(0.6),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r))),
                        context: context,
                        builder: ((context) {
                          return const DiamondShop();
                        }));
                  },
                  radius: 40.r,
                  padding: 12.h)
            ],
          ),
          AppServices.addHeight(20.h),
          Expanded(
            child: SizedBox(
              child: GridView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.greyColor.withOpacity(0.5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.heartImage, height: 35.h),
                            AppServices.addHeight(6.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppImages.diamondImage,
                                    height: 20.h),
                                AppServices.addWidth(5.w),
                                Text("20",
                                    style: GetTextTheme.sf14_Regular.copyWith(
                                        color: AppColors.whiteColor
                                            .withOpacity(0.8)))
                              ],
                            )
                          ],
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
