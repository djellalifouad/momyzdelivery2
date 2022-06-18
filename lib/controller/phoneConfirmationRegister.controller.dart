import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../services/service.auth.dart';
import '../ui/views/auth/view_personal_info.dart';
import '../ui/views/toast/toast.message.dart';
import 'controller.register.dart';
import 'controller.splash.dart';
class PhoneConfirmationRegisterController extends GetxController {
  bool isRegistring = false;
  changeStateIsRegistring() {
    isRegistring = !isRegistring;
    update();
  }

  late RegisterController registerController;
  final TextEditingController codePinController = TextEditingController();
  @override
  void onInit() {
    registerController = Get.find<RegisterController>();
    super.onInit();
  }

  verifyPhoneAndRegister() async {
    try {
      changeStateIsRegistring();
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: registerController.verficationIdCode,
              smsCode: codePinController.text))
          .then((value) async {
        if (value.user != null) {
          var splashController = Get.find<SplashController>();
          AuthService.register(
            password: registerController.passwordController.text,
              name: registerController.nameController.text,
              express_delivery:
                  registerController.deliveryTypeController.text ==
                          "normaDelivery".tr
                      ? 2
                      : 1,
              lat: splashController.position.latitude,
              lon: splashController.position.longitude,
              country_code: registerController.countryCode,
              phone: registerController.phoneController.text);
          changeStateIsRegistring();
          Get.to(PersonalInfoView());
        } else {
          changeStateIsRegistring();
          showMessage("error".tr);
        }
      });
    } catch (e) {
      changeStateIsRegistring();
      print(e.toString());
      showMessage("wrongSms".tr);
    }
  }
}
