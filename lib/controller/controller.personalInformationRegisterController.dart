import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/services/service.auth.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';

import '../models/model.user.dart';
import '../ui/views/auth/view_car_information.dart';

class PersonalInformationController extends GetxController {
  bool isSendingRegister = false;
  changeStateIsSending() {
    isSendingRegister = !isSendingRegister;
    update();
  }

  final formKey = GlobalKey<FormState>();
  var box = GetStorage();
  String token = "";
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
    // TODO: implement onInit
    super.onInit();
  }
  final TextEditingController idNumberController = TextEditingController();
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
      if (fileDriverLiscencePic == null || fileIdPic == null) {
        showMessage("please_add_ids_pic".tr);
        return;
      }
      changeStateIsSending();
    Driver? result = await AuthService.updatePersonalInformation(
          token: token,
          personal_id_image: fileIdPic,
          driving_licence_image: fileDriverLiscencePic,
          personal_id: idNumberController.text);
      changeStateIsSending();
      if (result != null) {
        showMessage("personal_success".tr);
        Get.to(CarInformationRegister());
      } else {
        showMessage("error".tr);
      }
    }
    // call post personal information  service ;
  }
}
