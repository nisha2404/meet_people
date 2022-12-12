import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/styleSheet.dart';
import 'package:meet_people/resources/call_methods.dart';

import '../../../models/call.dart';
import '../call_screen.dart';

class PickUpScreen extends StatelessWidget {
  final Call call;
  final CallMethods callMethods = CallMethods();
  PickUpScreen({Key? key, required this.call}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 100.h),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("incoming....", style: GetTextTheme.sf32_Bold),
              AppServices.addHeight(50.h),
              Image.network(call.callerPic!, height: 150.h, width: 150.w),
              AppServices.addHeight(15.h),
              Text(call.callerName!, style: GetTextTheme.sf20_Bold),
              AppServices.addHeight(75.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                    onPressed: () async {
                      await callMethods.endCall(call: call);
                    },
                    icon: Icon(Icons.call_end, color: AppColors.redColor)),
                AppServices.addWidth(25.w),
                IconButton(
                    onPressed: () {
                      AppServices.pushTo(context, CallScreen(call: call));
                    },
                    icon: Icon(Icons.call),
                    color: AppColors.primaryColor)
              ])
            ])));
  }
}
