import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_config.dart';
import '../../helpers/baseGetters.dart';
import '../../helpers/icons&images.dart';
import '../../helpers/styleSheet.dart';
import '../Dashboard/Notification/Notification.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      // appBar: AppBar(
      //   backgroundColor: AppColors.primaryColor,
      //   foregroundColor: AppColors.blackColor,
      //   elevation: 0,
      //   title: Text(AppConfigs.appName, style: GetTextTheme.sf20_Bold),
      //   leading: Image.asset(AppConfigs.appLogo, height: 70.h),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           AppServices.pushTo(context, const NotificationScreen());
      //         },
      //         icon: Image.asset(AppIcons.notificationIcon, height: 30.h))
      //   ],
      // ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.h),
            height: AppServices.getScreenHeight(context) * 0.25.h,
            width: AppServices.getScreenWidth(context),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.profilebg),
                    fit: BoxFit.contain)),
            child: Column(
              children: [
                Container(
                  width: AppServices.getScreenWidth(context) * 0.25.w,
                  height: AppServices.getScreenWidth(context) * 0.25.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(AppImages.femaleModel),
                          fit: BoxFit.cover)),
                ),
                AppServices.addHeight(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Steeve Johnson",
                      style: GetTextTheme.sf22_Bold,
                      textAlign: TextAlign.center,
                    ),
                    AppServices.addWidth(5.h),
                    Image.asset(AppIcons.checkIcon, height: 30.h)
                  ],
                ),
                Text("London",
                    style: GetTextTheme.sf18_Bold
                        .copyWith(color: AppColors.greyColor))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                custom_tile(
                    "Email",
                    "user@gmail.com",
                    const Icon(Icons.email, color: AppColors.primaryColor),
                    () {}),
                custom_tile(
                    "Phone",
                    "xxxxxxxxxx",
                    const Icon(Icons.email, color: AppColors.primaryColor),
                    () {}),
                custom_tile(
                    "Gender",
                    "male",
                    const Icon(Icons.email, color: AppColors.primaryColor),
                    () {}),
              ],
            ),
          )
        ],
      )),
    );
  }

  Card custom_tile(
      String title, String subtitle, prefixicon, Function onpress) {
    return Card(
      color: AppColors.grey50,
      margin: EdgeInsets.only(bottom: 20.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            prefixicon,
            AppServices.addWidth(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GetTextTheme.sf16_Bold),
                Text(subtitle,
                    style: GetTextTheme.sf14_Regular
                        .copyWith(color: AppColors.greyColor))
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  onpress();
                },
                icon: Icon(Icons.edit, color: AppColors.primaryColor),
                splashRadius: 20.r)
          ],
        ),
      ),
    );
  }
}
