import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokpractice/controllers/auth_controller.dart';
import 'package:tiktokpractice/views/screens/auth/login_screen.dart';
import 'package:tiktokpractice/views/screens/auth/signup_screen.dart';
import 'constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: BACKGROUND_COLOR,
      ),
      // home: SignUpScreen(),
      home: LoginScreen(),
    );
  }
}
