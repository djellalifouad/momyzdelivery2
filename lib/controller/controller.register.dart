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
  final TextEditingController codePinController = TextEditingController();
  updateCountryCode(String value) {
    countryCode = value;
    update();
  }

  checkPhone() async {
    if (formKey.currentState!.validate()) {
      bool exist = await AuthService.phoneCheck(
          country_code: countryCode, phone: phoneController.text);
      print(phoneController.text);
      if (!exist) {
        sendSmsToPhone();
      } else {
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
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationFailed: (FirebaseAuthException error) {
        print(error);
      },
      verificationCompleted: (phoneAuthCredential) async {},
    );
  }

  verifyPhoneAndRegister() async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verficationIdCode,
              smsCode: codePinController.text))
          .then((value) async {
        if (value.user != null) {
          showMessage("wrong sms2");
          var splashController = Get.find<SplashController>();

          AuthService.register(
              name: nameController.text,
              express_delivery:
                  deliveryTypeController.text == "normaDelivery".tr ? 0 : 1,
              lat: splashController.position.latitude,
              lon: splashController.position.longitude,
              country_code: "+" + countryCode,
              phone: phoneController.text);
        } else {
          showMessage("error sms");
        }
      });
    } catch (e) {
      showMessage("wrong sms");
    }
  }
}

class PhoneAuthCredential {}
