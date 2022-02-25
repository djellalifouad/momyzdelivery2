import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momyzdelivery/ui/views/orders/view_invoice.dart';
import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../complaints/view_choose_type_complaint.dart';
import '../complaints/view_make_complaint.dart';
import '../complaints/view_make_complaint2.dart';

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Pallete.backGroundColor2,
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Pallete.backGroundColor2,
          elevation: 0,
          title: Text(
            'order_detail_title'.tr,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Pallete.greyColorPrinciple),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Center(
                child: Text(
                  '20 June 2022:05:30 PM',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'product_details'.tr,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                width: 327.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.sp)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 16.w,
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('زينة أعياد الميلاد ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: Colors.black)),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                width: 205.w,
                                height: 10.h,
                                child: Text(
                                  'من سلطنة وعمان ود أن أقيم في كل من سلطنة وعمان من سلطنة وعمان  من سلطنة وعمان  رم ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 8.sp,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Image.asset('assets/images/cover.png'),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              '2022.02.23',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                  color: Pallete.greyColorPrinciple),
                            ),
                            Text(" : " + 'date'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          width: 28.w,
                        ),
                        Row(
                          children: [
                            Text('2',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: Pallete.greyColorPrinciple)),
                            Text(" : " + 'qty'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          width: 28.w,
                        ),
                        Row(
                          children: [
                            Text(
                              '2500 ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                  color: Pallete.greyColorPrinciple),
                            ),
                            Text(" : " + 'price'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('market'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Pallete.greyColorPrinciple)),
              SizedBox(
                height: 12.h,
              ),
              Container(
                  width: 327.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.sp)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('سعيد رحماني ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: Colors.black)),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'fks nkfsk jkfls',
                                            style: GoogleFonts.poppins(
                                              fontSize: 10.sp,
                                              color: Pallete.greyColorPrinciple,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/location.svg',
                                            height: 12.sp,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '0553525534',
                                        style: GoogleFonts.poppins(
                                          fontSize: 10.sp,
                                          color: Pallete.greyColorPrinciple,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/phone.svg',
                                        height: 12.sp,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 17.w,
                          ),
                          Image.asset('assets/images/test.png'),
                        ]),
                  )),
              SizedBox(
                height: 12.h,
              ),
              Text('sended_to'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Pallete.greyColorPrinciple)),
              SizedBox(
                height: 12.h,
              ),
              Container(
                  width: 327.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.sp)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('سعيد رحماني ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: Colors.black)),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'fks nkfsk jkfls',
                                            style: GoogleFonts.poppins(
                                              fontSize: 10.sp,
                                              color: Pallete.greyColorPrinciple,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/location.svg',
                                            height: 12.sp,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '0553525534',
                                        style: GoogleFonts.poppins(
                                          fontSize: 10.sp,
                                          color: Pallete.greyColorPrinciple,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/phone.svg',
                                        height: 12.sp,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 17.w,
                          ),
                          Image.asset('assets/images/test.png'),
                        ]),
                  )),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  'delivery_address'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Image.asset('assets/images/Frame 56.png'),
              SizedBox(
                height: 24.h,
              ),
              Container(
                  width: 327.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.sp)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'deliver_vehicule'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: Pallete.greyColorPrinciple),
                                  ),
                                  Text(
                                    'delivery_address'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Container(
                                height: 40.sp,
                                width: 40.sp,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(251, 229, 229, 1),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.sp),
                                  child: SvgPicture.asset(
                                      'assets/icons/Motorcycle Delivery.svg'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 22.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'delivery_address'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: Pallete.greyColorPrinciple),
                                  ),
                                  Text(
                                    'delivery_address'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Container(
                                height: 40.sp,
                                width: 40.sp,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(251, 229, 229, 1),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.sp),
                                  child: SvgPicture.asset(
                                      'assets/icons/Time Square.svg'),
                                ),
                              ),
                            ],
                          )
                        ]),
                  )),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseComplaintType()));
                    },
                    child: Row(
                      children: [
                        Text(
                          'make_complaint2'.tr,
                          style: TextStyle(
                            color: Color.fromRGBO(235, 87, 87, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        SvgPicture.asset('assets/icons/Shield Fail 2.svg')
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Invoice()));
                    },
                    child: Row(
                      children: [
                        Text(
                          'open_invoice'.tr,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Pallete.pinkColorPrinciple,
                            fontWeight: FontWeight.w600,
                            height: 1,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
