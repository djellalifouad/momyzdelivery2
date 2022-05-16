import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/ui/views/auth/view_login1.dart';
import 'package:stacked/stacked.dart';

import '../constant/pallete.const.dart';
import '../services/service.profile.dart';
import '../ui/views/toast/toast.message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          height: 15,
        ),
        SvgPicture.asset('assets/icons/DangerIcon.svg'),
        SizedBox(
          height: 15,
        ),
        Text(
          'leave_app'.tr,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'leave_desc'.tr,
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
                bool result = await ProfileService.logout(token);
                box.remove('token');
                Get.offAll(Login1View());
                if (result) {
                  showMessage("success_logout".tr);
                } else {
                  showMessage("error".tr);
                }
              },
              child: Text(
                'logout'.tr,
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
                  textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              onPressed: () async {
                Get.back();
              },
              child: Text(
                'cancel_delete'.tr,
                style: GoogleFonts.ibmPlexSansArabic(
                    color: Pallete.pinkColorPrinciple),
              )),
        ),
      ],
    ));
  }

  changeLanguage(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              contentPadding: EdgeInsets.symmetric(vertical: 15.h),
              content: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.updateLocale(Locale('en', 'US'));
                          GetStorage().write("lang", "en");

                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 12.w,
                                ),
                                Image.asset(
                                  'assets/images/en.png',
                                ),
                                SizedBox(
                                  width: 31.w,
                                ),
                                Text(
                                  'english'.tr,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            GetStorage().read('lang') == "en"
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: SvgPicture.asset(
                                      'assets/icons/checkmark.svg',
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.5.h,
                        color: Pallete.greyText,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      InkWell(
                        onTap: () {
                          Get.updateLocale(Locale('ar', 'AR'));
                          GetStorage().write("lang", "ar");
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 12.w,
                                ),
                                SvgPicture.asset('assets/icons/ar.svg'),
                                SizedBox(
                                  width: 31.w,
                                ),
                                Text(
                                  'arabic'.tr,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            GetStorage().read('lang') == "ar"
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: SvgPicture.asset(
                                      'assets/icons/checkmark.svg',
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ]),
              ),
            ));
  }
}
