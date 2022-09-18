import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:momyzdelivery/controller/controller.register.dart';
import 'package:momyzdelivery/ui/views/auth/view_car_information.dart';
import 'package:momyzdelivery/ui/views/auth/view_login3.dart';

import '../../../constant/pallete.const.dart';
import '../../../controller/controller.personaInformationUpdate.dart';
import '../../../controller/controller.personalInformationRegisterController.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';

class PersonalInfoUpdateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PersonalInformationControllerUpdate());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 40.w,
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
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "personal_info".tr,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Pallete.backGroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'id'.tr,
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
                      title: 'id'.tr,
                      icon: 'assets/icons/profile.svg',
                      icon2: '',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "please_enter_your_personal_id_number".tr;
                        }
                      },
                      textEditingController: controller.idNumberController,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'id_pic'.tr,
                      style: TextStyle(
                        color: Pallete.greyColorPrinciple,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.getFile(0);
                      },
                      child: Center(
                          child: SvgPicture.asset('assets/icons/FramePic.svg')),
                    ),
                    GetBuilder<PersonalInformationControllerUpdate>(
                      builder: (_) => controller.fileIdPic != null
                          ? Padding(
                              padding: EdgeInsets.only(
                                top: 5.h,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 120.h,
                                  child: Stack(
                                    children: [
                                      Image.file(controller.fileIdPic),
                                      Positioned(
                                          top: 10.sp,
                                          left: 8.sp,
                                          child: Container(
                                            height: 20.sp,
                                            width: 20.sp,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  controller.deletePic(0);
                                                },
                                                child: Icon(Icons.clear,
                                                    size: 15.sp,
                                                    color: Pallete
                                                        .pinkColorPrinciple),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'per_pic'.tr,
                      style: TextStyle(
                        color: Pallete.greyColorPrinciple,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.getFile(1);
                      },
                      child: Center(
                          child: SvgPicture.asset('assets/icons/FramePic.svg')),
                    ),
                    GetBuilder<PersonalInformationControllerUpdate>(
                      builder: (_) => controller.fileDriverLiscencePic != null
                          ? Padding(
                              padding: EdgeInsets.only(
                                top: 5.h,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 120.h,
                                  child: Stack(
                                    children: [
                                      Image.file(
                                          controller.fileDriverLiscencePic),
                                      Positioned(
                                          top: 10.sp,
                                          left: 8.sp,
                                          child: Container(
                                            height: 20.sp,
                                            width: 20.sp,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  controller.deletePic(1);
                                                },
                                                child: Icon(Icons.clear,
                                                    size: 15.sp,
                                                    color: Pallete
                                                        .pinkColorPrinciple),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GetBuilder<PersonalInformationControllerUpdate>(
                      builder: (_) => controller.isSendingRegister
                          ? Center(child: CircularProgressIndicator())
                          : ButtonComponent('save'.tr, () {
                              controller.sendPersonalInformation();
                            }),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
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
