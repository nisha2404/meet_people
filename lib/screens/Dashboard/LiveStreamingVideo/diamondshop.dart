import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/styleSheet.dart';

import '../../../components/expanded_btn.dart';
import '../../../helpers/icons&images.dart';

class DiamondShop extends StatefulWidget {
  const DiamondShop({Key? key}) : super(key: key);

  @override
  State<DiamondShop> createState() => _DiamondShopState();
}

class _DiamondShopState extends State<DiamondShop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: Column(
        children: [
          Text("DIAMOND SHOP",
              style:
                  GetTextTheme.sf18_Bold.copyWith(color: AppColors.whiteColor)),
          AppServices.addHeight(15.h),
          Expanded(
            child: SizedBox(
                child: SingleChildScrollView(
              child: Column(
                  children: List.generate(
                      10,
                      (index) => Column(
                            children: [
                              AppServices.addHeight(10.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 20.w),
                                decoration: BoxDecoration(
                                    color: AppColors.greyColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Row(
                                  children: [
                                    Image.asset(AppImages.diamondImage,
                                        height: 22.h),
                                    AppServices.addWidth(15.w),
                                    Expanded(
                                      child: Text("1500 Diamonds",
                                          style: GetTextTheme.sf16_Bold
                                              .copyWith(
                                                  color: AppColors.whiteColor)),
                                    ),
                                    ExpandedButtonView(
                                      btnName: "\$ 5",
                                      onPress: () {},
                                      radius: 40.r,
                                      padding: 12.h,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ))),
            )),
          ),
          AppServices.addHeight(15.h),
          Text("By continuing the purchase you agree to our",
              style: GetTextTheme.sf14_Regular.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor.withOpacity(0.8))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text("Terms of Use",
                      style: GetTextTheme.sf14_Bold
                          .copyWith(color: AppColors.whiteColor))),
              Text("and",
                  style: GetTextTheme.sf14_Regular.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor.withOpacity(0.8))),
              TextButton(
                  onPressed: () {},
                  child: Text("Privacy Policy",
                      style: GetTextTheme.sf14_Bold
                          .copyWith(color: AppColors.whiteColor))),
            ],
          )
        ],
      ),
    );
  }
}
