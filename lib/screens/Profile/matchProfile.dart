// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/components/expanded_btn.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/screens/Chats/messages.dart';
import 'package:meet_people/screens/Profile/reportBottomSheet.dart';
import 'package:meet_people/screens/videoCall/calling.dart';
import 'package:meet_people/screens/videoCall/video_calling.dart';
import 'package:meet_people/services/base_components.dart';

import '../../helpers/styleSheet.dart';

class MatchProfileScreen extends StatefulWidget {
  const MatchProfileScreen({Key? key}) : super(key: key);

  @override
  State<MatchProfileScreen> createState() => _MatchProfileScreenState();
}

class _MatchProfileScreenState extends State<MatchProfileScreen> {
  List<String> images = [
    AppImages.femaleModel,
    AppImages.femaleModel1,
    AppImages.femaleModel2,
    AppImages.femaleModel3,
  ];

  bool isBookmarked = false;

  int currentIndex = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.blackColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mimi Brown 24", style: GetTextTheme.sf20_Bold),
            AppServices.addWidth(5.h),
            Image.asset(AppIcons.checkIcon, height: 25.h)
          ],
        ),
        actions: [
          IconButton(
              splashRadius: 20.r,
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, size: 30))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  carouselController: _controller,
                  items: images
                      .map((e) => Container(
                            width: AppServices.getScreenWidth(context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.asset(
                                e,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 1,
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      setState(() => currentIndex = index);
                    },
                  )),
              AppServices.addHeight(15.h),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: images
                      .asMap()
                      .entries
                      .map((e) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: currentIndex == e.key ? 35.w : 25.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                              color: currentIndex == e.key
                                  ? AppColors.primaryColor
                                  : AppColors.greyColor,
                              borderRadius: BorderRadius.circular(10.r))))
                      .toList()),
              AppServices.addHeight(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        AppServices.pushTo(context, const MessageScreen());
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 20.w),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Image.asset(AppIcons.chatsIcon, height: 30.h)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        AppServices.pushTo(context, const VideoCallingScreen());
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Image.asset(AppIcons.videoCameraIcon,
                              height: 30.h)),
                    ),
                  ),
                ],
              ),
              AppServices.addHeight(15.h),
              Row(
                children: [
                  Text("Mimi Brown", style: GetTextTheme.sf18_Bold),
                  AppServices.addWidth(10.w),
                  Image.asset(AppIcons.checkIcon, height: 25.h),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() => isBookmarked = !isBookmarked);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        width: AppServices.getScreenWidth(context) * 0.1.w,
                        height: AppServices.getScreenWidth(context) * 0.1.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor),
                        child: Icon(
                            isBookmarked == false
                                ? Icons.bookmark_border
                                : Icons.bookmark,
                            size: 20)),
                  )
                ],
              ),
              Text(
                  "Nam convallis orci sed tempor mattis. In ut tempus enim. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut a viverra urna.",
                  style: GetTextTheme.sf14_Regular
                      .copyWith(color: AppColors.greyColor)),
              AppServices.addHeight(15.h),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      width: AppServices.getScreenWidth(context) * 0.1.w,
                      height: AppServices.getScreenWidth(context) * 0.1.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor),
                      child: const Icon(Icons.home, size: 20)),
                  AppServices.addWidth(5.w),
                  Text("New York, USA",
                      style: GetTextTheme.sf16_Bold.copyWith(
                          color: AppColors.greyColor.withOpacity(0.8)))
                ],
              ),
              AppServices.addHeight(25.h),
              Text(
                "Video Gallery",
                style: GetTextTheme.sf18_Bold,
              ),
              AppServices.addHeight(15.h),
              SizedBox(
                  height: 100.sp,
                  child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              AppImages.femaleModel1),
                                          fit: BoxFit.cover)),
                                  child: Center(
                                    child: Image.asset(AppImages.playButtonImg,
                                        height: 45.h),
                                  )),
                            ),
                          ))),
              AppServices.addHeight(15.h),
              Text(
                "About",
                style: GetTextTheme.sf18_Bold,
              ),
              AppServices.addHeight(10.h),
              Text(
                  "Nam convallis orci sed tempor mattis. In ut tempus enim. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut a viverra urna.",
                  style: GetTextTheme.sf14_Regular
                      .copyWith(color: AppColors.greyColor)),
              AppServices.addHeight(20.h),
              Text(
                "Interest",
                style: GetTextTheme.sf18_Bold,
              ),
              AppServices.addHeight(10.h),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: List.generate(
                    6,
                    (index) => Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 7.h),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          "Music",
                          style: GetTextTheme.sf14_Bold,
                        ))),
              ),
              AppServices.addHeight(20.h),
              Row(
                children: [
                  ExpandedButtonView(
                      btnName: "CHAT WITH NATALIA",
                      onPress: () {
                        AppServices.pushTo(context, const MessageScreen());
                      })
                ],
              ),
              AppServices.addHeight(10.h),
              Row(
                children: [
                  ExpandedButtonView(
                    btnName: "SHARE NATALIA'S PROFILE",
                    onPress: () {
                      share("Meet People", "https://Google.com");
                    },
                    bgColor: AppColors.grey50,
                  )
                ],
              ),
              AppServices.addHeight(10.h),
              Row(
                children: [
                  ExpandedButtonView(
                    btnName: "REPORT NATALIA",
                    onPress: () {
                      showModalBottomSheet(
                          shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r))),
                          isScrollControlled: true,
                          constraints: BoxConstraints.expand(
                              height:
                                  AppServices.getScreenHeight(context) * 0.95),
                          context: context,
                          builder: (context) => const ReportBottomSheet());
                    },
                    bgColor: Colors.transparent,
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
