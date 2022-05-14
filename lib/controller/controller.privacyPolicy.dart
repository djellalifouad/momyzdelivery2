import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/services/service.orders.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/services/service.privacypolicy.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder1.dart';
import 'package:momyzdelivery/ui/views/privacyPolicy/privacyPolicy.widget.dart';

import '../ui/views/toast/toast.message.dart';

class PrivacyPolicyController extends GetxController {
  var box = GetStorage();
  String token = "";
  bool isGettingPrivacy = true;
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
    super.onInit();
  }

  String privacyPolicy = "";
  getPrivacyPolicy() async {
    privacyPolicy = await PrivacyPolicyService.getPrivacy();
    isGettingPrivacy = false;
    update();
  }
}
