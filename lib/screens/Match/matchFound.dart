import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/expanded_btn.dart';
import '../../helpers/baseGetters.dart';
import '../../helpers/icons&images.dart';
import '../../helpers/styleSheet.dart';
import '../Profile/matchProfile.dart';

class MatchFoundScreen extends StatefulWidget {
  const MatchFoundScreen({Key? key}) : super(key: key);

  @override
  State<MatchFoundScreen> createState() => _MatchFoundScreenState();
}

class _MatchFoundScreenState extends State<MatchFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.blackColor,
        elevation: 0,
        title: Text("FIND MATCH", style: GetTextTheme.sf20_Bold),
      ),
      body: SafeArea(
          child: Column(
        children: [
          AppServices.addHeight(30.h),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.2,
                        image: AssetImage(AppImages.worldMapImg),
                        fit: BoxFit.cover)),
                child: Container(
                  width: AppServices.getScreenWidth(context) * 0.7.w,
                  height: AppServices.getScreenHeight(context) * 0.45.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      image: const DecorationImage(
                          image: AssetImage(AppImages.femaleModel),
                          fit: BoxFit.cover),
                      border:
                          Border.all(width: 8, color: AppColors.primaryColor)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 15.h),
                      decoration: BoxDecoration(
                          color: AppColors.blackColor.withOpacity(0.6),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.r),
                              bottomRight: Radius.circular(12.r))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Mimi Brown",
                                  style: GetTextTheme.sf16_Bold
                                      .copyWith(color: AppColors.whiteColor)),
                              Image.asset(AppIcons.checkIcon, height: 20.h)
                            ],
                          ),
                          Text("Dubai",
                              style: GetTextTheme.sf14_Regular.copyWith(
                                  color:
                                      AppColors.whiteColor.withOpacity(0.8))),
                          Text("I love being wild, ",
                              style: GetTextTheme.sf14_Regular.copyWith(
                                  color:
                                      AppColors.whiteColor.withOpacity(0.8))),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h)
                .copyWith(bottom: 40.h, top: 20.h),
            child: Column(
              children: [
                Text("We have found match for you...",
                    textAlign: TextAlign.center,
                    style: GetTextTheme.sf20_Bold
                        .copyWith(color: AppColors.greyColor)),
                AppServices.addHeight(40.h),
                Row(
                  children: [
                    ExpandedButtonView(
                      btnName: "GO TO PROFILE",
                      onPress: () {
                        AppServices.pushTo(context, const MatchProfileScreen());
                      },
                      radius: 40.r,
                      padding: 15.h,
                    )
                  ],
                ),
                AppServices.addHeight(10.h),
                Row(
                  children: [
                    ExpandedButtonView(
                      btnName: "NEXT",
                      onPress: () {},
                      padding: 10.h,
                      bgColor: Colors.transparent,
                      txtColor: AppColors.greyColor,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
