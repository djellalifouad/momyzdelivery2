import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/controller/controller.checkPassword.dart';
import 'package:momyzdelivery/controller/controller.forgetPassword.dart';
import 'package:momyzdelivery/services/service.auth.dart';
import 'package:momyzdelivery/services/service.profile.dart';
import 'package:momyzdelivery/ui/views/auth/view_login1.dart';
import 'package:momyzdelivery/ui/views/profile/view_profile.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';

class UpdatePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String verficationIdCode = "";
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  late CheckPasswordController checkPasswordController;
  @override
  void onInit() {
    checkPasswordController = Get.find<CheckPasswordController>();
    super.onInit();
  }

  var box;
  String token = "";
  bool isUpdating = false;
  updateIsUpdating() {
    isUpdating = !isUpdating;
    update();
    box = GetStorage();
  }

  changePassword() async {
    box = GetStorage();
    token = box.read('token').toString();
    if (formKey.currentState!.validate()) {
      if (passwordController.text != passwordController2.text) {
        showMessage('password_confirm2'.tr);
        return;
      }
      updateIsUpdating();
      bool result = await ProfileService.updatePassword(
        password: passwordController.text,
        password_confirmation: passwordController2.text,
        old_password: checkPasswordController.passwordController.text,
        token: token,
      );
      updateIsUpdating();
      if (result) {
        showMessage('password_changed_successfully'.tr);

        Get.to(Profile());
        Get.delete<CheckPasswordController>();
        Get.delete<UpdatePasswordController>();
      } else {
        showMessage('error'.tr);
      }
    } else {}
  }
}
