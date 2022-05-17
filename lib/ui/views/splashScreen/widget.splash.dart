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
            height: 40.sp,
            width: 40.sp,
            color: Colors.black,
          ))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/011.svg',
            color: Colors.black,
            height: 80.h,
            width: 80.w,
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            clipBehavior: Clip.antiAlias,
            width: 1.sw * 0.1,
            child: const LinearProgressIndicator(
              minHeight: 4,
              color: Color(0xffF94892),
              backgroundColor: Color(0x26F94892),
            ),
          ),
        ],
      )),
    );
  }
}
