import 'package:flutter/material.dart';
import 'package:talk_app/const/colors.dart';
import 'package:talk_app/const/fonts.dart';
import 'package:velocity_x/velocity_x.dart';

Widget roundedButton(context,
    {required VoidCallback ontap,
    required String title,
    bool isloading = false,
    color,
    textColor}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: isloading
          ? const Center(
              child: CircularProgressIndicator(
                color: redDark,
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: color,
              ),
              onPressed: isloading ? null : ontap,
              child: title.text
                  .color(Colors.white)
                  .fontFamily(poppinsMedium)
                  .make()),
    ),
  );
}
