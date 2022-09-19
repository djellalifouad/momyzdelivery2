import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momyzdelivery/constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListComplaint extends StatefulWidget {
  @override
  State<ListComplaint> createState() => _ListComplaintState();
}

class _ListComplaintState extends State<ListComplaint> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backGroundColor2,
        leading: InkWell(
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
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "signals".tr,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Pallete.backGroundColor2,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 26.h,
          ),
          Center(
            child: Container(
              width: 326.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        active = false;
                        setState(() {});
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Container(
                          width: 132.w,
                          height: 38.h,
                          child: Center(
                              child: Text(
                            'on_review'.tr,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: !active ? Colors.white : Colors.black,
                            ),
                          )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: !active
                                ? Pallete.pinkColorPrinciple
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        active = true;
                        setState(() {});
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Container(
                          width: 122.w,
                          height: 38.h,
                          child: Center(
                              child: Text(
                            'signaled_success'.tr,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: active ? Colors.white : Colors.black,
                            ),
                          )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: active
                                ? Pallete.pinkColorPrinciple
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Container(
            width: 326.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(19.sp),
              child: Row(children: [
                Container(
                  height: 44.sp,
                  width: 44.sp,
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: SvgPicture.asset(
                      'assets/icons/dangerTriangle.svg',
                      color: Pallete.greyColorPrinciple,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'خداع',
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/Time Circle.svg'),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '12 June 2022 - 12:00 AM',
                          style: TextStyle(
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 28.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Container(
                    height: 25.5.h,
                    width: 85.w,
                    child: Center(
                      child: Text(
                        'on_review'.tr,
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(242, 153, 74, 1)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Color.fromRGBO(242, 153, 74, 0.15)),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            width: 326.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(19.sp),
              child: Row(children: [
                Container(
                  height: 44.sp,
                  width: 44.sp,
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: SvgPicture.asset(
                      'assets/icons/dangerTriangle.svg',
                      color: Pallete.greyColorPrinciple,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'خداع',
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/Time Circle.svg'),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '12 June 2022 - 12:00 AM',
                          style: TextStyle(
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 28.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Container(
                    height: 25.5.h,
                    width: 85.w,
                    child: Center(
                      child: Text(
                        'on_review'.tr,
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(242, 153, 74, 1)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Color.fromRGBO(242, 153, 74, 0.15)),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            width: 326.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(19.sp),
              child: Row(children: [
                Container(
                  height: 44.sp,
                  width: 44.sp,
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: SvgPicture.asset(
                      'assets/icons/dangerTriangle.svg',
                      color: Pallete.greyColorPrinciple,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'خداع',
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/Time Circle.svg'),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '12 June 2022 - 12:00 AM',
                          style: TextStyle(
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 28.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Container(
                    height: 25.5.h,
                    width: 85.w,
                    child: Center(
                      child: Text(
                        'on_review'.tr,
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(242, 153, 74, 1)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Color.fromRGBO(242, 153, 74, 0.15)),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            width: 326.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(19.sp),
              child: Row(children: [
                Container(
                  height: 44.sp,
                  width: 44.sp,
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: SvgPicture.asset(
                      'assets/icons/dangerTriangle.svg',
                      color: Pallete.greyColorPrinciple,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'خداع',
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/Time Circle.svg'),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '12 June 2022 - 12:00 AM',
                          style: TextStyle(
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 28.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Container(
                    height: 25.5.h,
                    width: 85.w,
                    child: Center(
                      child: Text(
                        'on_review'.tr,
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(242, 153, 74, 1)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Color.fromRGBO(242, 153, 74, 0.15)),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            width: 326.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(19.sp),
              child: Row(children: [
                Container(
                  height: 44.sp,
                  width: 44.sp,
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: SvgPicture.asset(
                      'assets/icons/dangerTriangle.svg',
                      color: Pallete.greyColorPrinciple,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'خداع',
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/Time Circle.svg'),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '12 June 2022 - 12:00 AM',
                          style: TextStyle(
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 28.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Container(
                    height: 25.5.h,
                    width: 85.w,
                    child: Center(
                      child: Text(
                        'on_review'.tr,
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(242, 153, 74, 1)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Color.fromRGBO(242, 153, 74, 0.15)),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            width: 326.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(19.sp),
              child: Row(children: [
                Container(
                  height: 44.sp,
                  width: 44.sp,
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: SvgPicture.asset(
                      'assets/icons/dangerTriangle.svg',
                      color: Pallete.greyColorPrinciple,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'خداع',
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/Time Circle.svg'),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '12 June 2022 - 12:00 AM',
                          style: TextStyle(
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 28.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Container(
                    height: 25.5.h,
                    width: 85.w,
                    child: Center(
                      child: Text(
                        'on_review'.tr,
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(242, 153, 74, 1)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Color.fromRGBO(242, 153, 74, 0.15)),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            width: 326.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(19.sp),
              child: Row(children: [
                Container(
                  height: 44.sp,
                  width: 44.sp,
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: SvgPicture.asset(
                      'assets/icons/dangerTriangle.svg',
                      color: Pallete.greyColorPrinciple,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'خداع',
                      style: TextStyle(
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/Time Circle.svg'),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '12 June 2022 - 12:00 AM',
                          style: TextStyle(
                            color: Color.fromRGBO(189, 189, 189, 1),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 28.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Container(
                    height: 25.5.h,
                    width: 85.w,
                    child: Center(
                      child: Text(
                        'on_review'.tr,
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(242, 153, 74, 1)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Color.fromRGBO(242, 153, 74, 0.15)),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 24.h,
          )
        ],
      )),
    );
  }
}
