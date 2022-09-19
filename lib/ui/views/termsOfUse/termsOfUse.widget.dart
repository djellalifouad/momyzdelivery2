import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:momyzdelivery/controller/controller.privacyPolicy.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/controller/controller.termsOfuse.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constant/pallete.const.dart';

class PrivacyPolicy2 extends StatefulWidget {
  @override
  State<PrivacyPolicy2> createState() => _PrivacyPolicy2State();
}

class _PrivacyPolicy2State extends State<PrivacyPolicy2> {
  final termsController = Get.put(TermsController());

  @override
  void initState() {
    termsController.getTerms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TermsController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Pallete.backGroundColor2,
          appBar: AppBar(
            backgroundColor: Pallete.backGroundColor2,
            centerTitle: true,
            elevation: 0,
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Text(
              "conditions".tr,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          body: controller.isGettingTerms
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Builder(builder: (context) {
                  if (controller.terms == "") {
                    return Center(child: Text('terms_of_use_empty'.tr));
                  }
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: HtmlWidget(
                        controller.terms,
                      ),
                    ),
                  );
                }));
    });
  }
}
