import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/models/model.settings.dart';
import 'package:momyzdelivery/models/model.user.dart';
import 'package:momyzdelivery/services/service.auth.dart';
import 'package:momyzdelivery/services/service.profile.dart';
import 'package:momyzdelivery/ui/views/auth/view_login1.dart';
import 'package:geolocator/geolocator.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder2.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'dart:math' show cos, sqrt, asin;
import '../ui/views/auth/view_car_information.dart';
import '../ui/views/auth/view_personal_info.dart';
import '../ui/views/bottom/view_bottom.dart';

class SplashController extends GetxController {
  late Position position;
  Driver? v;
  SettigsModel? s;
  GetStorage getStorage = GetStorage();
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
      s = await AuthService.getSettings(token);
      v = await ProfileService.getProfile(token);
      if (v == null) {
        Get.off(Login1View());
        getStorage.remove('token');
        return;
      }
      if (v!.driving_licence_image_url == "null") {
        Get.off(PersonalInfoView());
        return;
      }
      if (v!.car == null) {
        Get.off(CarInformationRegister());
        return;
      }
      if (getStorage.hasData("currentOrder")) {
        String id = getStorage.read("currentOrder").toString();
        Get.to(ConfirmOrder2(id));
        return;
      } else {
        updatePosition();
        Get.off(ProvidedStylesExample());
      }
    } else {
      Get.off(Login1View());
    }
  }

  updatePosition() {
    print("bismilah calculate position");
    String token = getStorage.read('token');
    Geolocator.getCurrentPosition().then((position) async {
      double distance = Geolocator.distanceBetween(
          position.latitude, position.longitude, v!.lat, v!.lon);
      print("distance");
      print("distance" + distance.toString());
      if (distance >= 500) {
        Driver? driver = await ProfileService.updateDriverPostion(
            token, position.latitude, position.longitude);
        if (driver != null) {
          updateDriver(driver);
          update();
          Future.delayed(const Duration(seconds: 15), () {
            updatePosition();
          });
        }
      } else {
        Future.delayed(const Duration(seconds: 15), () {
          updatePosition();
        });
      }
    });
  }
}

Future<Position> _determinePosition() async {
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.checkPermission();
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    permission = await Geolocator.checkPermission();
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  var position2 = await Geolocator.getCurrentPosition();
  print('position2');
  print(position2);

  return position2;
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

// init function used for redirection
@override
void onReady() {}
