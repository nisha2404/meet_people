import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/app_config.dart';
import 'package:meet_people/components/expanded_btn.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/helpers/styleSheet.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        foregroundColor: AppColors.blackColor,
        title: Text.rich(TextSpan(
            text: AppConfigs.appName.toUpperCase(),
            style: GetTextTheme.sf18_Bold,
            children: [
              TextSpan(text: "| WALLET", style: GetTextTheme.sf18_Regular)
            ])),
      ),
      body: SafeArea(
          child: Container(
        height: AppServices.getScreenHeight(context),
        width: AppServices.getScreenWidth(context),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.worldMapImg),
                opacity: 0.2,
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    AppImages.diamondImage,
                    height: 30.h,
                  ),
                  AppServices.addWidth(5.w),
                  Text(
                    "00",
                    style: GetTextTheme.sf32_Bold,
                  )
                ]),
                AppServices.addHeight(10.h),
                Text(
                  "YOUR DIAMONDS",
                  style: GetTextTheme.sf18_Bold,
                ),
                AppServices.addHeight(15.h),
                Row(
                  children: [
                    ExpandedButtonView(
                      btnName: "Watch Ad To Earn Diamonds",
                      onPress: () {},
                      bgColor: AppColors.blackColor,
                      txtColor: AppColors.primaryColor,
                      radius: 40.r,
                      padding: 15.h,
                    ),
                  ],
                ),
                AppServices.addHeight(25.h),
                Text(
                  "Please purchase coins to enjoy all the features like chatting, video calls and live streams.",
                  style: GetTextTheme.sf16_Regular
                      .copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                AppServices.addHeight(25.h),
                priceTile("1500", "\$ 5"),
                AppServices.addHeight(15.h),
                priceTile("5000", "\$ 15"),
                AppServices.addHeight(15.h),
                priceTile("10000", "\$ 25"),
                AppServices.addHeight(15.h),
                priceTile("20000", "\$ 45"),
                AppServices.addHeight(35.h),
                Text("By continuing the purchase you agree to our",
                    style: GetTextTheme.sf14_Regular
                        .copyWith(fontWeight: FontWeight.w500)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text("Terms of Use",
                            style: GetTextTheme.sf14_Bold
                                .copyWith(color: AppColors.blackColor))),
                    Text("and",
                        style: GetTextTheme.sf14_Regular
                            .copyWith(fontWeight: FontWeight.w500)),
                    TextButton(
                        onPressed: () {},
                        child: Text("Privacy Policy",
                            style: GetTextTheme.sf14_Bold
                                .copyWith(color: AppColors.blackColor))),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Container priceTile(String diamond, String price) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      decoration: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          Image.asset(AppImages.diamondImage, height: 25.h),
          AppServices.addWidth(15.w),
          Expanded(
            child: Text(diamond,
                style: GetTextTheme.sf18_Bold
                    .copyWith(color: AppColors.whiteColor)),
          ),
          ExpandedButtonView(
            btnName: price,
            onPress: () {},
            radius: 40.r,
            padding: 12.h,
          )
        ],
      ),
    );
  }
}
