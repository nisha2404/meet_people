// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/helpers/styleSheet.dart';
import 'package:meet_people/screens/Match/match.dart';
import 'package:meet_people/screens/Profile/matchProfile.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(
                  8,
                  (index) => InkWell(
                        onTap: () {
                          AppServices.pushTo(
                              context, const MatchProfileScreen());
                        },
                        child: AspectRatio(
                          aspectRatio: index % 2 != 0 ? 0.9 : 0.7,
                          child: Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(AppImages.femaleModel),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.8),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          const Text.rich(TextSpan(
                                              text: "Rosy Jones",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(
                                                    text: "\t24",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400))
                                              ])),
                                          const SizedBox(width: 5),
                                          Image.asset(
                                            AppIcons.checkIcon,
                                            height: 20.h,
                                          )
                                        ]),
                                        const Text(
                                          "London",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ]),
                                ),
                              ),
                              Positioned(
                                bottom: 50,
                                left: 10,
                                child: Card(
                                  elevation: 4,
                                  color: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(AppImages.diamondImage,
                                            height: 25.h),
                                        AppServices.addWidth(8.w),
                                        Text.rich(TextSpan(
                                            text: "95",
                                            style: GetTextTheme.sf14_Bold,
                                            children: [
                                              TextSpan(
                                                  text: "/ min",
                                                  style:
                                                      GetTextTheme.sf12_Regular)
                                            ]))
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
