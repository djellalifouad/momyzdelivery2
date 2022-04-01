import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momyzdelivery/constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/ui/views/complaints/view_conversation.dart';
import 'package:momyzdelivery/ui/views/complaints/view_make_complaint.dart';

import '../../../controller/controller.tickets.dart';
import '../components/component_button.dart';

class ListComplaint2 extends StatefulWidget {
  @override
  State<ListComplaint2> createState() => _ListComplaint2State();
}

class _ListComplaint2State extends State<ListComplaint2> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TicketController());
    print(controller.tickets1);
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
          child: ButtonComponent('open_new_complaint2'.tr, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MakeComplaint()));
          })),
      appBar: AppBar(
        backgroundColor: Pallete.backGroundColor2,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Container(
                    padding: EdgeInsets.all(5.sp),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ))),
          )
        ],
        centerTitle: true,
        elevation: 0,
        title: Text(
          "complaint2".tr,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Pallete.backGroundColor2,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 26.h,
          ),
          GetBuilder<TicketController>(builder: (context) {
            return Center(
              child: Container(
                width: 326.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          if (!controller.isOpen) {
                            return;
                          }
                          controller.updateIsOpen();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Container(
                            width: 132.w,
                            height: 38.h,
                            child: Center(
                                child: Text(
                              'complaint2_open'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: !controller.isOpen
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: !controller.isOpen
                                  ? Pallete.pinkColorPrinciple
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.isOpen) {
                            return;
                          }
                          controller.updateIsOpen();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Container(
                            width: 122.w,
                            height: 38.h,
                            child: Center(
                                child: Text(
                              'complaint2_close'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: controller.isOpen
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: controller.isOpen
                                  ? Pallete.pinkColorPrinciple
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            );
          }),
          SizedBox(
            height: 32.h,
          ),
          GetBuilder<TicketController>(builder: (context) {
            if (controller.isOpen) {
              if (controller.isGetting1) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Container(
                  height: 0.9.sh,
                  child: ListView.builder(
                    controller: controller.scrollController1,
                    shrinkWrap: true,
                    itemCount: controller.tickets1.length,
                    itemBuilder: (context, index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 5.h),
                          child: InkWell(
                            onTap: () {
                              Get.to(Conversation(controller.tickets1[index]));
                            },
                            child: Container(
                              width: 326.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(19.sp),
                                child: Row(children: [
                                  Container(
                                    height: 44.sp,
                                    width: 44.sp,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: SvgPicture.asset(
                                        'assets/icons/Square.svg',
                                        color: Pallete.greyColorPrinciple,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(242, 242, 242, 1),
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.tickets1[index].title,
                                        style: TextStyle(
                                          color: Color.fromRGBO(51, 51, 51, 1),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/Time Circle.svg'),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            '12 June 2022 - 12:00 AM',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  189, 189, 189, 1),
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 28.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: Container(
                                      height: 25.5.h,
                                      width: 85.w,
                                      child: Center(
                                        child: Text(
                                          controller.tickets1[index]
                                                      .is_answered ==
                                                  2
                                              ? 'not_done'.tr
                                              : 'done'.tr,
                                          style: TextStyle(
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w600,
                                              color: controller.tickets1[index]
                                                          .is_answered ==
                                                      2
                                                  ? Color.fromRGBO(
                                                      242, 153, 74, 1)
                                                  : Color.fromRGBO(
                                                      33, 150, 83, 1)),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          color: controller.tickets1[index]
                                                      .is_answered ==
                                                  2
                                              ? Color.fromRGBO(
                                                  242, 153, 74, 0.15)
                                              : Color.fromRGBO(
                                                  33, 150, 83, 0.15)),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ),
                        index == controller.tickets1.length - 1
                            ? SizedBox(
                                height: 15.h,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              if (controller.isGetting2) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Container(
                  height: 0.9.sh,
                  child: ListView.builder(
                    controller: controller.scrollController2,
                    shrinkWrap: true,
                    itemCount: controller.tickets2.length,
                    itemBuilder: (context, index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 5.h),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 326.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(19.sp),
                                child: Row(children: [
                                  Container(
                                    height: 44.sp,
                                    width: 44.sp,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.sp),
                                      child: SvgPicture.asset(
                                        'assets/icons/Square.svg',
                                        color: Pallete.greyColorPrinciple,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(242, 242, 242, 1),
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.tickets1[index].title,
                                        style: TextStyle(
                                          color: Color.fromRGBO(51, 51, 51, 1),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/Time Circle.svg'),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            '12 June 2022 - 12:00 AM',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  189, 189, 189, 1),
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 28.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: Container(
                                      height: 25.5.h,
                                      width: 85.w,
                                      child: Center(
                                        child: Text(
                                          controller.tickets2[index]
                                                      .is_answered ==
                                                  2
                                              ? 'not_done'.tr
                                              : 'done'.tr,
                                          style: TextStyle(
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w600,
                                              color: controller.tickets2[index]
                                                          .is_answered ==
                                                      2
                                                  ? Color.fromRGBO(
                                                      242, 153, 74, 1)
                                                  : Color.fromRGBO(
                                                      33, 150, 83, 1)),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          color: controller.tickets2[index]
                                                      .is_answered ==
                                                  2
                                              ? Color.fromRGBO(
                                                  242, 153, 74, 0.15)
                                              : Color.fromRGBO(
                                                  33, 150, 83, 0.15)),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ),
                        index == controller.tickets1.length - 1
                            ? SizedBox(
                                height: 15.h,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              );
            }
          })
        ],
      )),
    );
  }
}
