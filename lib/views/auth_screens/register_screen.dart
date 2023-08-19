import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talk_app/const/colors.dart';
import 'package:talk_app/const/fonts.dart';
import 'package:talk_app/const/image.dart';
import 'package:talk_app/controller/auth_controller.dart';
import 'package:talk_app/utils/utills.dart';
import 'package:talk_app/views/auth_screens/login_screen.dart';
import 'package:talk_app/widgets/resuable_button.dart';
import 'package:talk_app/widgets/reuseable_textformfield.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode passwordFocuseNode = FocusNode();
  FocusNode usernameFocuseNode = FocusNode();
  FocusNode emailFocuseNode = FocusNode();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocuseNode.dispose();
    passwordFocuseNode.dispose();
    usernameFocuseNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: orangeLight,
        title: "Sign Up".text.make(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              "Sign Up to Talk App and connect with your \n friends and family."
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
                        textCotroller: controller.usernameController,
                        onFieldSubmitedValue: (value) {
                      Utils.fieldFocuse(
                          context, usernameFocuseNode, emailFocuseNode);
                    }, onFieldValidator: (value) {
                      return value.isEmpty ? "Enter username" : null;
                    },
                        keyBoardType: TextInputType.emailAddress,
                        hint: "Username",
                        focusNode: usernameFocuseNode,
                        obscureText: false),
                    20.heightBox,
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
                        obscureText: true),
                    10.heightBox,
                    Center(
                      child: Obx(
                        () => roundedButton(context, title: "Sign Up",
                            ontap: () {
                          if (_formkey.currentState!.validate()) {
                            controller
                                .signup(
                                    controller.usernameController.text,
                                    emailController.text,
                                    passwordController.text)
                                .then((value) {
                              Get.off(() => const LoginScreen());
                            });
                          }
                        },
                            color: redDark,
                            textColor: whiteColor,
                            isloading: controller.isLoading.value),
                      ),
                    ),
                    const Text.rich(TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(fontFamily: poppinsLight),
                        children: [
                          TextSpan(
                              text: "Login",
                              style: TextStyle(
                                  fontFamily: poppinsRegular,
                                  decoration: TextDecoration.underline))
                        ])).onTap(() {
                      Get.to(() => const LoginScreen());
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
