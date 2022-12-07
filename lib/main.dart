import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/app_config.dart';
import 'package:meet_people/screens/BottomNavBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
      splitScreenMode: false,
      designSize: const Size(AppConfigs.designWidth, AppConfigs.designHeight),
    );
  }
}
