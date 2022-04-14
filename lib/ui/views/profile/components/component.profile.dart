import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../constant/pallete.const.dart';

class ProfileCompoenent extends StatelessWidget {
  String title;
  String pic;
  ProfileCompoenent({required this.title, required this.pic});
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
              width: 20.w,
            ),
            SvgPicture.asset(
              this.pic,
            ),
            SizedBox(
              width: 13.w,
            ),
            Text(
              this.title,
              style: TextStyle(
                color: title != "delete_account".tr
                    ? Pallete.greyText
                    : Color.fromRGBO(235, 87, 87, 1),
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
        title != "delete_account".tr
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
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
