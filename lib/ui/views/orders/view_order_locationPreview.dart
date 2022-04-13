import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/model.order.dart';

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
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          zoomGesturesEnabled: false,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          markers: Set<Marker>.of(markers.values),
          initialCameraPosition: _kLake,
          onMapCreated: (GoogleMapController controller) {},
        ),
      ),
    );
  }
}
