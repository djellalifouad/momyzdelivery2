import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder2.dart';
import 'package:momyzdelivery/ui/views/stats/view_withdrawal.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';
import '../wait_view.dart';
import 'components/component.itemStat.dart';

class StateUser extends StatelessWidget {
  List<Widget> images = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 250, 1),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(245, 246, 250, 1),
          centerTitle: true,
          title: Text(
            "my_benifit".tr,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          leading: Container(),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                left: 15.w,
              ),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  )),
            ),
          ]),
      body: Align(
        alignment: Alignment.topRight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 26.h,
                      ),
                      Center(
                        child: Text(
                          " \$ 527.12".toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 50.sp,
                            fontWeight: FontWeight.w600,
                            color: Pallete.pinkColorPrinciple,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: Text(
                          "my_benifit_month".tr,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 70.w,
                          ),
                          child: ButtonComponent('withdrawal'.tr, () {
                            Get.to(Withdrawal());
                          })),
                      /*
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        'stats'.tr,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Column(
                        children: [
                          ItemStat(
                            title: 'my_benifit_month'.tr,
                            value: "527.12\$",
                          ),
                          ItemStat(
                            title: 'avg_benifit'.tr,
                            value: "527.12\$",
                          ),
                          ItemStat(
                            title: 'sum_order'.tr,
                            value: "527.12\$",
                          ),
                          ItemStat(
                            title: 'available _to_withdrawal'.tr,
                            value: "527.12\$",
                          ),
                          ItemStat(
                            title: 'withdrawal2'.tr,
                            value: "527.12\$",
                          ),
                        ],
                      ),
                      Text(
                        'total'.tr,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Column(
                        children: [
                          ItemStat(
                            title: 'totalDistance'.tr,
                            value: "527km",
                          ),
                          ItemStat(
                            title: 'totalTime'.tr,
                            value: "4h30min",
                          ),
                        ],
                      ),
                    */
                    ]),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: 1.sw,
                height: 60.h,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(242, 242, 242, 1)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          SvgPicture.asset('assets/icons/Chart.svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'stats'.tr,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Pallete.greyText,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: Color.fromRGBO(130, 130, 130, 1),
                            size: 15.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      )
                    ]),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'my_trans'.tr,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: 12.h, left: 24.w, right: 24.w),
                    child: Container(
                      height: 70.h,
                      width: 327.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 14.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '9:21',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                        color: Pallete.greyText),
                                  ),
                                  Text(
                                    'سحب الأموال',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 14.w),
                              child: Text(
                                '+12 \$',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: Color.fromRGBO(
                                      33,
                                      150,
                                      83,
                                      1,
                                    )),
                              ),
                            )
                          ]),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r)),
                    ),
                  );
                },
                itemCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
