import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/models/model.user.dart';
import 'package:momyzdelivery/models/model.withdrawal.dart';
import 'package:momyzdelivery/services/service.profile.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';

class WithdrawalController extends GetxController {
  TextEditingController amountController = TextEditingController();
  TextEditingController withdrawalDetails = TextEditingController();
  TextEditingController ibanController = TextEditingController();
  bool isRequest = false;
  final formKey = GlobalKey<FormState>();
  final splashController = Get.find<SplashController>();
  String token = "";
  var box;
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
  }
  updateIsRequest() {
    isRequest = !isRequest;
    update();
  }
  makeWithdrawal() async {
    print('test');
    token = box.read('token').toString();
    print(splashController.s!.min_wthdrawal_ammount.toString());
    if (formKey.currentState!.validate()) {
      print(double.parse(splashController.s!.min_wthdrawal_ammount.toString()) >
          double.parse(amountController.text));
      if (double.parse(splashController.s!.min_wthdrawal_ammount.toString()) <
          double.parse(amountController.text)) {
        updateIsRequest();
        Transaction? result = await ProfileService.makeWithdrawal(token,
            ibanController.text, amountController.text, withdrawalDetails.text);
        Driver? v = await ProfileService.getProfile(token);
        SplashController splashController = Get.find<SplashController>();
        if (v != null) {
          splashController.updateDriver(v);
        }
        if (result == null) {
          showMessage("error".tr);
        } else {
          showMessage("transaction_success".tr);
        }
        Get.back();
        updateIsRequest();
      } else {
        showMessage("min_error".tr +
            "  " +
            splashController.s!.min_wthdrawal_ammount.toString());
      }
    }
  }
}
