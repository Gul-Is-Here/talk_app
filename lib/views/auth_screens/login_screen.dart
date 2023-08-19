import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talk_app/const/colors.dart';
import 'package:talk_app/const/fonts.dart';
import 'package:talk_app/const/image.dart';
import 'package:talk_app/controller/auth_controller.dart';
import 'package:talk_app/utils/utills.dart';
import 'package:talk_app/views/auth_screens/register_screen.dart';
import 'package:talk_app/views/home/home_screen.dart';
import 'package:talk_app/widgets/resuable_button.dart';
import 'package:talk_app/widgets/reuseable_textformfield.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocuseNode = FocusNode();
  FocusNode emailFocuseNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: "Login".text.make(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    chatlogo,
                    height: height * .25,
                  ),
                  10.heightBox,
                  "Welcome to Talk App"
                      .text
                      .fontFamily(poppindSemiBold)
                      .size(22)
                      .make(),
                  10.heightBox,
                  "Login to Talk App and connect with your \n friends and family."
                      .text
                      .fontFamily(poppinsLight)
                      .align(TextAlign.center)
                      .make(),
                  10.heightBox,
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        reuableTextFormField(context,
                            textCotroller: emailController,
                            onFieldSubmitedValue: (value) {
                          Utils.fieldFocuse(
                              context, emailFocuseNode, passwordFocuseNode);
                        }, onFieldValidator: (value) {
                          return value.isEmpty ? "Enter valid email" : null;
                        },
                            keyBoardType: TextInputType.emailAddress,
                            hint: "Email",
                            focusNode: emailFocuseNode,
                            obscureText: false),
                        20.heightBox,
                        reuableTextFormField(context,
                            textCotroller: passwordController,
                            onFieldSubmitedValue: (value) {},
                            onFieldValidator: (value) {
                          return value.length < 6
                              ? "Enter atleast 6 character"
                              : null;
                        },
                            keyBoardType: TextInputType.emailAddress,
                            hint: "Password",
                            focusNode: passwordFocuseNode,
                            obscureText: false),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {},
                              child: "Forget Password"
                                  .text
                                  .color(blackColor)
                                  .make()),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Obx(
                      () => roundedButton(context, title: "Login", ontap: () {
                        if (_formkey.currentState!.validate()) {
                          controller.loginMetod(
                              controller.usernameController.text,
                              emailController.text,
                              passwordController.text);
                        }
                      
                      },
                          color: redDark,
                          textColor: whiteColor,
                          isloading: controller.isLoading.value),
                    ),
                  ),
                  const Text.rich(TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(fontFamily: poppinsLight),
                      children: [
                        TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                                fontFamily: poppinsRegular,
                                decoration: TextDecoration.underline))
                      ])).onTap(() {
                    Get.to(() => const RegisterScreen());
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
