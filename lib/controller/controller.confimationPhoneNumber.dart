import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/controller/controller.updatePhone.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../models/model.user.dart';
import '../services/service.auth.dart';
import '../services/service.profile.dart';
import '../ui/views/auth/view_personal_info.dart';
import '../ui/views/bottom/view_bottom.dart';
import '../ui/views/profile/view_profile.dart';
import '../ui/views/toast/toast.message.dart';
import 'controller.register.dart';
import 'controller.splash.dart';

class PhoneConfirmationUpdateController extends GetxController {
  bool isRegistring = false;
  changeStateIsRegistring() {
    isRegistring = !isRegistring;
    update();
  }

  var box = GetStorage();

  late UpdatePhoneController registerController;
  final TextEditingController codePinController = TextEditingController();
  @override
  void onInit() {
    registerController = Get.find<UpdatePhoneController>();
    super.onInit();
  }

  verifyPhoneAndRegister() async {
    print(
      registerController.verficationIdCode,
    );
    print(codePinController.text);
    String token = box.read('token').toString();
    try {
      changeStateIsRegistring();
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: registerController.verficationIdCode,
              smsCode: codePinController.text))
          .then((value) async {
        print('wow');
        if (value.user != null) {
          final PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: registerController.verficationIdCode,
              smsCode: codePinController.text);

          FirebaseAuth.instance!.currentUser!.updatePhoneNumber(credential);

          Driver? v = await ProfileService.updateProfilePhone(
              token,
              registerController.countryCode,
              registerController.phoneController.text);
          SplashController splashController = Get.find<SplashController>();
          changeStateIsRegistring();
          if (v != null) {
            Get.offAll(ProvidedStylesExample());
            print("personal_success".tr);
            showMessage("تم تغيير رقم الهاتف بنجاح");
            splashController.updateDriver(v);
          } else {
            showMessage('error'.tr);
          }

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
