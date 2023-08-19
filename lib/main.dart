import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talk_app/const/colors.dart';
import 'package:talk_app/const/fonts.dart';
import 'package:talk_app/views/auth_screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                color: orangeLight,
                centerTitle: true,
                titleTextStyle: TextStyle(
                    fontFamily: poppindSemiBold,
                    color: Colors.white,
                    fontSize: 20)),
            primaryColor: orangeLight,
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                  fontSize: 40,
                  fontFamily: poppinsMedium,
                  color: darkwhite,
                  fontWeight: FontWeight.w500,
                  height: 1.6),
              displayMedium: TextStyle(
                  fontSize: 32,
                  fontFamily: poppinsMedium,
                  color: darkwhite,
                  fontWeight: FontWeight.w500,
                  height: 1.6),
              displaySmall: TextStyle(
                  fontSize: 28,
                  fontFamily: poppinsMedium,
                  color: darkwhite,
                  fontWeight: FontWeight.w500,
                  height: 1.6),
              headlineMedium: TextStyle(
                  fontSize: 24,
                  fontFamily: poppinsMedium,
                  color: darkwhite,
                  fontWeight: FontWeight.w500,
                  height: 1.6),
              headlineSmall: TextStyle(
                  fontSize: 20,
                  fontFamily: poppinsMedium,
                  color: darkwhite,
                  fontWeight: FontWeight.w500,
                  height: 1.6),
              titleLarge: TextStyle(
                  fontSize: 17,
                  fontFamily: poppinsMedium,
                  color: darkwhite,
                  fontWeight: FontWeight.w600,
                  height: 1.6),
              bodyLarge: TextStyle(
                  fontSize: 17,
                  fontFamily: poppindSemiBold,
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                  height: 1.6),
              bodyMedium: TextStyle(
                  fontSize: 14,
                  fontFamily: poppinsRegular,
                  color: blackColor,
                  height: 1.6),
            ),
            // primarySwatch: redDark
            canvasColor: Colors.white
            // colorScheme: ColorScheme.fromSeed(seedColor: ),
            // useMaterial3: true,
            ),
        home: const SplashScreen());
  }
}
