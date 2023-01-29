import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokpractice/controllers/auth_controller.dart';
import 'package:tiktokpractice/views/screens/auth/login_screen.dart';
import 'package:tiktokpractice/views/screens/auth/signup_screen.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        //   apiKey: "AIzaSyDADfl5P0WDvD3C7yU7h2Gic7psHyH0LJY",
        //   projectId: "udemysnsapplication0103",
        //   storageBucket: "udemysnsapplication0103.appspot.com",
        //   messagingSenderId: "821295791396",
        //   appId: "1:821295791396:web:ba42b509cb91b162a547b1",
        // ),
        apiKey: "AIzaSyCk2JrQCediB-ENSlSuSDbm2qYXgLcruz0",
        // authDomain: "tiktok-tutorial-0127.firebaseapp.com",
        projectId: "tiktok-tutorial-0127",
        storageBucket: "tiktok-tutorial-0127.appspot.com",
        messagingSenderId: "937471545919",
        appId: "1:937471545919:web:ada69225797b369cf5de8a",
        measurementId: "G-C4ZG6TZB4L"),
  ).then((value) {
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
