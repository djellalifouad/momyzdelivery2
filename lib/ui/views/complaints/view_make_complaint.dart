import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/pallete.const.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/component_button.dart';
import '../components/component_textField.dart';

class MakeComplaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backGroundColor2,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                textEditingController: TextEditingController(),
                validator: (val) {},
                icon: '',
                title: 'choose_reason'.tr,
                icon2: 'assets/icons/down.svg',
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
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                maxLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(252, 250, 250, 1),
                  hintText: 'complaint_body_desc2'.tr,
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
              Center(child: SvgPicture.asset('assets/icons/FramePic.svg')),
              SizedBox(
                height: 32.h,
              ),
              ButtonComponent('send_complaint'.tr, () {}),
            ]),
          ),
        ),
      ),
    );
  }
}
