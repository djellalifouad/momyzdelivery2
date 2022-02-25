import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/component_button.dart';

class Invoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.pinkColorPrinciple,
      appBar: AppBar(
        backgroundColor: Pallete.pinkColorPrinciple,
        elevation: 0,
        leading: Container(),
        centerTitle: true,
        title: Text(
          'invoice_title'.tr,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 46.h,
        ),
        Stack(
          children: [
            Center(
              child: Container(
                width: 327.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(26.sp),
                  child: Column(children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('order_number'.tr,
                                style: TextStyle(
                                    color: Pallete.greyColorPrinciple,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400)),
                            Text('23456789678',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SvgPicture.asset('assets/icons/Line.svg')
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('date'.tr,
                                style: TextStyle(
                                    color: Pallete.greyColorPrinciple,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400)),
                            Text('23.02.2021',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SvgPicture.asset('assets/icons/Line.svg')
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('product'.tr,
                                style: TextStyle(
                                    color: Pallete.greyColorPrinciple,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400)),
                            Text('زينة أعياد الميلاد',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SvgPicture.asset('assets/icons/Line.svg')
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('market'.tr,
                                style: TextStyle(
                                    color: Pallete.greyColorPrinciple,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400)),
                            Text('23456789678',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SvgPicture.asset('assets/icons/Line.svg')
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('delivery2'.tr,
                                style: TextStyle(
                                    color: Pallete.greyColorPrinciple,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400)),
                            Text('23456789678',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SvgPicture.asset('assets/icons/Line.svg')
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('delivery3'.tr,
                                style: TextStyle(
                                    color: Pallete.greyColorPrinciple,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400)),
                            Text('23456789678',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SvgPicture.asset('assets/icons/Line.svg')
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      color: Pallete.pinkColorPrinciple,
                      height: 1.h,
                      width: 0.8.sw,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('delivery_price2'.tr,
                                style: TextStyle(
                                    color: Pallete.greyColorPrinciple,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400)),
                            Text('25',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SvgPicture.asset('assets/icons/Line.svg')
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('tax'.tr,
                                style: TextStyle(
                                    color: Pallete.greyColorPrinciple,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400)),
                            Text('0.1',
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 161, 201, 1),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SvgPicture.asset('assets/icons/Line.svg')
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('total'.tr,
                                style: TextStyle(
                                    color: Pallete.greyColorPrinciple,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400)),
                            Text('0.1',
                                style: TextStyle(
                                    color: Color.fromRGBO(249, 72, 146, 1),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        SizedBox(
                          height: 21.h,
                        ),
                        ButtonComponent('share_invoice'.tr, () {}),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    )
                  ]),
                ),
              ),
            ),
            Positioned(
                top: 95.h,
                left: 15.w,
                child: Container(
                  height: 24.sp,
                  width: 24.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Pallete.pinkColorPrinciple,
                  ),
                )),
            Positioned(
                top: 95.h,
                right: 15.w,
                child: Container(
                  height: 24.sp,
                  width: 24.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Pallete.pinkColorPrinciple,
                  ),
                )),
          ],
        )
      ]),
    );
  }
}
