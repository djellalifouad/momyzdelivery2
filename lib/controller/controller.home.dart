import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:momyzdelivery/constant/pallete.const.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/models/model.order.dart';
import 'package:momyzdelivery/models/model.user.dart';
import 'package:momyzdelivery/services/service.orders.dart';
import 'package:momyzdelivery/services/service.profile.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import '../ui/views/components/component_button.dart';
import '../ui/views/confirmOrder/view_confirmOrder1.dart';
import '../ui/views/confirmOrder/view_confirmOrder2.dart';

class HomeController extends GetxController {
  final splashController = Get.find<SplashController>();
  bool isProcessing = false;
  String token = "";
  var box;
  Order? order;
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    bool result = await activatePermision();
    if (!result) {
      return;
    }
    final splashController = Get.find<SplashController>();
    splashController.updatePosition();
    Geolocator.getCurrentPosition().then((va) {
      currentLocation = LatLng(va.latitude, va.longitude);
      getDirections();
      update();
    });
  }

  Future<bool> activatePermision() async {
    if (await Permission.location.isPermanentlyDenied ||
        await Permission.location.isDenied ||
        await Permission.location.isRestricted) {
      openAppSettings();
      return false;
    }
    if (await Permission.location.request().isDenied) {
      return false;
    } else {
      return true;
    }
  }

  clearPolyline() {
    polylines.clear();
    update();
  }

  clearMarkers() {
    markers.clear();
    update();
  }

  clearOrder() {
    clearMarkers();
    clearPolyline();
    order = null;
    update();
  }

  hideBottom2() {
    showboolBottomOrder2 = false;
    update();
  }

  updateLocation() async {
    if (isProcessing) {
      return;
    }
    isProcessing = true;
    token = box.read('token').toString();
    Driver? v = await ProfileService.updateOnlineState(token);
    isProcessing = false;
    if (v == null) {
      showMessage('error'.tr);
      return;
    } else {
      v!.car = splashController.v!.car;
      splashController.updateDriver(v);
      if (v.online == 1) {
        showMessage('you_online'.tr);
      } else {
        showMessage('you_offline'.tr);
      }
      update();
    }
  }

  previewOrder(String id) async {
    token = box.read('token').toString();
    order = await OrderService.previewOrder(id, token);
    showBottomOrder(id);
    update();
    return;
  }

  previewOrderNormal(String id) async {
    token = box.read('token').toString();
    order = await OrderService.previewOrder2(id, token);
    update();
    getDirections();
    showboolBottomOrder2 = true;
    update();
  }

  saveTocurrentOrder() {
    if (order != null) {
      GetStorage().write("currentOrder", order!.id.toString());
    }
  }

  bool showboolBottomOrder3 = false;
  showBottomOrder(String id) async {
    token = box.read('token').toString();
    order = await OrderService.previewOrder(id, token);
    showboolBottomOrder3 = true;
    update();
  }

  bool hide = false;
  showBottomOrder2() {
    getDirections();
    Get.bottomSheet(
      Container(
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
                      Get.back();
                      showBottomOrder3();
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
                    order!.store!.address.toString(),
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
                    order!.store!.address,
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
                    order!.user!.address,
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
                Get.to(ConfirmOrder2(order!.id.toString()));
              }),
              SizedBox(
                height: 22.h,
              ),
            ],
          ),
        ),
      ),
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      isDismissible: false,
      enableDrag: false,
    );
  }

  bool showboolBottomOrder2 = false;
  showtextBottomSheet() {
    Get.bottomSheet(
        Container(
          height: 160.h,
          width: 1.sw,
          color: Colors.white,
          child: Text("tesds"),
        ),
        useRootNavigator: false,
        ignoreSafeArea: false,
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        enableDrag: false,
        persistent: true);
  }

  bool ignore = false;
  updateIgnore() {
    ignore = !ignore;
    update();
  }

  showBottomOrder3() {
    Get.bottomSheet(
      Container(
        height: 60.h,
        width: 1.sw,
        decoration: BoxDecoration(
            color: Colors.white, // or some other color
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0.r),
                topRight: Radius.circular(16.0.r))),
        child: Center(
          child: InkWell(
              onTap: () {
                Get.back();
                showBottomOrder2();
              },
              child: SvgPicture.asset('assets/icons/hide.svg')),
        ),
      ),
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      isDismissible: false,
      enableDrag: false,
    );
  }

  getDirections() async {
    if (order == null) {
      return;
    }
    if (currentLocation == null) {
      await getCurrentLocation();
      return;
    }
    if (currentLocation == null) {
      return; 
    }
    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(currentLocation.toString()),
      position: LatLng(currentLocation!.latitude,
          currentLocation!.longitude), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'start_location'.tr,
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    markers.add(Marker(
      //add distination location marker
      markerId:
          MarkerId(order!.store!.lat.toString() + order!.store!.lon.toString()),
      position:
          LatLng(order!.store!.lat, order!.store!.lon), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'store_location'.tr,
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    markers.add(Marker(
      //add distination location marker
      markerId: MarkerId(order!.lat.toString() + order!.lon.toString()),
      position: LatLng(order!.lat, order!.lon),
      infoWindow: InfoWindow(
        //popup info
        title: 'user_location'.tr,
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(currentLocation!.latitude, currentLocation!.longitude),
      PointLatLng(order!.store!.lat, order!.store!.lon),
      travelMode: TravelMode.driving,
      optimizeWaypoints: true,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates, "1");
    result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(order!.store!.lat, order!.store!.lon),
      PointLatLng(order!.lat, order!.lon),
      travelMode: TravelMode.driving,
      optimizeWaypoints: true,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates, "2");
    update();
  }

  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyCh4YCK9UppAKQShFZKjyDBN4sNMJwzg-A";
  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  LatLng startLocation = LatLng(35.7089088, -0.6229565);
  LatLng endLocation = LatLng(35.697688, -0.6122717);
  LatLng? currentLocation;
  addPolyLine(List<LatLng> polylineCoordinates, String s) {
    PolylineId id = PolylineId(s);
    Polyline polyline = Polyline(
        polylineId: id,
        jointType: JointType.bevel,
        zIndex: 10,
        color: Pallete.pinkColorPrinciple,
        points: polylineCoordinates,
        width: 4,
        endCap: Cap.roundCap,
        startCap: Cap.roundCap);
    polylines[id] = polyline;
    update();
  }
}
