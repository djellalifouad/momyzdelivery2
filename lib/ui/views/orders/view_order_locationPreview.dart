import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:momyzdelivery/controller/controller.home.dart';
import 'package:momyzdelivery/ui/views/bottom/view_bottom.dart';
import 'package:momyzdelivery/ui/views/components/component_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/pallete.const.dart';
import '../../../models/model.order.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewOrderLocation extends StatefulWidget {
  Order order;
  ViewOrderLocation(this.order);
  @override
  State<ViewOrderLocation> createState() => _ViewOrderLocationState();
}

class _ViewOrderLocationState extends State<ViewOrderLocation> {
  late final CameraPosition _kLake;
  late final Marker marker;
  Map<String, Marker> markers = <String, Marker>{};
  addMarkers() async {
    print(
      "late" + widget.order.lat.toString(),
    );
    _kLake = CameraPosition(
        target: LatLng(widget.order.lat, widget.order.lon), zoom: 10);
    marker = Marker(
      markerId: MarkerId('client'),
      position: LatLng(widget.order.lat, widget.order.lon),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'Order',
        snippet: 'Client',
      ),
      icon: await MarkerIcon.pictureAsset(
          assetPath: 'assets/icons/user.png', width: 100.sp, height: 100.sp),
    );
    var marker2 = Marker(
      markerId: MarkerId('store'),
      position: LatLng(widget.order.store!.lat, widget.order.store!.lon),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'Order',
        snippet: 'Store',
      ),
      icon: await MarkerIcon.pictureAsset(
          assetPath: 'assets/icons/online-shop.png',
          width: 100.sp,
          height: 100.sp),
    );
    if (mounted) {
      markers["user"] = marker;
      markers["order"] = marker2;
      setState(() {});
    }
  }

// CLASS MEMBER, MAP OF MARKS
  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.order.state.toString());
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
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
              'order_location'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Pallete.greyColorPrinciple),
            ),
          ),
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                markers: Set<Marker>.of(markers.values),
                initialCameraPosition: _kLake,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {},
              ),
              widget.order.state.toString() == "4"
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: ButtonComponent("إنطلق في التوصيل ", () async {
                          var ref = await SharedPreferences.getInstance();
                          await ref.setString(
                              "currentOrderId", widget.order.id.toString());
                          await ref.setString("orderType",
                              widget.order.delivery_type.toString());
                          Get.offAll(ProvidedStylesExample());
                        }),
                      ))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
