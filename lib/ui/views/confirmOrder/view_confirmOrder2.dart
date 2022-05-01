import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder1.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder3.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../controller/controller.confirmOrder.dart';
import '../../../models/model.order.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';
import '../wait_view.dart';
class ConfirmOrder2 extends StatefulWidget {
  String order;
  ConfirmOrder2(this.order);
  @override
  State<ConfirmOrder2> createState() => _ConfirmOrder2State();
}
class _ConfirmOrder2State extends State<ConfirmOrder2> {
  @override
  Widget build(BuildContext context) {
    final confirmOrderController = Get.put(ConfirmOrderFileController());
    return GetBuilder<ConfirmOrderFileController>(
        init: ConfirmOrderFileController(),
        builder: (confirmOrderController) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "code_activation_confirmation".tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              elevation: 0,
              leading: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
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
                          height: 74.h,
                        ),
                        Text(
                          "product_picture".tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Pallete.greyText,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        InkWell(
                          onTap: () async {
                            confirmOrderController.getFile();
                          },
                          child: Center(
                              child: SvgPicture.asset(
                                  'assets/icons/uploadPic.svg')),
                        ),
                        SizedBox(
                          height: 52.h,
                        ),
                        confirmOrderController.files.isNotEmpty
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 100.h,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        confirmOrderController.files.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              child: Image.file(
                                                confirmOrderController
                                                    .files[index],
                                                height: 96.sp,
                                                width: 96.sp,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: 4.sp,
                                              left: 8.sp,
                                              child: InkWell(
                                                onTap: () {
                                                  confirmOrderController
                                                      .removeAt(index);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: Icon(
                                                    Icons.clear,
                                                    size: 12.sp,
                                                    color: Pallete
                                                        .pinkColorPrinciple,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Center(
                                child: Text("no_pic".tr),
                              ),
                        SizedBox(
                          height: 40.h,
                        ),
                        confirmOrderController.isSendingPicture
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ButtonComponent('code_activation_confirmation'.tr,
                                () {
                                confirmOrderController
                                    .sendPictureOrder(widget.order.toString());
                              }),
                        SizedBox(
                          height: 48.h,
                        ),
                      ]),
                ),
              ),
            ),
          );
        });
  }
}
