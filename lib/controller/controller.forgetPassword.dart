import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/service.auth.dart';
import '../ui/views/auth/view_confirm_phone_number_forget.dart';
import '../ui/views/auth/view_confirm_phone_number_login.dart';
import '../ui/views/toast/toast.message.dart';

class ForgetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String verficationIdCode = "";
  final TextEditingController phoneController = TextEditingController();
  String countryCode = "972";
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
    if (phoneController.text.length < 9) {
      showMessage('pleaser_enter_a_correct_number'.tr);
    } else {
      changeIsCheckingPhone();
      bool exist = await AuthService.phoneCheck(
        country_code: "+" + countryCode,
        phone: phoneController.text,
        password: "",
      );
      if (!exist) {
        changeIsCheckingPhone();
        showMessage("pleaser_enter_a_correct_number".tr);
      } else {
        print('exist');
        sendSmsToPhone();
        // show error message
      }
    }
  }

  sendSmsToPhone() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: "+" + countryCode + phoneController.text,
      codeSent: (String verificationId, int? resendToken) async {
        print(verificationId);
        verficationIdCode = verificationId;
        Get.to(ConfirmPhoneNumberForget());
        update();
        changeIsCheckingPhone();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationFailed: (FirebaseAuthException error) {
        showMessage(error.message.toString());
        print(error.message);
        showMessage("error".tr);
        changeIsCheckingPhone();
      },
      verificationCompleted: (phoneAuthCredential) async {},
    );
  }

  resendSmsToPhone() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: "+" + countryCode + phoneController.text,
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
