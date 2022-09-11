import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/controller/controller.profile.dart';
import 'package:momyzdelivery/services/service.profile.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';

import '../models/model.comment.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  List<Comment> comments = [];
  bool isGettingComments = false;
  TextEditingController textEditingController = TextEditingController();
  var image;
  var box = GetStorage();
  bool isMakingComment = false;
  String token = "";
  updateIsMakingComment() {
    isMakingComment = !isMakingComment;
    update();
  }

  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
    super.onInit();
  }

  changeIsGetting() {
    isGettingComments = !isGettingComments;
    update();
  }

  sendComment(String id) async {
    token = box.read('token').toString();
    if (textEditingController.text.isEmpty && image == null) {
      showMessage('enter_message'.tr);
      return;
    }
    updateIsMakingComment();
    Comment? comment = await ProfileService.makeComment(
        textEditingController.text, image, id, token);
    updateIsMakingComment();
    if (comment != null) {
      comments.add(comment);
      textEditingController.text = "";
      showMessage('comment_success'.tr);
      image = null;
      update();
    } else {
      showMessage('error'.tr);
    }
  }

  getComments(int id) async {
    token = box.read('token');
    changeIsGetting();
    comments = await ProfileService.getComments(id, token);
    changeIsGetting();
  }

  getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ["png", "jpg", "jpeg"]);
    List<File> files = [];
    if (result != null) {
      files = result.paths.map((path) => File(path.toString())).toList();
    } else {
      return;
    }
    image = files[0];
    update();
  }

  deleteImage() {
    image = null;
    update();
  }
}
