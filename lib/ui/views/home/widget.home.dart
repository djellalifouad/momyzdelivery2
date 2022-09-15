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
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../services/service.orders.dart';
import '../components/component_button.dart';
import '../confirmOrder/view_confirmOrder2.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> with WidgetsBindingObserver {
  @override
  void initState() {
    homeController.check();
    homeController.getCurrentLocation();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        homeController.check();
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return GetBuilder<SplashController>(builder: (splashController) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: Builder(builder: (context) {
              if (homeController.showboolBottomOrder3 &&
                  homeController.order != null) {
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/icons/Ellipse 10 .svg'),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'taked_from'.tr,
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
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/Ellipse 12.svg'),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              homeController.order!.store!.address,
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SvgPicture.asset('assets/icons/Ellipse 13.svg'),
                        SizedBox(
                          height: 5.h,
                        ),
                        SvgPicture.asset('assets/icons/Ellipse 14.svg'),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/Ellipse 15.svg'),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'to'.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Pallete.greyText),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Text(
                            homeController.order!.address,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('store_name'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: Pallete.greyText)),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  homeController.order!.store!.name.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 66.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'order_qty'.tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: Pallete.greyText),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  homeController.order!.items.length.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('special_information'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Pallete.greyText)),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              homeController.order!.delivery_type.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                homeController.order!.shipping.toString() +
                                    " ₪",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.sp,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text('delivery_price'.tr),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ButtonComponent("accept_order".tr, () async {
                          bool val = await OrderService.acceptOrder(
                              homeController.order!.id.toString(),
                              homeController.token.toString());
                          if (val) {
                            GetStorage().write("currentOrder",
                                homeController.order!.id.toString());
                            Get.back();
                            homeController.getDirections();
                            homeController.showboolBottomOrder2 = true;
                            homeController.showboolBottomOrder3 = false;
                            homeController.update();
                          }
                        }),
                        SizedBox(
                          height: 22.h,
                        ),
                        InkWell(
                          onTap: () async {
                            bool val = await OrderService.declineOrder(
                                homeController.order!.id.toString(),
                                homeController.token);
                            if (val) {
                              homeController.showboolBottomOrder3 = false;
                              homeController.update();
                            } else {}
                          },
                          child: Center(
                            child: Text(
                              "decline_order".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: Color.fromRGBO(235, 87, 87, 1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 62.h,
                        ),
                      ],
                    ),
                  ),
                );
              }
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
                            homeController.order!.store!.address.toString(),
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
                            homeController.order!.store!.address,
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
                            homeController.order!.address,
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
              alignment: Alignment.center,
              children: [
                homeController.currentLocation == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonComponent('autoLocation'.tr, () {
                              controller.getCurrentLocation();
                              //   splashController.updatePosition();
                            }),
                          ],
                        ),
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
                            target: homeController.currentLocation!, zoom: 18),
                        onMapCreated: (GoogleMapController controller) {
                          setState(() {});
                        },
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
                                onChanged: (val) async {
                                  if (splashController.v!.online == 2) {
                                    if (await Permission
                                            .location.isPermanentlyDenied ||
                                        await Permission.location.isDenied ||
                                        await Permission.location.isLimited ||
                                        await Permission
                                            .location.isRestricted ||
                                        !await Geolocator
                                            .isLocationServiceEnabled()) {
                                      showMessage(
                                          'من أجل الإنطلاق في عملية توصيل الطلبات يرجى تفعيل GPS');
                                      return;
                                    } else {
                                      homeController.updateLocation();
                                    }
                                  } else {
                                    homeController.updateLocation();
                                  }
                                }),
                            Text(
                              'ondelivery'.tr,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white),
                        ),
                      )
                    : Positioned(
                        top: 20.sp,
                        left: 20.sp,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                          ),
                          height: 34.h,
                          child: Row(children: [
                            Switch(
                                focusColor: Colors.grey,
                                activeColor: Colors.grey,
                                value: false,
                                onChanged: (val) {
                                  // homeController.updateLocation();
                                }),
                            Text(
                              'ondelivery'.tr,
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.9),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white.withOpacity(0.5)),
                        ),
                      ),
                splashController.v!.state.toString() != "2"
                    ? Positioned(
                        bottom: 80.h,
                        child: Container(
                          height: 50.h,
                          width: 0.8.sw,
                          decoration: BoxDecoration(
                              color: Pallete.pinkColorPrinciple,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Center(
                            child: Text(
                              "account_verified".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
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
