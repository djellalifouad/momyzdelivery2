import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momyzdelivery/constant/pallete.const.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/controller/controller.home.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';

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
                            target: homeController.currentLocation!, zoom: 75),
                        onMapCreated: (GoogleMapController controller) {},
                      ),
                splashController.v!.state == 2
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
                                  homeController.updateLocation();
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
