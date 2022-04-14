import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:momyzdelivery/controller/controller.updatePhone.dart';
import '../models/model.user.dart';
import '../services/service.auth.dart';
import '../services/service.profile.dart';
import '../ui/views/auth/view_personal_info.dart';
import '../ui/views/toast/toast.message.dart';
import 'controller.register.dart';
import 'controller.splash.dart';



class PhoneConfirmationUpdateController extends GetxController {
  bool isRegistring = false;
  changeStateIsRegistring() {
    isRegistring = !isRegistring;
    update();
  }

  late UpdatePhoneController registerController;
  final TextEditingController codePinController = TextEditingController();
  @override
  void onInit() {
    registerController = Get.find<UpdatePhoneController>();
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
       //   changeStateIsRegistring();
         //  Driver? v = await ProfileService.updateProfilePhone(
          //  token, countryCode, phoneController.text);
         //  updateIsSending();

     // if (v == null) {
     //   showMessage('error'.tr);
      //} else {
       // showMessage('success'.tr);
       // splashController.updateDriver(v);
      }
         // Get.to(PersonalInfoView());
     //   } else {
       //   changeStateIsRegistring();
         // showMessage("error".tr);
     //   }
      });
    } catch (e) {
      changeStateIsRegistring();
      print(e.toString());
      showMessage("wrongSms".tr);
    }
  }
}
