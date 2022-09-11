import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:momyzdelivery/controller/controller.forgetPassword.dart';
import 'package:momyzdelivery/services/service.auth.dart';
import 'package:momyzdelivery/ui/views/auth/view_login1.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';

class ChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String verficationIdCode = "";
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  late ForgetPasswordController forgetPasswordController;
  @override
  void onInit() {
    forgetPasswordController = Get.find<ForgetPasswordController>();
    super.onInit();
  }

  bool isUpdating = false;
  updateIsUpdating() {
    isUpdating = !isUpdating;
    update();
  }

  changePassword() async {
    if (formKey.currentState!.validate()) {
      updateIsUpdating();
      if (passwordController.text != passwordController2.text) {
        showMessage('password_confirm2'.tr);
        return;
      }
      bool result = await AuthService.updatePassword(
          country_code: "+" + forgetPasswordController.countryCode,
          phone: forgetPasswordController.phoneController.text,
          password: passwordController.text,
          password_confirmation: passwordController2.text);
      updateIsUpdating();
      if (result) {
        showMessage(
            'تم تغيير كلمة السر بنجاح ، يرجى إعادة تسجيل الدخول بكلمة المرور الجديدة');
        Get.to(Login1View());
      } else {
        showMessage('error'.tr);
      }
    } else {}
  }
}
