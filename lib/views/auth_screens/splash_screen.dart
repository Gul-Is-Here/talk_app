import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talk_app/const/fonts.dart';
import 'package:talk_app/const/image.dart';
import 'package:talk_app/views/home/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(() => const HomeScreen(),
            transition: Transition.circularReveal);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        if (user != null) {
          Get.offAll(() => const LoginScreen(),
              transition: Transition.circularReveal);
        }
      });
    }
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 200,
            )),
        Image.asset(
          chatlogo,
          fit: BoxFit.cover,
        ),
        // 10.heightBox,
        "Lets Talk".text.fontFamily(poppindSemiBold).size(30).make(),
        const Spacer(),
        "@gul-Is-Here".text.fontFamily(poppinsRegular).make(),
        10.heightBox,
      ],
    ));
  }
}
