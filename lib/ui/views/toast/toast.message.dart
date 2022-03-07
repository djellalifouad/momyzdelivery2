import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momyzdelivery/constant/pallete.const.dart';

showMessage(String text) {
  print("test");
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[200],
      textColor: Colors.black,
      fontSize: 12.0);
  return;
  Get.snackbar(
    text,
    "",
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 5.h),
    borderRadius: 20.r,
    padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 5),
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
}
