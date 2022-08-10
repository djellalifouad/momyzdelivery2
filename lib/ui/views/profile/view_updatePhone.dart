import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import '../../../constant/pallete.const.dart';
import '../../../controller/controller.updatePhone.dart';
import '../components/component_button.dart';

class UpdatePhone extends StatelessWidget {
  final controller = Get.put(UpdatePhoneController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "update_phone".tr,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        leadingWidth: 42.sp,
        backgroundColor: Colors.white,
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 80.h,
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
            textDirection: TextDirection.rtl,
            child: IntlPhoneField(
              keyboardType: TextInputType.phone,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              invalidNumberMessage: "please_enter_delivery_type".tr,
              flagsButtonPadding: EdgeInsets.only(left: 20.w, right: 20.w),
              cursorColor: Pallete.pinkColorPrinciple,
              disableLengthCheck: true,
              showDropdownIcon: false,
              textAlign: TextAlign.start,
              validator: (val) {
                if (val!.number.length < 12) {
                  return "please_enter_phone_number".tr;
                }
              },
              style: TextStyle(),
              decoration: InputDecoration(
                hintStyle: TextStyle(),
                contentPadding: EdgeInsets.symmetric(vertical: 19.h),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Pallete.pinkColorPrinciple),
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
                  borderSide:
                      BorderSide(color: Color.fromRGBO(189, 189, 189, 1)),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
              ),
              controller: controller.phoneController,
              initialCountryCode: 'DZ',
              countries: ['DZ'],
              onCountryChanged: (val) {
                controller.updatePhone();
              },
              onChanged: (phone) {},
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          GetBuilder<UpdatePhoneController>(
              builder: (context) => controller.isSending
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ButtonComponent('confirm'.tr, () {
                      print("h");
                      controller.updatePhone();
                    }))
        ]),
      ),
    );
  }
}
