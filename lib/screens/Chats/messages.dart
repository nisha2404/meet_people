import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/components/dialog.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/helpers/styleSheet.dart';
import 'package:meet_people/screens/videoCall/calling.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.blackColor,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                AppServices.pushTo(context, const CallingScreen());
              },
              splashRadius: 20,
              icon: Image.asset(AppIcons.videoCameraIcon, height: 25.h)),
          IconButton(
              onPressed: () {},
              splashRadius: 20,
              icon: Icon(Icons.more_horiz, size: 30.sp))
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(AppImages.femaleModel1),
            ),
            AppServices.addWidth(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Mimi Brown", style: GetTextTheme.sf16_Bold),
                    AppServices.addWidth(5.w),
                    Image.asset(AppIcons.checkIcon, height: 25.h)
                  ],
                ),
                Text("Dubai", style: GetTextTheme.sf14_Regular)
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
        child: Row(
          children: [
            Expanded(
                child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => BuyDiamondDialog());
                            },
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor),
                              child: const Icon(
                                Icons.send,
                                size: 20,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                        fillColor: AppColors.blackColor.withOpacity(0.5),
                        filled: true,
                        hintText: "Comment...",
                        hintStyle: GetTextTheme.sf14_Regular.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteColor.withOpacity(0.6)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.r),
                            borderSide: BorderSide.none)))),
            IconButton(
                splashRadius: 20.sp,
                onPressed: () {},
                icon: Icon(Icons.add_circle, size: 30.sp)),
            IconButton(
                splashRadius: 20.sp,
                onPressed: () {},
                icon: Icon(Icons.camera_alt, size: 30.sp)),
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      backgroundImage: AssetImage(AppImages.femaleModel1)),
                  AppServices.addWidth(10.w),
                  Container(
                      width: AppServices.getScreenWidth(context) * 0.6,
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.grey50),
                      child: Text("Hey there, How are you doing?",
                          style: GetTextTheme.sf14_Regular)),
                  AppServices.addWidth(10.w),
                  Text("11:42 am",
                      style: GetTextTheme.sf12_Regular
                          .copyWith(color: AppColors.greyColor))
                ],
              ),
              AppServices.addHeight(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("11:42 am",
                      style: GetTextTheme.sf12_Regular
                          .copyWith(color: AppColors.greyColor)),
                  AppServices.addWidth(10.w),
                  Container(
                      width: AppServices.getScreenWidth(context) * 0.6,
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.primaryColor),
                      child: Text("Hey there, How are you doing?",
                          style: GetTextTheme.sf14_Regular)),
                  AppServices.addWidth(10.w),
                  const CircleAvatar(
                      backgroundImage: AssetImage(AppImages.femaleModel1))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
