import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/components/expanded_btn.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/helpers/styleSheet.dart';
import 'package:meet_people/screens/Dashboard/Wallet/wallet.dart';

class BuyDiamondDialog extends StatefulWidget {
  const BuyDiamondDialog({Key? key}) : super(key: key);

  @override
  State<BuyDiamondDialog> createState() => _BuyDiamondDialogState();
}

class _BuyDiamondDialogState extends State<BuyDiamondDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
      title: Text("BUY DIAMONDS",
          textAlign: TextAlign.center, style: GetTextTheme.sf18_Bold),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(20.sp),
            width: 80.w,
            height: 80.w,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.primaryColor),
            child: Image.asset(AppImages.diamondImage),
          ),
          AppServices.addHeight(15.h),
          Text(
              "You don't have enough diamonds to continue chatting, please purchase some diamonds and enjoy the chatting.",
              textAlign: TextAlign.center,
              style: GetTextTheme.sf16_Regular
                  .copyWith(color: AppColors.greyColor)),
          AppServices.addHeight(20.h),
          Row(
            children: [
              ExpandedButtonView(
                  btnName: "BUY DIAMONDS",
                  onPress: () {
                    AppServices.pushTo(context, const WalletScreen());
                  },
                  padding: 10.h)
            ],
          ),
          AppServices.addHeight(5.h),
          Row(
            children: [
              ExpandedButtonView(
                  btnName: "Cancel",
                  onPress: () {
                    AppServices.popView(context);
                  },
                  padding: 10.h,
                  bgColor: Colors.transparent,
                  txtColor: AppColors.greyColor)
            ],
          )
        ],
      ),
    );
  }
}
