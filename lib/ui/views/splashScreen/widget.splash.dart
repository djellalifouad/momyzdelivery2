import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/controller/controller.home.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  final splashController = Get.put(SplashController());
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    splashController.check();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        print("Paused");
        break;
      case AppLifecycleState.detached:
        print("detached");
        final homeController = Get.find<HomeController>();
        print("hh");
        print(splashController.v!.online == 1);
        if (splashController.v!.online == 1) {
          homeController.updateLocation();
        }
        break;
        print("Suspending");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('wow');
    return Scaffold(
      bottomSheet: Container(
          height: 100.h,
          child: Center(
              child: SvgPicture.asset(
            'assets/images/momyz_logo_2.svg',
            height: 70.sp,
            width: 70.sp,
          ))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/011.svg',
            color: Colors.black,
            height: 100.h,
            width: 100.w,
          ),
          CircularProgressIndicator(),
        ],
      )),
    );
  }
}
