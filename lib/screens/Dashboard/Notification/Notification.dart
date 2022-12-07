import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/helpers/styleSheet.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.blackColor,
        elevation: 0,
        title: Text(
          "NOTIFICATIONS",
          style: GetTextTheme.sf18_Bold,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
        child: Column(
          children: List.generate(
              5,
              (index) => Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage(AppImages.femaleModel),
                        ),
                        title: Text(
                          "Pinky Arora is available.",
                          style: GetTextTheme.sf16_Bold,
                        ),
                        subtitle: Text(
                          "Pinky Arora is available to take calls, chat, message and have fun",
                          style: GetTextTheme.sf14_Regular
                              .copyWith(fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Text(
                          "5min",
                          style: GetTextTheme.sf14_Regular.copyWith(
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Divider(
                          thickness: 0.5, color: AppColors.blackColor),
                    ],
                  )),
        ),
      )),
    );
  }
}
