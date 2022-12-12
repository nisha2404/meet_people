import 'package:flutter/material.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/models/call.dart';
import 'package:meet_people/resources/call_methods.dart';

import '../../helpers/styleSheet.dart';

class CallScreen extends StatefulWidget {
  final Call call;
  const CallScreen({Key? key, required this.call}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final CallMethods callMethods = CallMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Text("Call has been made"),
      TextButton(
          onPressed: () {
            callMethods.endCall(call: widget.call);
            AppServices.popView(context);
          },
          child: Icon(Icons.call_end, color: AppColors.whiteColor))
    ]));
  }
}
