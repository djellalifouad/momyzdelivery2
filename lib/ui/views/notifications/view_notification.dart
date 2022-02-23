import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/pallete.const.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Pallete.backGroundColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "notifications".tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Pallete.backGroundColor,
            body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                ),
                child: Align(
                    alignment: Alignment.topRight,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 21.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'today'.tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'read_all_notif'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Pallete.greyText,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/test.png'),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'لديك طلب جديد',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 0.37.sw),
                                    Text(
                                      'منذ ساعة ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        color: Pallete.pinkColorPrinciple,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Pallete.greyText,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/test.png'),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'لديك طلب جديد',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 0.37.sw),
                                    Text(
                                      'منذ ساعة ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        color: Pallete.pinkColorPrinciple,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Pallete.greyText,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/test.png'),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'لديك طلب جديد',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 0.37.sw),
                                    Text(
                                      'منذ ساعة ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        color: Pallete.pinkColorPrinciple,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Pallete.greyText,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/test.png'),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'لديك طلب جديد',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 0.37.sw),
                                    Text(
                                      'منذ ساعة ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        color: Pallete.pinkColorPrinciple,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Pallete.greyText,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/test.png'),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'لديك طلب جديد',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 0.37.sw),
                                    Text(
                                      'منذ ساعة ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        color: Pallete.pinkColorPrinciple,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Pallete.greyText,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/test.png'),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'لديك طلب جديد',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 0.37.sw),
                                    Text(
                                      'منذ ساعة ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        color: Pallete.pinkColorPrinciple,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Pallete.greyText,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/test.png'),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'لديك طلب جديد',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 0.37.sw),
                                    Text(
                                      'منذ ساعة ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        color: Pallete.pinkColorPrinciple,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Pallete.greyText,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/test.png'),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'لديك طلب جديد',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 0.37.sw),
                                    Text(
                                      'منذ ساعة ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        color: Pallete.pinkColorPrinciple,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Pallete.greyText,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ))))));
  }
}
