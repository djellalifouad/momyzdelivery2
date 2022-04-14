import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/models/model.user.dart';
import 'package:momyzdelivery/services/service.profile.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';
class HomeController extends GetxController {
  final splashController = Get.find<SplashController>();
  bool isProcessing = false;
  String token = "";
  var box;
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
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
    }else {
      v!.car = splashController.v!.car;
      splashController.updateDriver(v);
      showMessage('success'.tr);
      update();
    }
  }
}
