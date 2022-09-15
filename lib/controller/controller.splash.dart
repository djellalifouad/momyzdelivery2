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
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' show cos, sqrt, asin;
import '../ui/views/auth/view_car_information.dart';
import '../ui/views/auth/view_personal_info.dart';
import '../ui/views/bottom/view_bottom.dart';
import 'controller.home.dart';

class SplashController extends GetxController {
  late Position position;
  Driver? v;
  SettigsModel? s;
  GetStorage getStorage = GetStorage();
  updateDriver(Driver driver) {
    v = driver;
    update();
  }

  onRefresh() async {
    String token = getStorage.read('token');

    Driver? newDriverData = await ProfileService.getProfile(token);
    if (newDriverData != null) {
      updateDriver(newDriverData);
    }
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
      var pref = await SharedPreferences.getInstance();
      await pref.remove('currentOrder');
      if (pref.getString('currentOrder') != null) {
        final homeController = Get.put(HomeController());
        String? id = pref.getString('currentOrder');
        if (pref.getString('orderType') == "2") {
          homeController.showBottomOrder(id.toString());
        } else {
          homeController.previewOrderNormal(id.toString());
        }
        Get.off(ProvidedStylesExample());
        return;
      } else {
        Get.off(ProvidedStylesExample());
        updatePosition();
      }
    } else {
      Get.off(Login1View());
    }
  }

  bool isListening = false;
  updatePosition() async {
    LocationPermission permission;
    await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return false;
    }
    isListening = true;
    String token = getStorage.read('token');
    if (!await Geolocator.isLocationServiceEnabled() && v!.online == 1) {
      print("hereherehere");
      final homeController = Get.find<HomeController>();
      homeController.updateLocation();
      await Future.delayed(Duration(seconds: 4), () {
        updatePosition();
      });
      return false;
    }
    ;
    if (!await Geolocator.isLocationServiceEnabled()) {
      await Future.delayed(Duration(seconds: 4), () {
        updatePosition();
      });
    }
    ;
    if (v!.online == 2) {
      await Future.delayed(Duration(seconds: 4), () {
        updatePosition();
      });
      return false;
    } else {
      Geolocator.getCurrentPosition().then((position) async {
        print('positionNOWOW' + position.latitude.toString());
        if (v == null) {
          return;
        }
        double distance = Geolocator.distanceBetween(
            position.latitude, position.longitude, v!.lat, v!.lon);
        print("CCCC");
        print("distance" + distance.toString());
        if (distance >= 500) {
          Driver? driver = await ProfileService.updateDriverPostion(
              token, position.latitude, position.longitude);
          if (driver != null) {
            updateDriver(driver);
            update();
            Future.delayed(const Duration(seconds: 4), () {
              updatePosition();
            });
          }
        } else {
          Future.delayed(const Duration(seconds: 4), () {
            updatePosition();
          });
        }
      }).catchError((error) {
        print("here called from error");
        updatePosition();
      });
    }
  }
}

Future<Position> _determinePosition() async {
  LocationPermission permission;
  await Geolocator.requestPermission();
  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.deniedForever ||
      permission == LocationPermission.denied) {
    // Permissions are denied forever, handle appropriately.
    return Position(
      longitude: 35.152166058,
      latitude: 32.51833126,
      altitude: 1,
      speedAccuracy: 12,
      accuracy: 1,
      heading: 2,
      speed: 23,
      timestamp: DateTime.now(),
    );
  }
  print(permission);
  var position2;
  try {
    position2 = await Geolocator.getCurrentPosition();
  } catch (e) {
    return Position(
      longitude: 35.152166058,
      latitude: 32.51833126,
      altitude: 1,
      speedAccuracy: 12,
      accuracy: 1,
      heading: 2,
      speed: 23,
      timestamp: DateTime.now(),
    );
  }
  if (position2 == null) {
    return Position(
      longitude: 35.152166058,
      latitude: 32.51833126,
      altitude: 1,
      speedAccuracy: 12,
      accuracy: 1,
      heading: 2,
      speed: 23,
      timestamp: DateTime.now(),
    );
  } else {
    return position2;
  }
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
