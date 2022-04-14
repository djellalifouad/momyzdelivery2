import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';

import 'package:momyzdelivery/services/service.auth.dart';

import '../ui/views/auth/view_confirm_phone_number.dart';
import '../ui/views/toast/toast.message.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController deliveryTypeController = TextEditingController();
  String countryCode = "+213";
  String verficationIdCode = "";
  bool isCheckingPhone = false;

  updateCountryCode(String value) {
    countryCode = value;
    update();
  }
  changeIsCheckingPhone() {
    isCheckingPhone = !isCheckingPhone;
    update();
  }
  checkPhone() async {
    if (formKey.currentState!.validate()) {
      if (phoneController.text.length < 9) {
        print("hh");
        showMessage('pleaser_enter_a_correct_number'.tr);
        return;
      }
      changeIsCheckingPhone();
      print(countryCode);
      print(phoneController.text);
      bool exist = await AuthService.phoneCheck(
          country_code: countryCode, phone: phoneController.text);
      print(exist);
      if (!exist) {
        sendSmsToPhone();
      } else {
        changeIsCheckingPhone();
        showMessage("user_already_exist".tr);
        // show error message
      }
    }
  }

  sendSmsToPhone() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: countryCode + phoneController.text,
      codeSent: (String verificationId, int? resendToken) async {
        print(verificationId);
        verficationIdCode = verificationId;
        Get.to(ConfirmPhoneNumberRegister());
        update();
        changeIsCheckingPhone();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationFailed: (FirebaseAuthException error) {
        showMessage("error".tr);
        changeIsCheckingPhone();
      },
      verificationCompleted: (phoneAuthCredential) async {},
    );
  }
  resendSmsToPhone() async  {
     FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: countryCode + phoneController.text,
      codeSent: (String verificationId, int? resendToken) async {
        print(verificationId);
        verficationIdCode = verificationId;
        update();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationFailed: (FirebaseAuthException error) {
        showMessage("error".tr);
      },
      verificationCompleted: (phoneAuthCredential) async {},
    );

  }
}
