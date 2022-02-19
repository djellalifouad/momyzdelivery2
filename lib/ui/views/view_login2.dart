import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/ui/views/view_login3.dart';

import '../../constant/pallete.const.dart';
import 'components/component_button.dart';
import 'components/component_textField.dart';

class Login2View extends StatelessWidget {
  const Login2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.backGroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 81.h,
                    ),
                    Text(
                      "welcome2".tr,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 28.sp,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "welcome_desc2".tr,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Pallete.greyText,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 71.h,
                    ),
                    Text(
                      'fullName'.tr,
                      style: TextStyle(
                        color: Pallete.greyColorPrinciple,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormFieldComponent(
                      
                      title: 'enter_fullName'.tr,
                      icon: 'assets/icons/profile.svg',
                      icon2: '',
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      'phone_number'.tr,
                      style: TextStyle(
                        color: Pallete.greyColorPrinciple,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormFieldComponent(
                      title: 'enter_phone_number'.tr,
                      icon: 'assets/icons/phone.svg',
                      icon2: '',
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      'address'.tr,
                      style: TextStyle(
                        color: Pallete.greyColorPrinciple,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormFieldComponent(
                      icon2: '',
                      title: 'enter_address'.tr,
                      icon: 'assets/icons/location.svg',
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    ButtonComponent('next_step'.tr, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login3View()));
                    }),
                    SizedBox(
                      height: 48.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'not_have_account'.tr,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'create_account'.tr,
                          style: TextStyle(
                            color: Pallete.pinkColorPrinciple,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
