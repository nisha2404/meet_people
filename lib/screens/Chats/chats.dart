import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/screens/Chats/messages.dart';

import '../../app_config.dart';
import '../../helpers/baseGetters.dart';
import '../../helpers/icons&images.dart';
import '../../helpers/styleSheet.dart';
import '../Dashboard/Notification/Notification.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(
              10,
              (index) => InkWell(
                onTap: () {
                  AppServices.pushTo(context, const MessageScreen());
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.greyColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                  child: Row(children: [
                    const CircleAvatar(
                        backgroundImage: AssetImage(AppImages.femaleModel)),
                    AppServices.addWidth(15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text.rich(TextSpan(
                                text: "Jhonson Smith",
                                style: GetTextTheme.sf14_Bold,
                                children: [
                                  TextSpan(
                                      text: " 15",
                                      style: GetTextTheme.sf14_Regular)
                                ])),
                            AppServices.addWidth(10.w),
                            Image.asset(AppIcons.checkIcon, height: 20.h)
                          ]),
                          Text("Hey, Can we meet today at Lack Vintage Home.",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GetTextTheme.sf12_Regular
                                  .copyWith(color: AppColors.greyColor))
                        ],
                      ),
                    ),
                    AppServices.addWidth(10.w),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("5 Sep 2021",
                            style: GetTextTheme.sf10_regular
                                .copyWith(color: AppColors.greyColor)),
                        AppServices.addHeight(5.h),
                        Icon(
                          Icons.circle,
                          color: AppColors.primaryColor,
                          size: 15.h,
                        )
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
