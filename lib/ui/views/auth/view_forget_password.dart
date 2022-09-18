import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:momyzdelivery/controller/controller.forgetPassword.dart';
import 'package:momyzdelivery/ui/views/auth/view_login2.dart';
import '../../../constant/pallete.const.dart';
import 'package:get/get.dart';

import '../../../controller/controller.login.dart';
import '../components/component_button.dart';

class ForgetPasswordWidget extends StatefulWidget {
  ForgetPasswordWidget({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    final forgetPasswordController = Get.put(ForgetPasswordController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Container(
                      padding: EdgeInsets.all(5.sp),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ))),
            )),
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
                        "forget_password2".tr,
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
                        "forget_password_desc".tr,
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
                          controller: forgetPasswordController.phoneController,
                          initialCountryCode: '972',
                          onCountryChanged: (val) {
                            forgetPasswordController
                                .updateCountryCode(val.dialCode);
                          },
                          onChanged: (phone) {},
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 170.h,
                      ),
                      GetBuilder<ForgetPasswordController>(
                        builder: (_) =>
                            !forgetPasswordController.isCheckingPhone
                                ? ButtonComponent('next'.tr, () {
                                    forgetPasswordController.checkPhone();
                                  })
                                : Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 41.h,
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
