import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/pallete.const.dart';
import 'components/component_button.dart';
import 'components/component_textField.dart';
import 'confirmOrder/view_confirmOrder1.dart';

class WaitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.backGroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: SingleChildScrollView(
            child: InkWell(
              onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConfirmOrder()));
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 162.h,
                    ),
                    Center(child: SvgPicture.asset('assets/icons/welcome.svg')),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'thanks_for_registring'.tr,
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Center(
                        child: Text(
                      'thanks_wait'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Pallete.greyText),
                    )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
