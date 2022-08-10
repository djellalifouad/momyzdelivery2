import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:momyzdelivery/controller/controller.checkPassword.dart';
import '../../../constant/pallete.const.dart';
import '../../../controller/controller.updatePhone.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';
class CheckPasswordWidget extends StatefulWidget {
  CheckPasswordWidget({Key? key}) : super(key: key);
  @override
  State<CheckPasswordWidget> createState() => _CheckPasswordWidgetState();
}
class _CheckPasswordWidgetState extends State<CheckPasswordWidget> {
  final controller = Get.put(CheckPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            'password'.tr,
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
            title: 'password'.tr,
            icon: 'assets/icons/password.svg',
            icon2: '',
            validator: (val) {
              if (val!.length < 8) {
                return "password_confirm".tr;
              }
            },
            textEditingController: controller.passwordController,
          ),
          SizedBox(
            height: 32.h,
          ),
          GetBuilder<CheckPasswordController>(
              builder: (context) => controller.isSending
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ButtonComponent('confirm'.tr, () {
                      print("h");
                      controller.checkPhone();
                    }))
        ]),
      ),
    );
  }
}
