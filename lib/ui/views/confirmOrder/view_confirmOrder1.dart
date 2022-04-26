import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/services/service.orders.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder2.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder3.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../models/model.order.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';
import '../wait_view.dart';

class ConfirmOrder extends StatelessWidget {
  String id;
  ConfirmOrder(this.id);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      height: 77.h,
                    ),
                    Center(
                        child: SvgPicture.asset('assets/icons/enterOtp.svg')),
                    SizedBox(
                      height: 52.h,
                    ),
                    Center(
                        child: Text(
                      'code_activation'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25.sp,
                      ),
                    )),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      'code_activation_desc'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Pallete.greyColorPrinciple,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Directionality(
                        textDirection: TextDirection.ltr,
                        child: Container(
                          margin: EdgeInsets.only(left: 16.0.w, right: 16.w),
                          height: 50.sp,
                          child: PinCodeTextField(
                            controller: controller,
                            onSubmitted: (s) {},
                            enablePinAutofill: true,
                            autovalidateMode: AutovalidateMode.disabled,
                            appContext: context,
                            length: 6,
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                            ),
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            keyboardType: TextInputType.number,
                            showCursor: false,
                            validator: (v) {},
                            pinTheme: PinTheme(
                              inactiveColor: Pallete.backPinColor,
                              activeFillColor: Pallete.backPinColor,
                              activeColor: Pallete.pinkColorPrinciple,
                              inactiveFillColor: Pallete.backPinColor,
                              selectedFillColor: Pallete.backPinColor,
                              selectedColor: Pallete.backPinColor,
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5.r),
                              fieldHeight: 39.sp,
                              fieldWidth: 47.sp,
                            ),
                            onCompleted: (v) async {
                              var box = GetStorage();
                              String token = box.read('token').toString();
                              bool result =
                                  await OrderService.arrive(id, token, v);
                              if (result) {
                                Get.to(ConfirmOrder3());
                              } else {
                                showMessage("wrongSms".tr);
                              }
                            },
                            onChanged: (value) {},
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              return true;
                            },
                          ),
                        )),
                    SizedBox(
                      height: 41.h,
                    ),
                    ButtonComponent('code_activation_confirmation'.tr,
                        () async {
                      var box = GetStorage();
                      String token = box.read('token').toString();
                      bool result =
                          await OrderService.arrive(id, token, controller.text);
                      if (result) {
                        Get.to(ConfirmOrder3());
                      } else {
                        showMessage("wrongSms".tr);
                      }
                    }),
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
