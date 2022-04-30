import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder3.dart';
import 'package:momyzdelivery/ui/views/profile/view_edit_delivery.dart';
import 'package:momyzdelivery/ui/views/profile/view_settings.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../controller/controller.profile.dart';
import '../complaints/view_choose_type_complaint.dart';
import '../complaints/view_list_complaint.dart';
import '../complaints/view_list_complaint2.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';
import '../stats/view_stat_profile.dart';
import '../wait_view.dart';
import 'components/component.profile.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Widget> images = [];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final splashController = Get.find<SplashController>();
    return GetBuilder<SplashController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "my_profile".tr,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            elevation: 0,
            leadingWidth: 42.sp,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                Get.to(Settings());
              },
              child: Padding(
                padding: Get.locale!.countryCode == "US"
                    ? EdgeInsets.only(left: 14.w)
                    : EdgeInsets.only(right: 14.w),
                child: SvgPicture.asset(
                  'assets/icons/Setting.svg',
                  height: 10.sp,
                  width: 10.sp,
                ),
              ),
            ),
          ),
          backgroundColor: Pallete.backGroundColor,
          body: Align(
            alignment: Alignment.topRight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 37.h,
                          ),
                          GetBuilder<ProfileController>(
                            builder: (_) => !controller.isSending
                                ? Center(
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(1100.r),
                                          child: CachedNetworkImage(
                                            height: 125.sp,
                                            width: 125.sp,
                                            imageUrl:
                                                splashController.v!.image_url,
                                          ),
                                        ),
                                        splashController.v!.online == 1
                                            ? Positioned(
                                                top: 9.sp,
                                                right: 9.sp,
                                                child: SvgPicture.asset(
                                                    'assets/icons/t.svg'))
                                            : Container(
                                                height: 0,
                                                width: 0,
                                              ),
                                        Positioned(
                                            bottom: 9.sp,
                                            left: 9.sp,
                                            child: InkWell(
                                              onTap: () {
                                                controller.getFile();
                                              },
                                              child: SvgPicture.asset(
                                                  'assets/icons/editProfilePic.svg'),
                                            ))
                                      ],
                                    ),
                                  )
                                : Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Center(
                            child: Text(
                              splashController.v!.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Center(
                            child: Text(
                              splashController.v!.full_phone_number,
                              style: TextStyle(
                                color: Pallete.greyText,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            'profile'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(EditDelivery());
                        },
                        child: ProfileCompoenent(
                          title: 'deliver_vehicule'.tr,
                          pic: 'assets/icons/truck.svg',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(StateUser());
                        },
                        child: ProfileCompoenent(
                          title: 'my_benifit'.tr,
                          pic: 'assets/icons/Wallet.svg',
                        ),
                      ),
                      /*   ProfileCompoenent(
                        title: 'stats'.tr,
                        pic: 'assets/icons/Chart2.svg',
                      ),
                      */
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                        ),
                        child: Text(
                          'general'.tr,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              /*  InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          new ListComplaint()));
                            },
                            child: ProfileCompoenent(
                              title: 'signals'.tr,
                              pic: 'assets/icons/dangerTriangle.svg',
                            ),
                          ),
                          */
                              splashController.v!.state == 2
                                  ? InkWell(
                                      onTap: () {
                                        Get.to(ListComplaint2());
                                      },
                                      child: ProfileCompoenent(
                                        title: 'make_complaint'.tr,
                                        pic: 'assets/icons/Square.svg',
                                      ),
                                    )
                                  : Container(),
                              ProfileCompoenent(
                                title: 'politics'.tr,
                                pic: 'assets/icons/Shield.svg',
                              ),
                              ProfileCompoenent(
                                title: 'conditions'.tr,
                                pic: 'assets/icons/Document.svg',
                              ),
                              splashController.v!.state == 2
                                  ? InkWell(
                                      onTap: () {
                                        controller.deleteAccount();
                                      },
                                      child: ProfileCompoenent(
                                        title: 'delete_account'.tr,
                                        pic: 'assets/icons/Shield Fail.svg',
                                      ),
                                    )
                                  : Container(),
                              SizedBox(
                                height: 70.h,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
