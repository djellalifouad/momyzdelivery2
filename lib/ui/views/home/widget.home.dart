import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momyzdelivery/constant/pallete.const.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/controller/controller.home.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';

import '../components/component_button.dart';
import '../confirmOrder/view_confirmOrder2.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    //fetch direction polylines from Google API
    super.initState();
  }

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return GetBuilder<SplashController>(builder: (splashController) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: Builder(builder: (context) {
              if (!homeController.showboolBottomOrder2) {
                print("hna2");
                return Container(
                  height: 0,
                  width: 0,
                );
              }
              if (homeController.ignore) {
                print("hna3");
                return Container(
                  height: 100.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Colors.white, // or some other color
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0.r),
                          topRight: Radius.circular(16.0.r))),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: InkWell(
                          onTap: () {
                            homeController.updateIgnore();
                          },
                          child: SvgPicture.asset('assets/icons/hide.svg')),
                    ),
                  ),
                );
              }
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white, // or some other color
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0.r),
                        topRight: Radius.circular(16.0.r))),
                child: Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'delivery_information'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              homeController.updateIgnore();
                            },
                            child: Icon(
                              Icons.clear,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/icons/Ellipse 10 .svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'order_place'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Pallete.greyText),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: SvgPicture.asset(
                          'assets/icons/Ellipse 12.svg',
                          height: 3.sp,
                          width: 3.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: SvgPicture.asset(
                          'assets/icons/Ellipse 12.svg',
                          height: 3.sp,
                          width: 3.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/icons/Location2.svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            homeController.order!.store.address.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Pallete.greyText),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.5.h,
                        color: Pallete.greyColorPrinciple,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/icons/Ellipse 10 .svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            homeController.order!.store.address,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Pallete.greyText),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: SvgPicture.asset(
                          'assets/icons/Ellipse 12.svg',
                          height: 3.sp,
                          width: 3.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: SvgPicture.asset(
                          'assets/icons/Ellipse 12.svg',
                          height: 3.sp,
                          width: 3.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/icons/Location2.svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            homeController.order!.user.address,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Pallete.greyText),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      ButtonComponent("order_delivered".tr, () {
                        homeController.clearPolyline();
                        homeController.clearMarkers();
                        homeController.hideBottom2();
                        Get.to(
                            ConfirmOrder2(homeController.order!.id.toString()));
                      }),
                      SizedBox(
                        height: 62.h,
                      ),
                    ],
                  ),
                ),
              );
            }),
            body: Stack(
              children: [
                homeController.currentLocation == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GoogleMap(
                        rotateGesturesEnabled: true,
                        myLocationButtonEnabled: true,
                        zoomControlsEnabled: false,
                        mapType: MapType.normal,
                        markers: homeController.markers,
                        polylines:
                            Set<Polyline>.of(homeController.polylines.values),
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                            target: homeController.currentLocation!, zoom: 25),
                        onMapCreated: (GoogleMapController controller) {},
                      ),
                splashController.v!.state.toString() == "2"
                    ? Positioned(
                        top: 20.sp,
                        left: 20.sp,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                          ),
                          height: 34.h,
                          child: Row(children: [
                            Switch(
                                focusColor: Pallete.pinkColorPrinciple,
                                activeColor: Pallete.pinkColorPrinciple,
                                value: splashController.v!.online == 1
                                    ? true
                                    : false,
                                onChanged: (val) {
                                  homeController.showtextBottomSheet();
                                  // homeController.updateLocation();
                                }),
                            Text(
                              'ondelivery'.tr,
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.bold),
                            ),
                          ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      });
    });
  }
}
