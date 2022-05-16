import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/models/model.user.dart';
import 'package:momyzdelivery/services/service.profile.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/pallete.const.dart';

class ProfileController extends GetxController {
  var box = GetStorage();
  bool isSending = false;
  String token = "";
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
    super.onInit();
  }

  changeStateIsSending() {
    isSending = !isSending;
    update();
  }

  var fileImage = null;
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
    fileImage = files[0];
    changeStateIsSending();
    String? imageUrl =
        await ProfileService.updateProfilePicture(fileImage, token);
    changeStateIsSending();
    if (imageUrl == null) {
      return;
    } else {
      final splashController = Get.find<SplashController>();
      Driver? v = splashController.v;
      v!.image_url = imageUrl;
      splashController.updateDriver(v);
    }
    update();
  }

  deleteAccount() {
    Get.dialog(AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          height: 15.h,
        ),
        SvgPicture.asset('assets/icons/DangerIcon.svg'),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'delete_account'.tr,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
        Text(
          'delete_account_desc'.tr,
          style: TextStyle(
            fontSize: 14.sp,
          ),
          textAlign: TextAlign.center,
        )
      ]),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Container(
          height: 35,
          width: 80,
          child: TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(235, 87, 87, 1),
                  textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              onPressed: () async {
                String result = await ProfileService.sendDeleteAccount(token);
                Get.back();
                if (result == "already_exist") {
                  showMessage("already_exist".tr);
                  return;
                }
                if (result == "success") {
                  showMessage("delete_sended".tr);
                  return;
                } else {
                  showMessage("error".tr);
                  return;
                }
              },
              child: Text(
                'confirm_delete'.tr,
                style: GoogleFonts.ibmPlexSansArabic(color: Colors.white),
              )),
        ),
        Container(
          height: 35,
          width: 80,
          child: TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(251, 229, 229, 1),
                  textStyle: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              onPressed: () async {
                Get.back();
              },
              child: Text(
                'cancel_delete'.tr,
                style: TextStyle(color: Pallete.pinkColorPrinciple),
              )),
        ),
      ],
    ));
  }
}
