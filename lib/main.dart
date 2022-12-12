import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_people/app_config.dart';
import 'package:meet_people/helpers/styleSheet.dart';
import 'package:meet_people/screens/auth/sign_up.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                    child: Text("App is being initialized",
                        style: GetTextTheme.sf25_Bold)),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                    child: Text("An error has been occured",
                        style: GetTextTheme.sf25_Bold
                            .copyWith(color: AppColors.redColor))),
              ),
            );
          }
          return ScreenUtilInit(
            builder: (context, child) => const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SignUp(),
            ),
            splitScreenMode: false,
            designSize:
                const Size(AppConfigs.designWidth, AppConfigs.designHeight),
          );
        });
  }
}
