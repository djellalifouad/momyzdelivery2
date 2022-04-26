import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../../constant/pallete.const.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/component_button.dart';

class makeComplaint2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backGroundColor2,
      appBar: AppBar(
        backgroundColor: Pallete.backGroundColor2,
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
        centerTitle: true,
        elevation: 0,
        title: Text(
          "complaint_market".tr,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
              child: Align(
            alignment: Alignment.centerRight,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 84.h,
              ),
              Row(
                children: [
                  Text(
                    'reason_complaint'.tr + " : ",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    'خداع',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'وصف الإبلاغ'.tr + " : " + "( " + "choose".tr + ")",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Pallete.greyText),
              ),
              SizedBox(
                height: 6.h,
              ),
              TextFormField(
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                maxLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(252, 250, 250, 1),
                  hintText: 'add_text'.tr,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Pallete.pinkColorPrinciple),
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(189, 189, 189, 1)),
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              ButtonComponent('complaint'.tr, () {}),
            ]),
          ))),
    );
  }
}
