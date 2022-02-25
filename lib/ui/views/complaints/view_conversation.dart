import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Conversation extends StatelessWidget {
  const Conversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backGroundColor2,
      appBar: AppBar(
        backgroundColor: Pallete.backGroundColor2,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "blavla".tr,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 0.8.sh,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(249, 72, 146, 0.15),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Text(
                              'لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م منلوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Image.asset('assets/images/message.png')),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(235, 236, 240, 1),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Text(
                              'لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م منلوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(235, 236, 240, 1),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Text(
                              'لوريم ايبسوم دولاريبسوم دوم دومن',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(235, 236, 240, 1),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Text(
                              'لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م منلوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(235, 236, 240, 1),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Text(
                              'لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م منلوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(249, 72, 146, 0.15),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Text(
                              'لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م منلوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(249, 72, 146, 0.15),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Text(
                              'لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م منلوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(249, 72, 146, 0.15),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Text(
                              'لوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م منلوريم ايبسوم دولاريبسوم دولار سيبسوم دولار س سا م من',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 50.h,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 15.sp,
                      maxWidth: 60.sp,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 15.sp,
                      maxWidth: 60.sp,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 25.w, left: 10.w),
                      child: SvgPicture.asset('assets/icons/pined.svg'),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 10.w),
                      child: SvgPicture.asset(
                        'assets/icons/Send.svg',
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(252, 250, 250, 1),
                    hintText: 'write_your_message'.tr,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Pallete.pinkColorPrinciple),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
