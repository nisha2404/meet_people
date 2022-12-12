import 'dart:math';

import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/models/call.dart';
import 'package:meet_people/resources/call_methods.dart';
import 'package:meet_people/screens/videoCall/call_screen.dart';

import '../models/user_model.dart';

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({User? from, User? to, context}) async {
    Call call = Call(
      callerId: from!.uid,
      callerName: from.name,
      callerPic: from.profilePhoto,
      receiverId: to!.uid,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialed = true;

    if (callMade) {
      AppServices.pushTo(context, CallScreen(call: call));
    }
  }
}
