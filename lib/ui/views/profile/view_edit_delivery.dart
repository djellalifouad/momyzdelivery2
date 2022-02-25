import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditDelivery extends StatelessWidget {
  const EditDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 40.w,
        leading: Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Container(
            height: 10.sp,
            width: 10.sp,
            child: SvgPicture.asset(
              'assets/icons/Edit2.svg',
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
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
          "deliver_vehicule".tr,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Container(
                  height: 120.sp,
                  width: 120.sp,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(251, 229, 229, 1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(25.sp),
                        child: SvgPicture.asset('assets/icons/Frame.svg')),
                  )),
            ),
            SizedBox(
              height: 13.h,
            ),
            Center(
              child: Text(
                'دراجة نارية',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 33.h,
            ),
            Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'name_vehicule2'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: Pallete.greyColorPrinciple,
                            ),
                          ),
                          Text(
                            'fdfdfd',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Line.svg',
                        width: 0.9.sw,
                      ),
                      SizedBox(
                        height: 18.h,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'type_vehicule2'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: Pallete.greyColorPrinciple,
                            ),
                          ),
                          Text(
                            'fdfdfd',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Line.svg',
                        width: 0.9.sw,
                      ),
                      SizedBox(
                        height: 18.h,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'number_matricule'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: Pallete.greyColorPrinciple,
                            ),
                          ),
                          Text(
                            '2345678906788',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      SvgPicture.asset(
                        'assets/icons/Line.svg',
                        width: 0.9.sw,
                      ),
                      SizedBox(
                        height: 18.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'vehicule_pic'.tr,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 120.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset('assets/images/one.png'),
                  Image.asset('assets/images/two.png'),
                  Image.asset('assets/images/three.png'),
                  Image.asset('assets/images/one.png'),
                  Image.asset('assets/images/two.png'),
                  Image.asset('assets/images/three.png'),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'vehicule_type2'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
                Icon(
                  Icons.add,
                  color: Pallete.pinkColorPrinciple,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 63.h,
              width: 0.9.sw,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 246, 250, 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(children: [
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 38.sp,
                  width: 38.sp,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: SvgPicture.asset('assets/icons/docs.svg')),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'البطاقة الرمادية',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/pined.svg',
                          color: Pallete.pinkColorPrinciple,
                          height: 15.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'categories.pdf',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                              color: Pallete.pinkColorPrinciple),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 110.w,
                ),
                Text(
                  'delete_file'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(235, 87, 87, 1)),
                )
              ]),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        )),
      ),
    );
  }
}
