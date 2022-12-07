import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import '../../components/expanded_btn.dart';
import '../../helpers/icons&images.dart';
import '../../helpers/styleSheet.dart';

class CallingScreen extends StatefulWidget {
  const CallingScreen({Key? key}) : super(key: key);

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   getSession();
  // }

  // getSession() {
  //   Future.delayed(Duration(milliseconds: 2000),
  //       () => AppServices.pushTo(context, VideoCallScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          AppServices.addHeight(20.h),
          Text("CALLING",
              style:
                  GetTextTheme.sf20_Bold.copyWith(fontWeight: FontWeight.bold)),
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
                      border: Border.all(width: 8, color: AppColors.greyColor)),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h)
                .copyWith(bottom: 40.h, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Please wait for response",
                    textAlign: TextAlign.center,
                    style: GetTextTheme.sf16_Bold
                        .copyWith(color: AppColors.greyColor)),
                AppServices.addHeight(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Princy Queen", style: GetTextTheme.sf20_Bold),
                    AppServices.addWidth(5.w),
                    Image.asset(AppIcons.checkIcon, height: 25.h)
                  ],
                ),
                AppServices.addHeight(10.h),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: AppColors.blackColor),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.diamondImage, height: 25.h),
                        AppServices.addWidth(10.w),
                        Text.rich(TextSpan(
                            text: "95",
                            style: GetTextTheme.sf16_Bold
                                .copyWith(color: AppColors.whiteColor),
                            children: [
                              TextSpan(
                                  text: " / min",
                                  style: GetTextTheme.sf14_Regular.copyWith(
                                      color: AppColors.whiteColor
                                          .withOpacity(0.8)))
                            ]))
                      ],
                    )),
                AppServices.addHeight(50.h),
                Row(
                  children: [
                    ExpandedButtonView(
                      btnName: "CANCEL",
                      onPress: () {
                        AppServices.popView(context);
                      },
                      bgColor: AppColors.buttonCancelColor,
                      txtColor: AppColors.redColor,
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
