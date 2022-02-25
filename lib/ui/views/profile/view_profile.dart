import 'package:flutter/material.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder3.dart';
import 'package:momyzdelivery/ui/views/profile/view_edit_delivery.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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
          backgroundColor: Colors.white,
          leading: Container(),
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
                        Center(
                          child: Stack(
                            children: [
                              Image.asset('assets/images/profile.png'),
                              Positioned(
                                  top: 6.sp,
                                  right: 6.sp,
                                  child: SvgPicture.asset('assets/icons/t.svg'))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Center(
                          child: Text(
                            'عبد القادر رحماني ',
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
                            '0553525934',
                            style: TextStyle(
                              color: Pallete.greyText,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/startActive.svg'),
                            SizedBox(
                              width: 3.w,
                            ),
                            SvgPicture.asset('assets/icons/startActive.svg'),
                            SizedBox(
                              width: 3.w,
                            ),
                            SvgPicture.asset('assets/icons/startActive.svg'),
                            SizedBox(
                              width: 3.w,
                            ),
                            SvgPicture.asset('assets/icons/startActive.svg'),
                            SizedBox(
                              width: 3.w,
                            ),
                            SvgPicture.asset('assets/icons/startNotActive.svg'),
                          ],
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
                  children: [
                    ProfileCompoenent(
                      title: 'edit_profile'.tr,
                      pic: 'assets/icons/Profile 2.svg',
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => new EditDelivery()));
                      },
                      child: ProfileCompoenent(
                        title: 'deliver_vehicule'.tr,
                        pic: 'assets/icons/truck.svg',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => new StateUser()));
                      },
                      child: ProfileCompoenent(
                        title: 'my_benifit'.tr,
                        pic: 'assets/icons/Wallet.svg',
                      ),
                    ),
                    ProfileCompoenent(
                      title: 'stats'.tr,
                      pic: 'assets/icons/Chart2.svg',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'general'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
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
                        InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) => new ListComplaint()));
                          },
                          child: ProfileCompoenent(
                            title: 'signals'.tr,
                            pic: 'assets/icons/dangerTriangle.svg',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        new ListComplaint2()));
                          },
                          child: ProfileCompoenent(
                            title: 'make_complaint'.tr,
                            pic: 'assets/icons/Square.svg',
                          ),
                        ),
                        ProfileCompoenent(
                          title: 'politics'.tr,
                          pic: 'assets/icons/Shield.svg',
                        ),
                        ProfileCompoenent(
                          title: 'conditions'.tr,
                          pic: 'assets/icons/Document.svg',
                        ),
                        ProfileCompoenent(
                          title: 'delete_account'.tr,
                          pic: 'assets/icons/Shield Fail.svg',
                        ),
                        SizedBox(
                          height: 70.h,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
