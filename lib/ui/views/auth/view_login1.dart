import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:momyzdelivery/controller/controller.carInformationController.dart';
import 'package:momyzdelivery/ui/views/auth/view_forget_password.dart';
import 'package:momyzdelivery/ui/views/auth/view_login2.dart';

import '../../../constant/pallete.const.dart';
import '../../../controller/controller.login.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';
import '../toast/toast.message.dart';

class Login1View extends StatelessWidget {
  const Login1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

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
                      Directionality(
                        textDirection: Get.locale!.countryCode == "AR"
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: IntlPhoneField(
                          enabled: true,
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
                            if (val!.completeNumber.length < 12) {
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
                          controller: loginController.phoneController,
                          initialCountryCode: '972',
                          onCountryChanged: (val) {
                            loginController.updateCountryCode(val.dialCode);
                          },
                          onChanged: (phone) {},
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'password'.tr,
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
                        title: 'password'.tr,
                        icon: 'assets/icons/profile.svg',
                        icon2: '',
                        validator: (val) {
                          if (val!.length < 8) {
                            return "password_confirm".tr;
                          }
                        },
                        textEditingController:
                            loginController.passwordController,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(ForgetPasswordWidget());
                        },
                        child: Text(
                          'forget_password'.tr,
                          style: TextStyle(
                            color: Pallete.pinkColorPrinciple,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 140.h,
                      ),
                      GetBuilder<LoginController>(
                        builder: (_) => !loginController.isCheckingPhone
                            ? ButtonComponent('login'.tr, () {
                                loginController.checkPhone();
                              })
                            : Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(Login2View());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'not_have_account'.tr + " ",
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
                      SizedBox(
                        height: 21.h,
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
