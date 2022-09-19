import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/controller/controller.register.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder2.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../controller/phoneConfirmationRegister.controller.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';
import '../wait_view.dart';

class ConfirmPhoneNumberRegister extends StatefulWidget {
  @override
  State<ConfirmPhoneNumberRegister> createState() =>
      _ConfirmPhoneNumberRegisterState();
}

class _ConfirmPhoneNumberRegisterState extends State<ConfirmPhoneNumberRegister>
    with CodeAutoFill {
  late Timer _timer;
  int _start = 20;

  void startTimer() {
    _start = 20;
    setState(() {});
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          setState(() {});
        } else {
          _start--;
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    cancel();
    super.dispose();
  }

  @override
  void initState() {
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
      });
    });
    if (mounted) {
      startTimer();
    }
    super.initState();
  }

  final phoneConfirmationRegisterController =
      Get.put(PhoneConfirmationRegisterController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
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
        ]),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 25.h),
          child: Builder(
            builder: (context) {
              if (_start > 0) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'you_can_retry_after'.tr,
                      style: TextStyle(),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      _start.toString(),
                      style: TextStyle(color: Pallete.pinkColorPrinciple),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'second'.tr,
                      style: TextStyle(color: Pallete.pinkColorPrinciple),
                    )
                  ],
                );
              } else {
                return InkWell(
                  onTap: () {
                    final registerController = Get.find<RegisterController>();
                    registerController.resendSmsToPhone();
                    startTimer();
                  },
                  child: Text(
                    'resend'.tr,
                    style: TextStyle(color: Pallete.pinkColorPrinciple),
                    textAlign: TextAlign.center,
                  ),
                );
              }
            },
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
                            controller: phoneConfirmationRegisterController
                                .codePinController,
                            onCompleted: (v) async {
                              print(v);
                              phoneConfirmationRegisterController
                                  .verifyPhoneAndRegister();
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
                    GetBuilder<PhoneConfirmationRegisterController>(
                      builder: (_) =>
                          phoneConfirmationRegisterController.isRegistring
                              ? Center(child: CircularProgressIndicator())
                              : ButtonComponent('verify_phone'.tr, () {
                                  phoneConfirmationRegisterController
                                      .verifyPhoneAndRegister();
                                }),
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    Directionality(
                      textDirection:
                          GetStorage().read("lang").toString() == "en"
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/notActive.svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          SvgPicture.asset('assets/icons/notActive.svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          SvgPicture.asset('assets/icons/Active.svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          SvgPicture.asset('assets/icons/notActive.svg'),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  String? appSignature;
  String? otpCode;

  @override
  void codeUpdated() {
    phoneConfirmationRegisterController.codePinController.text =
        code.toString();
  }
}
