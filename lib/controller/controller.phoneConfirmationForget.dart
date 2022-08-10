import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:momyzdelivery/controller/controller.forgetPassword.dart';
import 'package:momyzdelivery/controller/controller.login.dart';
import 'package:momyzdelivery/ui/views/auth/view_change_password.dart';
import 'package:momyzdelivery/ui/views/splashScreen/widget.splash.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../services/service.auth.dart';
import '../ui/views/bottom/view_bottom.dart';
import '../ui/views/toast/toast.message.dart';

class PhoneConfirmationForgetController extends GetxController {
  bool isChecking = false;
  changeStateIsChecking() {
    isChecking = !isChecking;
    update();
  }

  late ForgetPasswordController forgetController;
  final TextEditingController codePinController = TextEditingController();
  @override
  void onInit() {
    forgetController = Get.find<ForgetPasswordController>();
    super.onInit();
  }

  verifyPhoneAndLogin() async {
    try {
      changeStateIsChecking();
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: forgetController.verficationIdCode,
              smsCode: codePinController.text))
          .then((value) async {
        if (value.user != null) {
          Get.to(ChangePasswordWidget1());
          changeStateIsChecking();
        } else {
          changeStateIsChecking();
          showMessage("errors".tr);
        }
      });
    } catch (e) {
      changeStateIsChecking();
      print(e.toString());
      showMessage("wrongSms".tr);
    }
  }
}
