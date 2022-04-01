import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../services/service.auth.dart';
import '../ui/views/auth/view_car_information.dart';
import '../ui/views/toast/toast.message.dart';
import '../ui/views/wait_view.dart';

class CarInformationController extends GetxController {
  bool isSendingRegister = false;
  TextEditingController carNameController = TextEditingController();
  TextEditingController typeCarController = TextEditingController();
  TextEditingController matCarController = TextEditingController();
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

  List<File> filePicCar = [];
  var fileGreyCard = null;
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
      filePicCar.add(files[0]);
    } else {
      fileGreyCard = files[0];
    }
    update();
  }

  sendCarInformation() async {
    token = box.read('token').toString();
    if (formKey.currentState!.validate()) {
      if (fileGreyCard == null || filePicCar.isEmpty) {
        showMessage("please_add_ids_pic".tr);
        return;
      }
      changeStateIsSending();
      bool result = await AuthService.updateCarInformation(
        token: token,
        name: carNameController.text,
        car_number: matCarController.text,
        model: typeCarController.text,
        images: filePicCar,
        car_registration_certificate_image: fileGreyCard,
      );
      changeStateIsSending();
      if (result == true) {
        Get.to(WaitView());
        showMessage("car_success".tr);
      } else {
        showMessage("error".tr);
      }
    }
  }

  deletePic(int number, index) {
    if (number == 0) {
      filePicCar.removeAt(index);
    } else {
      fileGreyCard = null;
    }
    update();
  }
}
