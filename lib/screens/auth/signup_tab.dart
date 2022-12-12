// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/components/custom_card_tile.dart';
import 'package:meet_people/components/expanded_btn.dart';
import 'package:meet_people/helpers/baseGetters.dart';
import 'package:meet_people/helpers/icons&images.dart';
import 'package:meet_people/screens/BottomNavBar.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({Key? key}) : super(key: key);

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  bool isObsecure = true;
  bool isLoading = false;
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  signUphandler() async {
    try {
      setState(() {
        isLoading = true;
      });
      var date = DateTime.now();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text, password: _password.text);
      await user
          .add({
            'email': _email.text,
            'uid': int.parse('${date.hour}${date.minute}${date.second}'),
            'password': _password.text,
            'username': _username.text
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      AppServices.pushTo(context, const BottomNavBar());
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const SnackBar(content: Text("Email is already in use"));
      }
    } catch (e) {
      return SnackBar(content: Text("An Error Occured $e"));
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
                  controller: _username, fieldName: "Username", hint: "user"),
              CustomCardTile(
                  fieldName: "Email",
                  hint: "user@gmail.com",
                  controller: _email),
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
              CustomCardTile(
                  fieldName: "Confirm Password",
                  hint: "user@123",
                  isObsecureText: true),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Row(
                  children: [
                    ExpandedButtonView(
                        btnName: "Sign Up",
                        onPress: () {
                          signUphandler();
                        },
                        radius: 40.r,
                        padding: 18.h),
                  ],
                ),
              ),
              isLoading == true ? CircularProgressIndicator() : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
