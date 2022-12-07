// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/app_config.dart';
import 'package:meet_people/components/Custom_tab_switch.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/helpers/styleSheet.dart';
import 'package:meet_people/screens/Dashboard/BottomSheet.dart';
import 'package:meet_people/screens/Dashboard/LiveStreamTab.dart';
import 'package:meet_people/screens/Dashboard/Notification/Notification.dart';
import 'package:meet_people/screens/Dashboard/ProfilesTab.dart';
import 'package:meet_people/screens/Dashboard/Wallet/wallet.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int activeTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            AppServices.pushTo(context, const WalletScreen());
          },
          child: Image.asset(
            AppImages.treasureImage,
            fit: BoxFit.cover,
          )),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
            color: AppColors.primaryColor,
            child: Column(children: [
              Row(children: [
                Image.asset(AppConfigs.appLogo, height: 70.h),
                Text(AppConfigs.appName, style: GetTextTheme.sf20_Bold),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    AppServices.pushTo(context, const NotificationScreen());
                  },
                  icon: Image.asset(AppIcons.notificationIcon, height: 30.h),
                )
              ]),
              Row(
                children: [
                  CustomTabSwitch(
                      width: AppServices.getScreenWidth(context) * 0.35.w,
                      values: [
                        Text("Profiles",
                            style: GetTextTheme.sf14_Bold.copyWith(
                                color: activeTabIndex == 0
                                    ? AppColors.primaryColor
                                    : AppColors.blackColor)),
                        Text("Live Streams",
                            style: GetTextTheme.sf14_Bold.copyWith(
                                color: activeTabIndex != 0
                                    ? AppColors.primaryColor
                                    : AppColors.blackColor))
                      ],
                      activeStyle: GetTextTheme.sf14_Bold
                          .copyWith(color: AppColors.whiteColor),
                      inActiveStyle: GetTextTheme.sf14_Bold,
                      activeIndex: activeTabIndex,
                      onValueChange: (value) =>
                          setState(() => activeTabIndex = value)),
                  AppServices.addWidth(5.w),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            constraints: BoxConstraints.expand(
                                height: AppServices.getScreenHeight(context) *
                                    0.95.h),
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomBottomSheet();
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(35.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppServices.addWidth(2.w),
                            Image.asset(
                              AppIcons.globeIcon,
                              height: 20.h,
                              color: AppColors.whiteColor,
                            ),
                            AppServices.addWidth(5.w),
                            Text(
                              "Global",
                              style: GetTextTheme.sf12_Bold
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            AppServices.addWidth(3.w),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
          activeTabIndex == 0 ? const ProfileTab() : const LiveStreamTab()
        ],
      )),
    );
  }
}
