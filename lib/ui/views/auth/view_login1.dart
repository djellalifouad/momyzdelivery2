import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/ui/views/auth/view_login2.dart';

import '../../../constant/pallete.const.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';

class Login1View extends StatelessWidget {
  const Login1View({Key? key}) : super(key: key);

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
                      "welcome".tr,
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
                      "welcome_desc".tr,
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
                      textEditingController: TextEditingController(),
                      validator: (valu){},
                      title: 'enter_phone_number'.tr,
                      icon: 'assets/icons/phone.svg',
                      icon2: '',
                    ),
                    SizedBox(
                      height: 88.h,
                    ),
                    ButtonComponent('login'.tr, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login2View()));
                    }),
                    SizedBox(
                      height: 81.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Login2View());
                      },
                      child: Row(
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
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
