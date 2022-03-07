import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/ui/views/auth/view_login1.dart';
import 'package:geolocator/geolocator.dart';

import '../ui/views/bottom/view_bottom.dart';

class SplashController extends GetxController {
  late Position position;
  onInit() async {
  position =   await _determinePosition();
    print('init splash');
    GetStorage getStorage = GetStorage();
    if (!getStorage.hasData('token')) {
      Get.off(Login1View());
    } else {
      Get.off(ProvidedStylesExample());
    }
    
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  var position2 = await Geolocator.getCurrentPosition();


  return position2;
}

// init function used for redirection
@override
void onReady() {}
