// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/helpers/styleSheet.dart';

class TextFieldPrimary extends StatelessWidget {
  String hint, suffix;
  TextEditingController? controller;
  Function? onIconPressed;
  bool isObsecure;
  double padding;
  int maxlines;
  TextFieldPrimary(
      {Key? key,
      this.hint = "",
      this.controller,
      this.suffix = '',
      this.isObsecure = false,
      this.padding = 15,
      this.maxlines = 1,
      this.onIconPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      controller: controller,
      obscureText: isObsecure,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.greyColor.withOpacity(0.2),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.r)),
          hintText: hint,
          hintStyle: GetTextTheme.sf14_Regular
              .copyWith(color: const Color.fromARGB(188, 154, 154, 154)),
          suffixIcon: suffix == ''
              ? null
              : IconButton(
                  onPressed:
                      onIconPressed != null ? () => onIconPressed!() : null,
                  iconSize: 18.sp,
                  icon: Image.asset(
                    suffix,
                    height: 18.h,
                  )),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: padding.h)),
    );
  }
}
