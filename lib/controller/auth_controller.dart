import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talk_app/utils/utills.dart';
import 'package:talk_app/views/home/home_screen.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController usernameController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // -----------> Sign up Method  <--------
  Future<void> signup(String username, String email, String password) async {
    isLoading(true);
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Utils.toastMessage('Please verify your email');
        auth.currentUser!.sendEmailVerification();

        isLoading(false);
      }).onError((error, stackTrace) {
        isLoading(false);

        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      isLoading(false);
      Utils.toastMessage(e.toString());
    }
  }

  // -----------> Login Method  <----------
  Future<void> loginMetod(
      String username, String email, String password) async {
    isLoading(true);
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (auth.currentUser != null) {
          if (auth.currentUser!.emailVerified) {
            firestore.collection("users").doc().set({
              'id': auth.currentUser!.uid,
              'username': username,
              'email': email,
              'password': password,
              'onlineStatus': 'noOne',
              'phone': '',
              'profile': ''
            });
            Get.to(() => HomeScreen());
          } else {
            Utils.toastMessage("Verify your email");
          }
        }

        isLoading(false);
      }).onError((error, stackTrace) {
        isLoading(false);

        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      isLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
}
