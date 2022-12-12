// ignore_for_file: avoid_print

import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../components/expanded_btn.dart';
import '../../helpers/baseGetters.dart';
import '../../helpers/icons&images.dart';
import '../../helpers/styleSheet.dart';
import '../Dashboard/LiveStreamingVideo/diamondshop.dart';
import '../Dashboard/LiveStreamingVideo/stickersBottomsheet.dart';

const appId = "1e2947da7f094b72b5d9532a37085078";
const token =
    "007eJxTYPh12nrHsQVPzc33XPLyZFwZO1dc/falqvf/8nnU36hGGugoMBimGlmamKckmqcZWJokmRslmaZYmhobJRqbG1iYGphbsG+amNwQyMjQvuoSCyMDBIL4LAwlqcUlDAwAaJIfXA==";
const channel = "test";

class VideoCallingScreen extends StatefulWidget {
  const VideoCallingScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallingScreen> createState() => _VideoCallingScreenState();
}

class _VideoCallingScreenState extends State<VideoCallingScreen> {
  // static final _users = <int>[];
  // final _infoStrings = <String>[];
  bool muted = false;
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void dispose() {
    // _users.clear();
    _engine.leaveChannel();
    _engine.destroyCustomVideoTrack(_remoteUid!);

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    // if (appId.isEmpty) {
    //   setState(() {
    //     _infoStrings.add(
    //         "App id is missing, please provide your app id in settings.dart");
    //     _infoStrings.add("Agora engine is not starting");
    //   });
    //   return;
    // }

    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.enableAudio();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: token,
      channelId: channel,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // _remoteUid != null?
            SafeArea(
                child: Stack(
      children: [
        Center(
          child: _remoteVideo(),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.blackColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage(AppImages.femaleModel),
                        ),
                        title: Row(children: [
                          Text("Mimi Brown",
                              style: GetTextTheme.sf16_Bold
                                  .copyWith(color: AppColors.whiteColor)),
                          AppServices.addWidth(5.w),
                          Image.asset(
                            AppIcons.checkIcon,
                            height: 25.h,
                          )
                        ]),
                        subtitle: Text(
                          "Las Vegas, USA",
                          style: GetTextTheme.sf14_Regular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor),
                        ),
                        trailing: const Icon(
                          Icons.more_horiz,
                          color: AppColors.whiteColor,
                          size: 35,
                        ))),
                AppServices.addHeight(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 50.h,
                        height: 50.h,
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.blackColor.withOpacity(0.5)),
                        child: Icon(Icons.cameraswitch,
                            size: 25.sp, color: AppColors.whiteColor),
                      ),
                    ),
                  ],
                ),
                AppServices.addHeight(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 50.h,
                        height: 50.h,
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.blackColor.withOpacity(0.5)),
                        child: Icon(Icons.mic,
                            size: 25.sp, color: AppColors.whiteColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppServices.addHeight(15.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    constraints: BoxConstraints.expand(
                                        height: AppServices.getScreenHeight(
                                                context) *
                                            0.6),
                                    backgroundColor:
                                        AppColors.blackColor.withOpacity(0.5),
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.r),
                                            topRight: Radius.circular(30.r))),
                                    context: context,
                                    builder: ((context) {
                                      return const StickersBottomSheet();
                                    }));
                              },
                              child: Container(
                                width: 65.w,
                                height: 65.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.whiteColor),
                                child: Image.asset(AppImages.giftBoxImage,
                                    height: 65.w),
                              )),
                          InkWell(
                              onTap: () {
                                AppServices.popView(context);
                              },
                              child: Container(
                                width: 65.w,
                                height: 65.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.whiteColor),
                                child: Image.asset(AppImages.callDownImg,
                                    height: 65.w),
                              ))
                        ],
                      ),
                    ),
                    AppServices.addWidth(20.w),
                    Container(
                        height: 200.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: _localUserJoined
                              ? AgoraVideoView(
                                  controller: VideoViewController(
                                      rtcEngine: _engine,
                                      canvas: const VideoCanvas(uid: 0)))
                              : const CircularProgressIndicator(),
                        ))
                  ],
                ),
                AppServices.addHeight(15.h),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.blackColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(40.r)),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.blackColor.withOpacity(0.5)),
                        child: Row(
                          children: [
                            Image.asset(AppImages.diamondImage, height: 20.h),
                            AppServices.addWidth(5.w),
                            Text(
                              "95 /..",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GetTextTheme.sf12_Bold
                                  .copyWith(color: AppColors.whiteColor),
                            )
                          ],
                        ),
                      ),
                      AppServices.addWidth(5.w),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 9.h),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(40.r)),
                          child: Row(
                            children: [
                              Image.asset(AppImages.diamondImage, height: 20.h),
                              AppServices.addWidth(5.w),
                              Text("2500", style: GetTextTheme.sf12_Bold),
                              Text(" : You Ha",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GetTextTheme.sf12_Regular)
                            ],
                          ),
                        ),
                      ),
                      AppServices.addWidth(5.w),
                      ExpandedButtonView(
                        btnName: "Add Diamond",
                        onPress: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              constraints: BoxConstraints.expand(
                                  height: AppServices.getScreenHeight(context) *
                                      0.6),
                              backgroundColor:
                                  AppColors.blackColor.withOpacity(0.6),
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.r),
                                      topRight: Radius.circular(30.r))),
                              context: context,
                              builder: ((context) {
                                return const DiamondShop();
                              }));
                        },
                        bgColor: AppColors.primaryColor,
                        txtColor: AppColors.blackColor,
                        radius: 40.r,
                        padding: 5.h,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ))
        // : const CallingScreen(),
        );
  }

  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
          controller: VideoViewController.remote(
              rtcEngine: _engine,
              canvas: VideoCanvas(uid: _remoteUid),
              connection: const RtcConnection(channelId: channel)));
    } else {
      return Text("Wait until the remote user join the call.",
          textAlign: TextAlign.center,
          style:
              GetTextTheme.sf20_Bold.copyWith(color: AppColors.primaryColor));
    }
  }
}
