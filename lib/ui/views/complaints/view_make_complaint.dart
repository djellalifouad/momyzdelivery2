import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momyzdelivery/controller/controller.makeComplaint.dart';

import '../../../constant/pallete.const.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/component_button.dart';
import '../components/component_textField.dart';

class MakeComplaint extends StatelessWidget {
  final controller = Get.put(makeComplaintController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backGroundColor2,
      appBar: AppBar(
        actions: [
          InkWell(
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
                      Icons.arrow_forward,
                      color: Colors.black,
                    ))),
          )
        ],
        backgroundColor: Pallete.backGroundColor2,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "open_complaint".tr,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
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
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'complaint_reason'.tr,
                      style: TextStyle(
                          color: Pallete.greyColorPrinciple,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    TextFormFieldComponent(
                      textEditingController: controller.titleController,
                      validator: (val) {
                        if (val!.length == 0) {
                          return "please_enter_title".tr;
                        }
                      },
                      icon: '',
                      title: 'complaint_reason'.tr,
                      icon2: '',
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text('complaint_body'.tr,
                        style: TextStyle(
                            color: Pallete.greyColorPrinciple,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 6.h,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.length == 0) {
                          return "please_enter_desc".tr;
                        }
                      },
                      controller: controller.descController,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                      maxLines: 5,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(252, 250, 250, 1),
                        hintText: 'complaint_body_desc2'.tr,
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
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text('add_files_or_pics'.tr,
                        style: TextStyle(
                            color: Pallete.greyColorPrinciple,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 6.h,
                    ),
                    InkWell(
                        onTap: () {
                          controller.getFile();
                        },
                        child: Center(
                            child:
                                SvgPicture.asset('assets/icons/FramePic.svg'))),
                    GetBuilder<makeComplaintController>(
                      builder: (_) => controller.file != null
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
                                      Image.file(controller.file),
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
                                                onTap: () {},
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
                      height: 32.h,
                    ),
                    GetBuilder<makeComplaintController>(
                        builder: (context) => controller.isSending
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ButtonComponent('send_complaint'.tr, () {
                                controller.submit();
                              })),
                    SizedBox(
                      height: 32.h,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
