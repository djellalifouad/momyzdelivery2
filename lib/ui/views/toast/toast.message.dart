import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momyzdelivery/constant/pallete.const.dart';

showMessage(String text) {
  Get.snackbar(
    text,
    "",
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    duration: Duration(seconds: 10),
    titleText: Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
    backgroundColor: Pallete.pinkColorPrinciple,
  );
  return;
  print("test");
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Pallete.pinkColorPrinciple,
      textColor: Colors.white,
      fontSize: 12.0);

  return;
}

