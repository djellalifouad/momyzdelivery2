import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momyzdelivery/ui/views/orders/view_order_details.dart';

import '../../../constant/pallete.const.dart';
import 'package:get/get.dart';

class Orders extends StatefulWidget {
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Pallete.backGroundColor2,
            appBar: AppBar(
              backgroundColor: Pallete.backGroundColor2,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "orders".tr,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              actions: [
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Container(
                        padding: EdgeInsets.all(5.sp),
                        child: SvgPicture.asset('assets/icons/Search.svg')))
              ],
              leading: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(5.sp),
                    child: SvgPicture.asset(
                      'assets/icons/Filter.svg',
                      height: 10.sp,
                      width: 10.sp,
                    ),
                  )),
            ),
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
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            new OrderDetails()));
                              },
                              child: Container(
                                width: 327.w,
                                height: 188.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.sp),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 7.w,
                                    vertical: 15.h,
                                  ),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/test.png',
                                          height: 42.sp,
                                          width: 42.sp,
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'زينة أعياد الميلاد',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 0.30.sw,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 79.w,
                                                  height: 24.h,
                                                  decoration: BoxDecoration(
                                                    color: Pallete
                                                        .pinkColorPrinciple,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    '21 dec,2021',
                                                    style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: Colors.white,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )),
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
                                      height: 19.h,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 200.w,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 5.w,
                                                    ),
                                                    child: Container(
                                                      height: 20.sp,
                                                      width: 20.sp,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                        color: Pallete
                                                            .pinkColorPrinciple,
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            3.5.sp),
                                                        child: SvgPicture.asset(
                                                            'assets/icons/Group.svg'),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 16.w,
                                                  ),
                                                  Text(
                                                    'market'.tr + " :",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 6.w,
                                                  ),
                                                  Text(
                                                    'متجر سعادة القلب ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            Container(
                                              width: 200.w,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 5.w,
                                                    ),
                                                    child: Container(
                                                      height: 20.sp,
                                                      width: 20.sp,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                        color: Pallete
                                                            .pinkColorPrinciple,
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            3.5.sp),
                                                        child: SvgPicture.asset(
                                                            'assets/icons/Money.svg'),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 16.w,
                                                  ),
                                                  Text(
                                                    'delivery_price2'.tr + " :",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 6.w,
                                                  ),
                                                  Text(
                                                    'متجر سعادة القلب ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            Container(
                                              width: 200.w,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 5.w,
                                                    ),
                                                    child: Container(
                                                      height: 20.sp,
                                                      width: 20.sp,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                        color: Pallete
                                                            .pinkColorPrinciple,
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            3.5.sp),
                                                        child: SvgPicture.asset(
                                                            'assets/icons/Delivery Truck.svg'),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 16.w,
                                                  ),
                                                  Text(
                                                    'delivery_type'.tr + " :",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 6.w,
                                                  ),
                                                  Text(
                                                    'متجر سعادة القلب ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SvgPicture.asset(
                                            'assets/icons/Frame.svg'),
                                      ],
                                    )
                                  ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              width: 327.w,
                              height: 188.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.sp),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 15.h,
                                ),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/test.png',
                                        height: 42.sp,
                                        width: 42.sp,
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'زينة أعياد الميلاد',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 0.30.sw,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 79.w,
                                                height: 24.h,
                                                decoration: BoxDecoration(
                                                  color: Pallete
                                                      .pinkColorPrinciple,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '21 dec,2021',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
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
                                    height: 19.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Group.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'market'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Money.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'delivery_price2'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Delivery Truck.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'delivery_type'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          'assets/icons/Frame.svg'),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              width: 327.w,
                              height: 188.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.sp),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 15.h,
                                ),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/test.png',
                                        height: 42.sp,
                                        width: 42.sp,
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'زينة أعياد الميلاد',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 0.30.sw,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 79.w,
                                                height: 24.h,
                                                decoration: BoxDecoration(
                                                  color: Pallete
                                                      .pinkColorPrinciple,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '21 dec,2021',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
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
                                    height: 19.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Group.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'market'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Money.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'delivery_price2'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Delivery Truck.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'delivery_type'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          'assets/icons/Frame.svg'),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              width: 327.w,
                              height: 188.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.sp),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 15.h,
                                ),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/test.png',
                                        height: 42.sp,
                                        width: 42.sp,
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'زينة أعياد الميلاد',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 0.30.sw,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 79.w,
                                                height: 24.h,
                                                decoration: BoxDecoration(
                                                  color: Pallete
                                                      .pinkColorPrinciple,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '21 dec,2021',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
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
                                    height: 19.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Group.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'market'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Money.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'delivery_price2'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Delivery Truck.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'delivery_type'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          'assets/icons/Frame.svg'),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              width: 327.w,
                              height: 188.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.sp),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 15.h,
                                ),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/test.png',
                                        height: 42.sp,
                                        width: 42.sp,
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'زينة أعياد الميلاد',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 0.30.sw,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 79.w,
                                                height: 24.h,
                                                decoration: BoxDecoration(
                                                  color: Pallete
                                                      .pinkColorPrinciple,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '21 dec,2021',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
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
                                    height: 19.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Group.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'market'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Money.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'delivery_price2'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Delivery Truck.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'delivery_type'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          'assets/icons/Frame.svg'),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              width: 327.w,
                              height: 188.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.sp),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 15.h,
                                ),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/test.png',
                                        height: 42.sp,
                                        width: 42.sp,
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'زينة أعياد الميلاد',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 0.30.sw,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 79.w,
                                                height: 24.h,
                                                decoration: BoxDecoration(
                                                  color: Pallete
                                                      .pinkColorPrinciple,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '21 dec,2021',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
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
                                    height: 19.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Group.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'market'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Money.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'delivery_price2'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            width: 200.w,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 5.w,
                                                  ),
                                                  child: Container(
                                                    height: 20.sp,
                                                    width: 20.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color: Pallete
                                                          .pinkColorPrinciple,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          3.5.sp),
                                                      child: SvgPicture.asset(
                                                          'assets/icons/Delivery Truck.svg'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                Text(
                                                  'delivery_type'.tr + " :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  'متجر سعادة القلب ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SvgPicture.asset(
                                          'assets/icons/Frame.svg'),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        )
                      ],
                    ))))));
  }
}
