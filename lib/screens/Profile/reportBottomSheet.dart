// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/components/expanded_btn.dart';
import 'package:meet_people/components/textfield_primary.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/styleSheet.dart';

class ReportBottomSheet extends StatefulWidget {
  const ReportBottomSheet({Key? key}) : super(key: key);

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: AppColors.blackColor,
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          centerTitle: true,
          shape: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r))),
          title: Text("Report", style: GetTextTheme.sf18_Bold),
          actions: [
            IconButton(
                onPressed: () {
                  AppServices.popView(context);
                },
                icon: const Icon(Icons.close))
          ],
        ),
        Expanded(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reason for report",
                        style: GetTextTheme.sf16_Bold
                            .copyWith(color: AppColors.greyColor)),
                    AppServices.addHeight(10.h),
                    TextFieldPrimary(maxlines: 2),
                    AppServices.addHeight(20.h),
                    Text("How it hurts you",
                        style: GetTextTheme.sf16_Bold
                            .copyWith(color: AppColors.greyColor)),
                    AppServices.addHeight(10.h),
                    TextFieldPrimary(maxlines: 6),
                    AppServices.addHeight(20.h),
                    Row(children: [
                      ExpandedButtonView(
                          btnName: "REPORT", onPress: () {}, radius: 40.r)
                    ]),
                    AppServices.addHeight(30.h),
                    Text(
                        "By clicking this submit button, you agree that you are taking all the responsibilities of all the progress that may be done by us or the content uploader. Click the link below to know more about that.",
                        textAlign: TextAlign.center,
                        style: GetTextTheme.sf12_Regular
                            .copyWith(color: AppColors.greyColor)),
                    AppServices.addHeight(10.h),
                    Row(
                      children: [
                        ExpandedButtonView(
                            btnName: "Privacy Policy",
                            onPress: () {},
                            bgColor: Colors.transparent)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
