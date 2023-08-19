import 'package:flutter/material.dart';
import 'package:talk_app/const/colors.dart';
import 'package:talk_app/const/fonts.dart';

Widget reuableTextFormField(context,
    {required TextEditingController? textCotroller,
    required FormFieldSetter onFieldSubmitedValue,
    required FormFieldValidator onFieldValidator,
    required TextInputType keyBoardType,
    required String? hint,
    required FocusNode focusNode,
    required bool obscureText,
    final bool? enable,
    autofocuse}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
    ),
    child: TextFormField(
      obscureText: obscureText,
      cursorColor: orangeLight,
      controller: textCotroller,
      keyboardType: keyBoardType,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitedValue,
      validator: onFieldValidator,
      decoration: InputDecoration(
          focusColor: redDark,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: orangeLight)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: orangeLight)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: orangeLight)),
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: poppinsLight)),
    ),
  );
}
