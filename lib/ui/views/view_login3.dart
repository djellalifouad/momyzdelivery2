import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/ui/views/wait_view.dart';

import '../../constant/pallete.const.dart';
import 'components/component_button.dart';
import 'components/component_textField.dart';

class Login3View extends StatelessWidget {
  const Login3View({Key? key}) : super(key: key);

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
                      'delivery_type'.tr,
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
                      icon: '',
                      title: 'enter_delivery_type'.tr,
                      icon2: 'assets/icons/down.svg',
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      'name_vehicule'.tr,
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
                      title: 'enter_name_vehicule'.tr,
                      icon: '',
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      'vehicule_type'.tr,
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
                      title: 'enter_vehicule_type'.tr,
                      icon: '',
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    ButtonComponent('next_step'.tr, () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WaitView()));
                    }),
                    SizedBox(
                      height: 48.h,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
