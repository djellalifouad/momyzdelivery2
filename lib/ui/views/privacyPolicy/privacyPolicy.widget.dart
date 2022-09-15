import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:momyzdelivery/controller/controller.privacyPolicy.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant/pallete.const.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final termsController = Get.put(PrivacyPolicyController());
  @override
  void initState() {
    termsController.getPrivacyPolicy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyPolicyController>(builder: (controller) {
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
              "politics".tr,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          body: controller.isGettingPrivacy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Builder(builder: (context) {
                  if (controller.privacyPolicy == "") {
                    if (controller.privacyPolicy == "") {
                      return Center(child: Text('privacy_policy_empty'.tr));
                    }
                  }
                  return SingleChildScrollView(
                    child: HtmlWidget(
                      controller.privacyPolicy,
                    ),
                  );
                }));
    });
  }
}
