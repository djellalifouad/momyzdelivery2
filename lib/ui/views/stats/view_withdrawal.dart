import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder3.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../controller/controller.makeWithdrawal.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';
import '../wait_view.dart';

class Withdrawal extends StatefulWidget {
  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  List<Widget> images = [];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WithdrawalController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "".tr,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Container(),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                ),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    )),
              ),
            ]),
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
                      Center(child: SvgPicture.asset('assets/icons/coins.svg')),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Text(
                          "withdrawal".tr,
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'ammount'.tr,
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
                        textEditingController: controller.amountController,
                        title: 'ammount'.tr,
                        icon: '',
                        icon2: '',
                        validator: (val) {
                          if (double.tryParse(val.toString()) == null) {
                            return "please_enter_ammount".tr;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'withdtawal_detail'.tr,
                        style: TextStyle(
                          color: Pallete.greyColorPrinciple,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.length == 0) {
                            return "please_enter_withdtawal_detail".tr;
                          }
                        },
                        controller: controller.withdrawalDetails,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                        maxLines: 3,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(252, 250, 250, 1),
                          hintText: 'withdtawal_detail'.tr,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Pallete.pinkColorPrinciple),
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(189, 189, 189, 1)),
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
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'IBAN'.tr,
                        style: TextStyle(
                          color: Pallete.greyColorPrinciple,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextFormFieldComponent(
                        textEditingController: controller.ibanController,
                        title: 'number'.tr + ' ' + 'IBAN'.tr,
                        icon: '',
                        icon2: '',
                        validator: (val) {
                          if (val!.length == 0) {
                            return "please_enter_iban".tr;
                          }
                        },
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      GetBuilder<WithdrawalController>(builder: (contr) {
                        if (controller.isRequest) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ButtonComponent('withdrawal'.tr, () {
                          controller.makeWithdrawal();
                        });
                      }),
                      SizedBox(
                        height: 48.h,
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
