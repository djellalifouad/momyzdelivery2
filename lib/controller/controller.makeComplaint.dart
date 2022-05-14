import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/services/service.profile.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.tickets.dart';

class makeComplaintController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isSending = false;
  updateIsSending() {
    isSending = !isSending;
    update();
  }

  var box = GetStorage();
  String token = "";
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
    super.onInit();
  }

  var file = null;
  getFile() async {
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
    file = files[0];
    update();
  }

  deleteFile() {
    file = null;
    update();
  }

  submit() async {
    token = box.read('token').toString();
    if (formKey.currentState!.validate()) {
      updateIsSending();
      String s = await ProfileService.createTicket(
          token, titleController.text, descController.text, file);
      if (s == "success") {
        print("here");
        Get.back();
        titleController.clear();
        descController.clear();
        file = null;
        showMessage("complaint_success".tr);
        final ticketController = Get.find<TicketController>();
        ticketController.getFirst();
      } else {
        showMessage("error".tr);
      }
      updateIsSending();
    } else {}
  }
}
