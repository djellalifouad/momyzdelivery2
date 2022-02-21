import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder3.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';
import '../wait_view.dart';

class ConfirmOrder2 extends StatefulWidget {
  @override
  State<ConfirmOrder2> createState() => _ConfirmOrder2State();
}

class _ConfirmOrder2State extends State<ConfirmOrder2> {
  List<Widget> images = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "code_activation_confirmation".tr,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Container(),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                ),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    )),
              ),
            ]),
        backgroundColor: Pallete.backGroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 74.h,
                    ),
                    Text(
                      "product_picture".tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Pallete.greyText,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                                allowMultiple: true,
                                type: FileType.custom,
                                allowedExtensions: ["PNG", "JPG", "JPEG"]);
                        if (result != null) {
                          List<File> files = result.paths
                              .map((path) => File(path.toString()))
                              .toList();

                          for (int i = 0; i < files.length; i++) {
                            images.add(Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.r),
                                child: Image.file(
                                  files[i],
                                  height: 96.sp,
                                  width: 96.sp,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ));
                          }
                          setState(() {});
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Center(
                          child:
                              SvgPicture.asset('assets/icons/uploadPic.svg')),
                    ),
                    SizedBox(
                      height: 52.h,
                    ),
                    images.isNotEmpty
                        ? Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 100.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: images.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      images[index],
                                      Positioned(
                                          top: 2.sp,
                                          right: 8.sp,
                                          child: InkWell(
                                            onTap: () {
                                              images.removeAt(index);
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              size: 22.sp,
                                              color: Colors.white,
                                            ),
                                          ))
                                    ],
                                  );
                                },
                              ),
                            ),
                          )
                        : Center(
                            child: Text("no_pic".tr),
                          ),
                    SizedBox(
                      height: 40.h,
                    ),
                    ButtonComponent('code_activation_confirmation'.tr, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfirmOrder3()));
                    }),
                    SizedBox(
                      height: 48.h,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
