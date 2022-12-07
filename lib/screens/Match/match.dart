import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/app_config.dart';
import 'package:meet_people/components/expanded_btn.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/styleSheet.dart';
import 'package:meet_people/screens/Dashboard/Notification/Notification.dart';
import 'package:meet_people/screens/Match/matchFound.dart';

import '../../helpers/icons&images.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.blackColor,
        elevation: 0,
        title: Text(AppConfigs.appName, style: GetTextTheme.sf20_Bold),
        leading: Image.asset(AppConfigs.appLogo, height: 70.h),
        actions: [
          IconButton(
              onPressed: () {
                AppServices.pushTo(context, const NotificationScreen());
              },
              icon: Image.asset(AppIcons.notificationIcon, height: 30.h))
        ],
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
                  width: AppServices.getScreenWidth(context) * 0.45.w,
                  height: AppServices.getScreenWidth(context) * 0.45.w,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(AppImages.femaleModel),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 8, color: AppColors.primaryColor)),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h)
                .copyWith(bottom: 40.h, top: 20.h),
            child: Column(
              children: [
                Text("Click On The Button Below And Find Your Match",
                    textAlign: TextAlign.center,
                    style: GetTextTheme.sf22_Bold
                        .copyWith(color: AppColors.greyColor)),
                AppServices.addHeight(20.h),
                Row(
                  children: [
                    ExpandedButtonView(
                      btnName: "FIND MATCH",
                      onPress: () {
                        AppServices.pushTo(context, const MatchFoundScreen());
                      },
                      radius: 40.r,
                      padding: 15.h,
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
