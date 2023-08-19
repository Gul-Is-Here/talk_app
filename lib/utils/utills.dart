import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talk_app/const/colors.dart';

class Utils {
  // -----> Field Focuse Method  <-------
  static fieldFocuse(context, FocusNode currentNode, FocusNode targertNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(targertNode);
  }

  // ----------> Show Toast Message  <-----------
  static toastMessage(message) {
    Fluttertoast.showToast(msg: message, backgroundColor: blackColor);
  }
}
