import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/services/service.profile.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';

import '../ui/views/profile/view_update_password.dart';

class CheckPasswordController extends GetxController {
  bool isSending = false;
  updateIsSending() {
    isSending = !isSending;
    update();
  }

  final TextEditingController passwordController = TextEditingController();
  String countryCode = "+213";
  String token = "";
  var box;
  onInit() {
    box = GetStorage();
    token = box.read('token').toString();
    super.onInit();
  }

  checkPhone() async {
    updateIsSending();
    token = box.read('token').toString();
    bool result =
        await ProfileService.checkPassword(token, passwordController.text);
    updateIsSending();
    if (result) {
      Get.to(UpdatePasswordWidget());
    } else {
      showMessage('incorrect_password_message'.tr);
    }
  }
}
