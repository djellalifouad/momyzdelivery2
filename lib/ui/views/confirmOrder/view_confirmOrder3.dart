import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder2.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../bottom/view_bottom.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';
import '../profile/view_profile.dart';
import '../stats/view_stat_profile.dart';
import '../wait_view.dart';

class ConfirmOrder3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.backGroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 111.h,
                    ),
                    Center(child: SvgPicture.asset('assets/icons/rafiki.svg')),
                    SizedBox(
                      height: 52.h,
                    ),
                    Center(
                        child: Text(
                      'order_received'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25.sp,
                      ),
                    )),
                    SizedBox(
                      height: 40.h,
                    ),
                    ButtonComponent('open_map'.tr, () {
                      Get.to(ProvidedStylesExample());
                    }),
                    SizedBox(
                      height: 48.h,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
