import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/models/model.user.dart';
import 'package:momyzdelivery/services/service.profile.dart';
import 'package:momyzdelivery/ui/views/auth/view_login1.dart';
import 'package:geolocator/geolocator.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../ui/views/auth/view_car_information.dart';
import '../ui/views/auth/view_personal_info.dart';
import '../ui/views/bottom/view_bottom.dart';

class SplashController extends GetxController {
  late Position position;
  Driver? v;
  updateDriver(Driver driver) {
    v = driver;
    update();
  }

  onInit() async {}
  check() async {
    position = await _determinePosition();
    print('init splash');
    GetStorage getStorage = GetStorage();
    if (getStorage.hasData('token')) {
      String token = getStorage.read('token');
      v = await ProfileService.getProfile(token);
      if (v == null) {
        Get.off(Login1View());
        getStorage.remove('token');
        return;
      }
      if (v!.driving_licence_image_url == "null") {
        Get.to(PersonalInfoView());
        return;
      }
      if (v!.car == null) {
        Get.to(CarInformationRegister());
        return;
      }
      Get.to(ProvidedStylesExample());
    } else {
      Get.off(Login1View());
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
