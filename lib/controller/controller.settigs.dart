import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/ui/views/auth/view_login1.dart';

import '../constant/pallete.const.dart';
import '../services/service.profile.dart';
import '../ui/views/toast/toast.message.dart';

class SettingsController extends GetxController {
  bool isSending = true;
  changeStateIsRegistring() {
    isSending = !isSending;
    update();
  }

  String token = "";
  var box;
  final TextEditingController codePinController = TextEditingController();
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
    super.onInit();
  }

  logout() {
    Get.dialog(AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          height: 10,
        ),
        SvgPicture.asset('assets/icons/DangerIcon.svg'),
        SizedBox(
          height: 15,
        ),
        Text(
          'leave_app'.tr,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'leave_desc'.tr,
          style: TextStyle(
            fontSize: 8,
          ),
        )
      ]),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Container(
          height: 27,
          width: 77,
          child: TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(235, 87, 87, 1),
                  textStyle: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              onPressed: () async {
                bool result = await ProfileService.logout(token);
                box.remove('token');
                Get.offAll(Login1View());
                if (result) {
                  showMessage("success".tr);
                } else {
                  showMessage("error".tr);
                }
              },
              child: Text(
                'logout'.tr,
                style: TextStyle(color: Colors.white),
              )),
        ),
        Container(
          height: 27,
          width: 77,
          child: TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(251, 229, 229, 1),
                  textStyle: TextStyle(
                      fontSize: 7,
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
