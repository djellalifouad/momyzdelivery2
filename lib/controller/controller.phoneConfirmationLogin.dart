import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:momyzdelivery/controller/controller.login.dart';
import 'package:momyzdelivery/ui/views/splashScreen/widget.splash.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../services/service.auth.dart';
import '../ui/views/bottom/view_bottom.dart';
import '../ui/views/toast/toast.message.dart';

class PhoneConfirmationLoginController extends GetxController {
  bool isRegistring = false;
  changeStateIsRegistring() {
    isRegistring = !isRegistring;
    update();
  }

  late LoginController loginController;
  final TextEditingController codePinController = TextEditingController();
  @override
  void onInit() {
    loginController = Get.find<LoginController>();
    super.onInit();
  }

  verifyPhoneAndLogin() async {
    try {
      changeStateIsRegistring();
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: loginController.verficationIdCode,
              smsCode: codePinController.text))
          .then((value) async {
        if (value.user != null) {
          bool result = await AuthService.Login(
            country_code: "+" + loginController.countryCode,
            phone: loginController.phoneController.text,
            password: loginController.passwordController.text,
          );

          changeStateIsRegistring();
          if (result) {
            Get.to(SplashScreen());
          } else {
            showMessage("error2".tr);
          }
        } else {
          changeStateIsRegistring();
          showMessage("errors".tr);
        }
      });
    } catch (e) {
      changeStateIsRegistring();
      print(e.toString());
      showMessage("wrongSms".tr);
    }
  }
}
