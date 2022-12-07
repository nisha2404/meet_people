// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/app_config.dart';
import 'package:meet_people/components/expanded_btn.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/helpers/styleSheet.dart';
import 'package:meet_people/screens/Dashboard/LiveStreamingVideo/diamondshop.dart';
import 'package:meet_people/screens/Dashboard/LiveStreamingVideo/stickersBottomsheet.dart';

class LiveVideoStreamingScreen extends StatefulWidget {
  const LiveVideoStreamingScreen({Key? key}) : super(key: key);

  @override
  State<LiveVideoStreamingScreen> createState() =>
      _LiveVideoStreamingScreenState();
}

class _LiveVideoStreamingScreenState extends State<LiveVideoStreamingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: AppServices.getScreenHeight(context) * 0.96,
          width: AppServices.getScreenWidth(context),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.femaleModel), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.blackColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage(AppImages.femaleModel),
                        ),
                        title: Row(children: [
                          Text("Mimi Brown",
                              style: GetTextTheme.sf16_Bold
                                  .copyWith(color: AppColors.whiteColor)),
                          AppServices.addWidth(5.w),
                          Image.asset(
                            AppIcons.checkIcon,
                            height: 25.h,
                          )
                        ]),
                        subtitle: Text(
                          "Las Vegas, USA",
                          style: GetTextTheme.sf14_Regular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor),
                        ),
                        trailing: const Icon(
                          Icons.more_horiz,
                          color: AppColors.whiteColor,
                          size: 35,
                        ))),
                AppServices.addHeight(15.h),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: AppColors.blackColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(40.r)),
                    child: Row(children: [
                      Image.asset(AppConfigs.appLogo, height: 50.h),
                      Text.rich(TextSpan(
                          text: AppConfigs.appName.toUpperCase(),
                          style: GetTextTheme.sf16_Bold
                              .copyWith(color: AppColors.primaryColor),
                          children: [
                            TextSpan(
                                text: " Live 15k+ Viewers",
                                style: GetTextTheme.sf14_Regular
                                    .copyWith(color: AppColors.whiteColor)),
                          ])),
                      const Spacer(),
                      InkWell(
                          onTap: () => AppServices.popView(context),
                          child: Row(children: [
                            const Icon(Icons.logout,
                                size: 20, color: AppColors.whiteColor),
                            Text("Exit",
                                style: GetTextTheme.sf14_Bold
                                    .copyWith(color: AppColors.whiteColor))
                          ]))
                    ])),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: AppServices.getScreenWidth(context) * 0.75,
                        height: AppServices.getScreenHeight(context) * 0.4,
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Column(children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                            leading: const CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    AppImages.femaleModel)),
                                            title: Text("Hamza Patel 22 Dubai",
                                                style: GetTextTheme.sf14_Regular
                                                    .copyWith(
                                                        color: AppColors
                                                            .whiteColor
                                                            .withOpacity(0.7))),
                                            subtitle: Text(
                                                "This teacher is so amazing. Her eyes are little scary.",
                                                style: GetTextTheme.sf14_Bold
                                                    .copyWith(
                                                        color: AppColors
                                                            .whiteColor
                                                            .withOpacity(
                                                                0.85))))
                                      ]),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        ListTile(
                                            title: Text(
                                                "Kety Kate 12 South Africa",
                                                textAlign: TextAlign.end,
                                                style: GetTextTheme.sf14_Regular
                                                    .copyWith(
                                                        color: AppColors
                                                            .whiteColor
                                                            .withOpacity(0.7))),
                                            subtitle: Text("Hello everyone",
                                                textAlign: TextAlign.end,
                                                style: GetTextTheme.sf14_Bold
                                                    .copyWith(
                                                        color: AppColors
                                                            .whiteColor
                                                            .withOpacity(
                                                                0.85))),
                                            trailing: const CircleAvatar(
                                                backgroundImage:
                                                    AssetImage(AppImages.femaleModel)))
                                      ])
                                ])))),
                    AppServices.addHeight(15.h),
                    Row(
                      children: [
                        Expanded(
                            child: TextField(
                                decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: InkWell(
                                        onTap: () {},
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
                                    fillColor:
                                        AppColors.blackColor.withOpacity(0.5),
                                    filled: true,
                                    hintText: "Comment...",
                                    hintStyle: GetTextTheme.sf14_Regular
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.whiteColor
                                                .withOpacity(0.6)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.r),
                                        borderSide: BorderSide.none)))),
                        AppServices.addWidth(15.w),
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  constraints: BoxConstraints.expand(
                                      height:
                                          AppServices.getScreenHeight(context) *
                                              0.6),
                                  backgroundColor:
                                      AppColors.blackColor.withOpacity(0.5),
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.r),
                                          topRight: Radius.circular(30.r))),
                                  context: context,
                                  builder: ((context) {
                                    return const StickersBottomSheet();
                                  }));
                            },
                            child: Image.asset(AppImages.giftBoxImage,
                                height: 50.w))
                      ],
                    ),
                    AppServices.addHeight(15.h),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.blackColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(40.r)),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: AppColors.blackColor.withOpacity(0.5)),
                            child: Row(
                              children: [
                                Image.asset(AppImages.diamondImage,
                                    height: 20.h),
                                AppServices.addWidth(5.w),
                                Text(
                                  "95 /..",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GetTextTheme.sf12_Bold
                                      .copyWith(color: AppColors.whiteColor),
                                )
                              ],
                            ),
                          ),
                          AppServices.addWidth(5.w),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 9.h),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(40.r)),
                              child: Row(
                                children: [
                                  Image.asset(AppImages.diamondImage,
                                      height: 20.h),
                                  AppServices.addWidth(5.w),
                                  Text("2500", style: GetTextTheme.sf12_Bold),
                                  Text(" : You Ha",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GetTextTheme.sf12_Regular)
                                ],
                              ),
                            ),
                          ),
                          AppServices.addWidth(5.w),
                          ExpandedButtonView(
                            btnName: "Add Diamond",
                            onPress: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  constraints: BoxConstraints.expand(
                                      height:
                                          AppServices.getScreenHeight(context) *
                                              0.6),
                                  backgroundColor:
                                      AppColors.blackColor.withOpacity(0.6),
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.r),
                                          topRight: Radius.circular(30.r))),
                                  context: context,
                                  builder: ((context) {
                                    return const DiamondShop();
                                  }));
                            },
                            bgColor: AppColors.primaryColor,
                            txtColor: AppColors.blackColor,
                            radius: 40.r,
                            padding: 5.h,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
