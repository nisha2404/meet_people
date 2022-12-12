import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/components/textfield_primary.dart';

import '../helpers/baseGetters.dart';
import '../helpers/styleSheet.dart';

class CustomCardTile extends StatelessWidget {
  TextEditingController? controller;
  String fieldName, hint;
  bool isObsecureText;
  Function? onIconPress;
  String suffixicon;

  CustomCardTile(
      {Key? key,
      required this.fieldName,
      this.controller,
      this.hint = "",
      this.isObsecureText = false,
      this.suffixicon = "",
      this.onIconPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(239, 250, 250, 250),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(fieldName,
                style: GetTextTheme.sf16_Bold
                    .copyWith(color: AppColors.primaryColor)),
            AppServices.addHeight(10.h),
            TextFieldPrimary(
                controller: controller,
                suffix: suffixicon,
                hint: hint,
                isObsecure: isObsecureText,
                onIconPressed:
                    onIconPress != null ? () => onIconPress!() : null)
          ],
        ),
      ),
    );
  }
}
