import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/components/Custom_tab_switch.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/helpers/styleSheet.dart';
import 'package:meet_people/screens/auth/login_tab.dart';
import 'package:meet_people/screens/auth/signup_tab.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int activeTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Column(
        children: [
          Image.asset(AppImages.signUpbg,
              width: AppServices.getScreenWidth(context)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomTabSwitch(
                values: [
                  Text("Login",
                      style: GetTextTheme.sf14_Bold.copyWith(
                          color: activeTabIndex == 0
                              ? AppColors.primaryColor
                              : AppColors.blackColor)),
                  Text("SignUp",
                      style: GetTextTheme.sf14_Bold.copyWith(
                          color: activeTabIndex != 0
                              ? AppColors.primaryColor
                              : AppColors.blackColor))
                ],
                activeIndex: activeTabIndex,
                onValueChange: (value) =>
                    setState(() => activeTabIndex = value),
                width: AppServices.getScreenWidth(context) * 0.4)
          ]),
          AppServices.addHeight(10.h),
          activeTabIndex == 0 ? const LoginTab() : const SignUpTab(),
        ],
      )),
    );
  }
}
