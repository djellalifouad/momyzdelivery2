import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

// CLASS MEMBER, MAP OF MARKS

  @override
  void initState() {
    _kLake = CameraPosition(
        target: LatLng(widget.order.lat, widget.order.lon), zoom: 20);
    marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(widget.order.lat, widget.order.lon),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );
    if (mounted) {
      markers["tst"] = marker;
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          body: GoogleMap(
            zoomGesturesEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            markers: Set<Marker>.of(markers.values),
            initialCameraPosition: _kLake,
            onMapCreated: (GoogleMapController controller) {},
          ),
        ),
      ),
    );
  }
}
