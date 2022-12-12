// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/helpers/styleSheet.dart';
import 'package:meet_people/screens/BottomNavBar.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:permission_handler/permission_handler.dart';

import '../../components/custom_card_tile.dart';
import '../../components/expanded_btn.dart';
import '../../helpers/baseGetters.dart';
import '../../helpers/icons&images.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isLoading = false;
  bool isObsecure = true;
  late RtcEngine engine;

  loginHandler() async {
    try {
      setState(() {
        isLoading = true;
      });
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text, password: _password.text);

      setState(() {
        isLoading = false;
      });
      AppServices.pushTo(context, const BottomNavBar());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print("an error occured Login Error :: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppServices.addHeight(5.h),
              CustomCardTile(
                  controller: _email,
                  fieldName: "Email",
                  hint: "user@gmail.com"),
              CustomCardTile(
                  controller: _password,
                  fieldName: "Password",
                  hint: "user@123",
                  isObsecureText: isObsecure,
                  suffixicon: isObsecure == true
                      ? AppIcons.showPasswordIcon
                      : AppIcons.hidePasswordIcon,
                  onIconPress: () {
                    setState(() => isObsecure = !isObsecure);
                  }),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ExpandedButtonView(
                            btnName: "Login",
                            onPress: () {
                              loginHandler();
                            },
                            radius: 40.r,
                            padding: 18.h),
                      ],
                    ),
                    AppServices.addHeight(10.h),
                    Row(children: [
                      ExpandedButtonView(
                          btnName: "Forgot Password?",
                          onPress: () {},
                          bgColor: Colors.transparent,
                          txtColor: AppColors.primaryColor,
                          radius: 40.r,
                          padding: 18.h)
                    ]),
                    isLoading == true ? CircularProgressIndicator() : SizedBox()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
