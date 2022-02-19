import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../constant/pallete.const.dart';

class TextFormFieldComponent extends StatelessWidget {
  String title;
  String icon;
  String icon2;
  TextFormFieldComponent(
      {required this.title, required this.icon, required this.icon2});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints(
          maxHeight: 15.sp,
          maxWidth: title.isNotEmpty ? 45.sp : 30.sp,
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 15.sp,
          maxWidth: title.isNotEmpty ? 75.sp : 30.sp,
        ),
        
        prefixIcon: icon.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(right: 15.w, left: 10.w),
                child: SvgPicture.asset(
                  icon,
                ),
              )
            : Container(),
        suffixIcon: icon2.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(left: 20.w, right: 10.w),
                child: SvgPicture.asset(
                  icon2,
                ),
              )
            : Container(),
        filled: true,
        fillColor: Color.fromRGBO(252, 250, 250, 1),
        hintText: title,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Pallete.pinkColorPrinciple),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(189, 189, 189, 1)),
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
    );
  }
}
