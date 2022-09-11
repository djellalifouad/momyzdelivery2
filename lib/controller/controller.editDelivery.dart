import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/models/model.car.dart';
import 'package:momyzdelivery/models/model.user.dart';
import 'package:momyzdelivery/services/service.car.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/pallete.const.dart';
import 'controller.splash.dart';

class EditDeliveryController extends GetxController {
  File? image;
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

  addCarImage() async {
    token = box.read('token').toString();
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
    Car? car = await CarService.addCarImage(image, token);
    if (car != null) {
      Driver? v = splashController.v;
      v!.car = car;
      splashController.updateDriver(v);
      showMessage('add_pic_vehicule'.tr);
    } else {
      showMessage('error'.tr);
    }
    update();
  }

  deleteCarImage(String id) async {
    token = box.read('token').toString();
    Get.dialog(AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        SvgPicture.asset('assets/icons/DangerIcon.svg'),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'delete_car'.tr,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'delete_car_desc'.tr,
          style: TextStyle(
            fontSize: 14.sp,
          ),
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
                  textStyle: GoogleFonts.ibmPlexSansArabic(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 10.sp)),
              onPressed: () async {
                Car? car = await CarService.deleteCarImage(token, id);

                if (car != null) {
                  Driver? v = splashController.v;
                  v!.car = car;
                  splashController.updateDriver(v);
                  Get.back();
                  showMessage('delete_pic_vehicule'.tr);
                } else {
                  showMessage('error'.tr);
                }
              },
              child: Text(
                'confirm_delete'.tr,
                style: TextStyle(color: Colors.white, fontSize: 9.sp),
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
