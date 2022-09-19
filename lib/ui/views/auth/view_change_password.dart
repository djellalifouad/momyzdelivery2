import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:momyzdelivery/controller/controller.changePassword.dart';
import 'package:momyzdelivery/ui/views/auth/view_forget_password.dart';
import '../../../constant/pallete.const.dart';
import '../../../controller/controller.login.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';

class ChangePasswordWidget1 extends StatefulWidget {
  ChangePasswordWidget1({Key? key}) : super(key: key);
  @override
  State<ChangePasswordWidget1> createState() => _ChangePasswordWidget1State();
}

class _ChangePasswordWidget1State extends State<ChangePasswordWidget1> {
  final changePasswordController = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Form(
              key: changePasswordController.formKey,
              onChanged: () {
                changePasswordController.formKey.currentState!.validate();
              },
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
                      "forget_password_desc2".tr,
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
                      'new_password'.tr,
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
                      title: 'enter_new_password'.tr,
                      icon: 'assets/icons/password.svg',
                      icon2: '',
                      validator: (val) {
                        if (val!.length < 8) {
                          return "password_confirm".tr;
                        }
                      },
                      textEditingController:
                          changePasswordController.passwordController,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'new_password_confirm'.tr,
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
                      title: 'enter_new_password2'.tr,
                      icon: 'assets/icons/password.svg',
                      icon2: '',
                      validator: (val) {
                        if (val!.length < 8) {
                          return "password_confirm".tr;
                        }
                      },
                      textEditingController:
                          changePasswordController.passwordController2,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 170.h,
                    ),
                    GetBuilder<LoginController>(
                      builder: (_) => !changePasswordController.isUpdating
                          ? ButtonComponent('confirm'.tr, () {
                              changePasswordController.changePassword();
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
    );
  }
}
