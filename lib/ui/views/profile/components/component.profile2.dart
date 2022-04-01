import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../constant/pallete.const.dart';

class ProfileCompoenent2 extends StatelessWidget {
  String title;
  bool isRed;
  bool isIcon;

  ProfileCompoenent2({
    required this.title,
    required this.isRed,
    required this.isIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 72, 146, 0.03),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            SizedBox(
              width: 18.w,
            ),
            Text(
              this.title,
              style: TextStyle(
                color:
                    !isRed ? Pallete.greyText : Color.fromRGBO(235, 87, 87, 1),
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
        isIcon
            ? Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 17.sp,
                ),
              )
            : Container(),
      ]),
    );
  }
}
