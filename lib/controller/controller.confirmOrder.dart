import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/services/service.orders.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder1.dart';

import '../ui/views/toast/toast.message.dart';

class ConfirmOrderFileController extends GetxController {
  var box = GetStorage();
  String token = "";
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
    // TODO: implement onInit
    super.onInit();
  }

  bool isSendingPicture = false;
  List<File> files = [];
  var fileGreyCard = null;
  updateIsSendingOrder() {
    isSendingPicture = !isSendingPicture;
    update();
  }

  getFile() async {
    print("hhh");
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ["PNG", "JPG", "JPEG"]);
    if (result != null) {
      files.addAll(result.paths.map((path) => File(path.toString())).toList());
      update();
    } else {
      update();
      return;
    }
  }

  removeAt(index) {
    files.removeAt(index);
    update();
  }

  sendPictureOrder(String id) async {
    if (files.isEmpty) {
      showMessage("please_add_ids_pic".tr);
      return;
    }
    updateIsSendingOrder();

    token = box.read('token').toString();
    bool s = await OrderService.sendPictureOrder(
        order_id: id, images: files, token: token);
    await OrderService.sendCode(id, token);
    updateIsSendingOrder();
    Get.to(ConfirmOrder(id));
    files.clear();
    update();
  }
}
