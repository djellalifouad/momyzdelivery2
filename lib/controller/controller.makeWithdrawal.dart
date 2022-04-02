import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/services/service.profile.dart';

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
    if (formKey.currentState!.validate()) {
      print(double.parse(splashController.s!.min_wthdrawal_ammount.toString()) >
          double.parse(amountController.text));
      if (double.parse(splashController.s!.min_wthdrawal_ammount.toString()) >
          double.parse(amountController.text)) {
        updateIsRequest();
        bool result = await ProfileService.makeWithdrawal(token,
            ibanController.text, amountController.text, withdrawalDetails.text);
        updateIsRequest();
      }
    }
  }
}
