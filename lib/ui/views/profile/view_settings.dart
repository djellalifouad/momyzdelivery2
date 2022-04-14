import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/controller/controller.settigs.dart';
import 'package:momyzdelivery/ui/views/profile/view_editCarInformation.dart';
import 'package:momyzdelivery/ui/views/profile/view_personalInfoUpdate.dart';
import 'package:momyzdelivery/ui/views/profile/view_updatePhone.dart';

import '../../../constant/pallete.const.dart';
import 'components/component.profile.dart';
import 'components/component.profile2.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Scaffold(
      backgroundColor: Pallete.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 40.w,
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Container(
                    padding: EdgeInsets.all(5.sp),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ))),
          )
        ],
        centerTitle: true,
        elevation: 0,
        title: Text(
          "settings".tr,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 57.h,
        ),
        InkWell(
          onTap: () {
            Get.to(PersonalInfoUpdateView());
          },
          child: ProfileCompoenent2(
            isRed: false,
            isIcon: true,
            title: 'personal_info'.tr,
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(UpdatePhone());
          },
          child: ProfileCompoenent2(
            isRed: false,
            isIcon: true,
            title: 'phone_number'.tr,
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(CarInformationRegisterUpdate());
          },
          child: ProfileCompoenent2(
            isRed: false,
            isIcon: true,
            title: 'delivery3'.tr,
          ),
        ),
        InkWell(
          onTap: () {
            controller.changeLanguage(context);
          },
          child: ProfileCompoenent2(
            isRed: false,
            isIcon: false,
            title: 'app_language'.tr,
          ),
        ),
        InkWell(
          onTap: () {
            controller.logout();
          },
          child: ProfileCompoenent2(
            isRed: true,
            isIcon: false,
            title: 'logout'.tr,
          ),
        ),
      ]),
    );
  }
}
