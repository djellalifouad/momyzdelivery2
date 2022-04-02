import 'dart:async';
import 'package:flutter/material.dart';
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
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.6976541, -0.6337376),
    zoom: 16.4746,
  );
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  bool deliveryValue = true;
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return GetBuilder<SplashController>(builder: (splashController) {
      return SafeArea(
        child: new Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                zoomGesturesEnabled: false,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              splashController.v!.state == 2
                  ? Positioned(
                      top: 40.sp,
                      right: 20.sp,
                      child: Container(
                        height: 34.h,
                        width: 110.w,
                        child: Row(children: [
                          Switch(
                              focusColor: Pallete.pinkColorPrinciple,
                              activeColor: Pallete.pinkColorPrinciple,
                              value: splashController.v!.online == 2
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
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
