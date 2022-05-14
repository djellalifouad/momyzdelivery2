import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/services/service.auth.dart';

import '../models/model.user.dart';
import '../ui/views/auth/view_car_information.dart';
import '../ui/views/toast/toast.message.dart';
import 'controller.splash.dart';

class PersonalInformationControllerUpdate extends GetxController {
  bool isSendingRegister = false;
  changeStateIsSending() {
    isSendingRegister = !isSendingRegister;
    update();
  }

  final formKey = GlobalKey<FormState>();
  var box = GetStorage();
  String token = "";
  final TextEditingController idNumberController = TextEditingController();
  final splashController = Get.find<SplashController>();
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
    idNumberController.text = splashController.v!.personal_id.toString();
    // TODO: implement onInit
    super.onInit();
  }

  var fileIdPic = null;
  var fileDriverLiscencePic = null;
  getFile(int number) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ["PNG", "JPG", "JPEG"]);
    List<File> files = [];
    if (result != null) {
      files = result.paths.map((path) => File(path.toString())).toList();
    } else {
      return;
    }
    if (number == 0) {
      fileIdPic = files[0];
    } else {
      fileDriverLiscencePic = files[0];
    }
    update();
  }

  deletePic(int number) {
    if (number == 0) {
      fileIdPic = null;
    } else {
      fileDriverLiscencePic = null;
    }
    update();
  }

  sendPersonalInformation() async {
    token = box.read('token').toString();
    if (formKey.currentState!.validate()) {
      changeStateIsSending();
      Driver? result = await AuthService.updatePersonalInformation(
          token: token,
          personal_id_image: fileIdPic,
          driving_licence_image: fileDriverLiscencePic,
          personal_id: idNumberController.text);

      changeStateIsSending();
      if (result != null) {
        print("wow2");
        showMessage("personal_success".tr);
        splashController.updateDriver(result);

        Get.back();
      } else {
        showMessage("error".tr);
      }
    }
    // call post personal information  service ;
  }
}
