import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    print('wow');
    return Scaffold(
      body: Center(
        child: Text('center'),
      ),
    );
  }
}
