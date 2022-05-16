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

class _SplashScreenState extends State<SplashScreen> {
  final splashController = Get.put(SplashController());
  @override
  void initState() {
    splashController.check();
    super.initState();
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
            width: 50.sp,
            color: Colors.black,
          ))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/011.svg',
            color: Colors.black,
            height: 100.h,
            width: 70.w,
          ),
          CircularProgressIndicator(),
        ],
      )),
    );
  }
}
