import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/models/model.user.dart';

import '../models/model.car.dart';
import '../services/service.auth.dart';
import '../ui/views/auth/view_car_information.dart';
import '../ui/views/toast/toast.message.dart';
import '../ui/views/wait_view.dart';
import 'controller.splash.dart';

class CarInformationControllerUpdate extends GetxController {
  bool isSendingRegister = false;
  TextEditingController carNameController = TextEditingController();
  TextEditingController typeCarController = TextEditingController();
  TextEditingController matCarController = TextEditingController();
  final splashController = Get.find<SplashController>();
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
    carNameController.text = splashController.v!.car!.name.toString();
    typeCarController.text = splashController.v!.car!.model.toString();
    matCarController.text = splashController.v!.car!.card_number.toString();
    // TODO: implement onInit
    super.onInit();
  }

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
    fileGreyCard = files[0];
    update();
  }

  sendCarInformation() async {
    token = box.read('token').toString();

    changeStateIsSending();
    Car? result = await AuthService.updateCarInformation2(
      token: token,
      name: carNameController.text,
      car_number: matCarController.text,
      model: typeCarController.text,
      car_registration_certificate_image: fileGreyCard,
    );
    changeStateIsSending();
    if (result != null) {
      Driver? v = splashController.v;
      v!.car = result;
      splashController.updateDriver(v);
      Get.back();
      showMessage("car_success".tr);
    } else {
      showMessage("error".tr);
    }
  }

  deletePic() {
    fileGreyCard = null;
    update();
  }
}
