import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../constant/pallete.const.dart';
import 'package:get/get.dart';

class ButtonComponent extends StatelessWidget {
  Function function;
  String title;
  ButtonComponent(
    this.title,
    this.function,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        width: 327.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          color: Pallete.pinkColorPrinciple,
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
