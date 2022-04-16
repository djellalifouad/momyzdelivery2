import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/controller/controller.profile.dart';
import 'package:momyzdelivery/models/model.user.dart';
import 'package:momyzdelivery/services/service.auth.dart';
import 'package:momyzdelivery/services/service.profile.dart';

import '../ui/views/auth/view_confim_phone_number_update.dart';
import '../ui/views/toast/toast.message.dart';
import 'controller.splash.dart';

class UpdatePhoneController extends GetxController {
  bool isSending = false;
  updateIsSending() {
    isSending = !isSending;
    update();
  }
  final TextEditingController phoneController = TextEditingController();
  String countryCode = "+213";
  final splashController = Get.find<SplashController>();
  String token = "";
  var box;
  onInit() {
    box = GetStorage();
    phoneController.text = splashController.v!.phone;

    token = box.read('token').toString();
    super.onInit();
  }

  updatePhone() async {
    if (phoneController.text.length < 9) {
      print("hh");
      showMessage('pleaser_enter_a_correct_number'.tr);
    } else {
      updateIsSending();
      sendSmsToPhone();
      /*updateIsSending();
    //  Driver? v = await ProfileService.updateProfilePhone(
     //     token, countryCode, phoneController.text);
      updateIsSending();

      if (v == null) {
        showMessage('error'.tr);
      } else {
        showMessage('success'.tr);
        splashController.updateDriver(v);
      }
*/
    }
  }

  String verficationIdCode = "";
  sendSmsToPhone() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: countryCode + phoneController.text,
      codeSent: (String verificationId, int? resendToken) async {
        print(verificationId);
        verficationIdCode = verificationId;
        Get.to(ConfirmPhoneNumberUpdate());
        update();
        updateIsSending();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationFailed: (FirebaseAuthException error) {
        showMessage("error".tr);
        updateIsSending();
      },
      verificationCompleted: (phoneAuthCredential) async {},
    );
  }

  resendSmsToPhone() async {
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
