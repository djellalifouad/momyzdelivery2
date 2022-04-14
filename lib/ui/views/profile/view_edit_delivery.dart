import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momyzdelivery/ui/views/profile/view_editCarInformation.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/controller.editDelivery.dart';
import '../../../controller/controller.splash.dart';

class EditDelivery extends StatelessWidget {
  const EditDelivery({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final editProfileController = EditDeliveryController();
    final splashController = Get.find<SplashController>();
    return GetBuilder<SplashController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 40.w,
          leading: InkWell(
            onTap: () {
              Get.to(CarInformationRegisterUpdate());
            },
            child: Padding(
              padding: Get.locale!.countryCode == "US"
                  ? EdgeInsets.only(left: 20.w)
                  : EdgeInsets.only(right: 20.w),
              child: Container(
                height: 10.sp,
                width: 10.sp,
                child: SvgPicture.asset(
                  'assets/icons/Edit2.svg',
                ),
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.back();
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
                  splashController.v!.name,
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
                              splashController.v!.car!.name,
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
                              splashController.v!.car!.model,
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
                              splashController.v!.car!.card_number,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'vehicule_pic'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      editProfileController.addCarImage();
                    },
                    child: SvgPicture.asset('assets/icons/add.svg'),
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                height: 120.h,
                child: ListView.builder(
                  itemCount: splashController.v!.car!.images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onLongPress: () {
                      editProfileController.deleteCarImage(
                          splashController.v!.car!.images[index].id.toString());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Container(
                        width: 120.sp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: splashController
                                  .v!.car!.images[index].image_url),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'vehicule_type2'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () async {
                  Get.defaultDialog(
                      title: 'البطاقة الرمادية',
                      titlePadding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                      titleStyle: TextStyle(fontSize: 15.sp),
                      content: Container(
                        height: 100.sp,
                        width: 150.sp,
                        child: CachedNetworkImage(
                          imageUrl: splashController
                              .v!.car!.car_registration_certificate_image_url,
                          fit: BoxFit.cover,
                        ),
                        decoration: BoxDecoration(),
                      ));
                },
                child: Container(
                  height: 63.h,
                  width: 0.9.sw,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 246, 250, 1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
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
                                  child: SvgPicture.asset(
                                      'assets/icons/docs.svg')),
                            ),
                            SizedBox(
                              width: 24.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'greyCard'.tr,
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
                                      'cardRegistration.png',
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
                          ]),
                        ),
                        /*
                        Padding(
                          padding: EdgeInsets.only(
                            left: 17.w,
                          ),
                          child: Text(
                            'delete_file'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                                decoration: TextDecoration.underline,
                                color: Color.fromRGBO(235, 87, 87, 1)),
                          ),
                        ),
                        */
                      ]),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          )),
        ),
      );
    });
  }
}
