// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meet_people/screens/Dashboard/LiveStreamingVideo/liveVideoStreaming.dart';

import '../../helpers/baseGetters.dart';
import '../../helpers/icons&images.dart';
import '../../helpers/styleSheet.dart';

class LiveStreamTab extends StatefulWidget {
  const LiveStreamTab({Key? key}) : super(key: key);

  @override
  State<LiveStreamTab> createState() => _LiveStreamTabState();
}

class _LiveStreamTabState extends State<LiveStreamTab> {
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
                  (index) => AspectRatio(
                        aspectRatio: index % 2 != 0 ? 0.9 : 0.7,
                        child: InkWell(
                          onTap: () {
                            AppServices.pushTo(
                                context, const LiveVideoStreamingScreen());
                          },
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
                                      color:
                                          AppColors.blackColor.withOpacity(0.8),
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
                                            height: 20,
                                            width: 20,
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
                                top: 5,
                                right: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: AppColors.blackColor
                                          .withOpacity(0.5)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                      AppServices.addWidth(5.w),
                                      Text("12k +",
                                          style: GetTextTheme.sf12_Bold
                                              .copyWith(
                                                  color: AppColors.whiteColor))
                                    ],
                                  ),
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
