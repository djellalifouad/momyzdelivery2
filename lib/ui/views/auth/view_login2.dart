import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:momyzdelivery/controller/controller.register.dart';
import 'package:momyzdelivery/ui/views/auth/view_login1.dart';
import 'package:momyzdelivery/ui/views/auth/view_login3.dart';

import '../../../constant/pallete.const.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';

class Login2View extends StatelessWidget {
  const Login2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());
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
              child: Form(
                key: registerController.formKey,
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
                        textEditingController:
                            registerController.nameController,
                        title: 'enter_fullName'.tr,
                        icon: 'assets/icons/profile.svg',
                        icon2: '',
                        validator: (val) {
                          if (val!.length < 4) {
                            return "please_enter_fullName".tr;
                          }
                        },
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
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: IntlPhoneField(
                          keyboardType: TextInputType.phone,
                          autofocus: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          invalidNumberMessage: "please_enter_delivery_type".tr,
                          flagsButtonPadding:
                              EdgeInsets.only(left: 20.w, right: 20.w),
                          cursorColor: Pallete.pinkColorPrinciple,
                          disableLengthCheck: true,
                          showDropdownIcon: false,
                          textAlign: TextAlign.start,
                          validator: (val) {
                            if (val!.length < 12) {
                              return "please_enter_phone_number".tr;
                            }
                          },
                          style: TextStyle(),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 19.h),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Pallete.pinkColorPrinciple),
                              borderRadius: BorderRadius.circular(8.sp),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(8.sp),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(8.sp),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(189, 189, 189, 1)),
                              borderRadius: BorderRadius.circular(8.sp),
                            ),
                          ),
                          controller: registerController.phoneController,
                          initialCountryCode: 'DZ',
                          onCountryChanged: (val) {
                            registerController
                                .updateCountryCode("+" + val.dialCode);
                          },
                          onChanged: (phone) {},
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
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
                        textEditingController:
                            registerController.deliveryTypeController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please_enter_delivery_type".tr;
                          }
                        },
                        icon: '',
                        title: 'enter_delivery_type'.tr,
                        icon2: 'assets/icons/down.svg',
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      GetBuilder<RegisterController>(
                        builder: (_) => !registerController.isCheckingPhone
                            ? ButtonComponent('next_step'.tr, () {
                                registerController.checkPhone();
                              })
                            : Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/notActive.svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          SvgPicture.asset('assets/icons/notActive.svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          SvgPicture.asset('assets/icons/notActive.svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          SvgPicture.asset('assets/icons/Active.svg'),
                        ],
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(Login1View());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'already_have_account'.tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'login'.tr,
                              style: TextStyle(
                                color: Pallete.pinkColorPrinciple,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
