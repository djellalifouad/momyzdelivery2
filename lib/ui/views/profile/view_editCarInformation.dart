import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:momyzdelivery/controller/controller.carInformationController.dart';
import 'package:momyzdelivery/controller/controller.register.dart';
import 'package:momyzdelivery/ui/views/auth/view_car_information.dart';
import 'package:momyzdelivery/ui/views/auth/view_login3.dart';

import '../../../constant/pallete.const.dart';
import '../../../controller/controller.carInformationControllerUpdate.dart';
import '../../../controller/controller.personalInformationRegisterController.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';

class CarInformationRegisterUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarInformationControllerUpdate());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 40.w,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
              padding: EdgeInsets.symmetric(),
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
          "carUpdate".tr,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Pallete.backGroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Form(
              key: controller.formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'name_vehicule2'.tr,
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
                      title: 'name_vehicule2'.tr,
                      icon: '',
                      icon2: '',
                      validator: (val) {
                        if (val!.length < 3) {
                          return "please_enter_name_car".tr;
                        }
                      },
                      textEditingController: controller.carNameController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'type_vehicule2'.tr,
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
                      title: 'type_vehicule2'.tr,
                      icon: '',
                      icon2: '',
                      validator: (val) {
                        if (val!.length < 4) {
                          return "please_enter_type_car".tr;
                        }
                      },
                      textEditingController: controller.typeCarController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'number_matricule'.tr,
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
                      title: 'number_matricule'.tr,
                      icon: '',
                      icon2: '',
                      validator: (val) {
                        if (val!.length < 4) {
                          return "please_enter_matricule".tr;
                        }
                      },
                      textEditingController: controller.matCarController,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'greyNumber'.tr,
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
                    SizedBox(
                      height: 10.h,
                    ),
                    GetBuilder<CarInformationControllerUpdate>(
                      builder: (_) => controller.fileGreyCard != null
                          ? Padding(
                              padding: EdgeInsets.only(
                                top: 5.h,
                              ),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 90.h,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 1,
                                    itemBuilder: (context, index) => Stack(
                                      children: [
                                        Image.file(
                                          controller.fileGreyCard,
                                          height: 120.sp,
                                          width: 120.sp,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                            top: 4.sp,
                                            left: 4.sp,
                                            child: Container(
                                              height: 20.sp,
                                              width: 20.sp,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.deletePic();
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
                              ),
                            )
                          : Container(),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GetBuilder<CarInformationControllerUpdate>(
                      builder: (_) => controller.isSendingRegister
                          ? Center(child: CircularProgressIndicator())
                          : ButtonComponent('save'.tr, () {
                              controller.sendCarInformation();
                            }),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
