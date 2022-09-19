import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:momyzdelivery/controller/controller.updatePassword.dart';

import '../../../constant/pallete.const.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';

class UpdatePasswordWidget extends StatefulWidget {
  UpdatePasswordWidget({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordWidget> createState() => _UpdatePasswordWidgetState();
}

class _UpdatePasswordWidgetState extends State<UpdatePasswordWidget> {
  final updatePasswordController = Get.put(UpdatePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "update_password".tr,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          leadingWidth: 42.sp,
          backgroundColor: Colors.white,
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
              key: updatePasswordController.formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80.h,
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
                          updatePasswordController.passwordController,
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
                          updatePasswordController.passwordController2,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GetBuilder<UpdatePasswordController>(
                      builder: (_) => !updatePasswordController.isUpdating
                          ? ButtonComponent('confirm'.tr, () {
                              updatePasswordController.changePassword();
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
