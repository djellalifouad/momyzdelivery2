import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/pallete.const.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../controller/controller.getNotification.dart';
import '../empty/empty.widget.dart';

class Notifications extends StatefulWidget {
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final controller = Get.put(NotificationController());
  @override
  void initState() {
    controller.getNotifcations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Pallete.backGroundColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "notifications".tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Pallete.backGroundColor,
            body: GetBuilder<NotificationController>(builder: (controller) {
              if (controller.isGettingNotification) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'today'.tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'read_all_notif'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Pallete.greyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Stack(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          color: Pallete.pinkColorPrinciple,
                          onRefresh: () async {
                            controller.getNotifcationsFirst();
                            return null;
                          },
                          child: controller.notifications.isEmpty
                              ? Empty("no_notification".tr)
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                  ),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      controller: controller.scrollController1,
                                      itemCount:
                                          controller.notifications.length,
                                      itemBuilder: (context, index) {
                                        final DateTime time1 = DateTime.parse(
                                            controller.notifications[index]
                                                .created_at);
                                        timeago.setLocaleMessages(
                                            'ar', timeago.ArMessages());
                                        final difference = timeago.format(time1,
                                            locale:
                                                Get.locale!.countryCode == "US"
                                                    ? "en"
                                                    : 'ar');
                                        return Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/test.png'),
                                              SizedBox(width: 10.w),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 0.7.sw,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          controller
                                                              .notifications[
                                                                  index]
                                                              .title,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14.sp,
                                                          ),
                                                        ),
                                                        Text(
                                                          difference,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 11.sp,
                                                            color: Pallete
                                                                .pinkColorPrinciple,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Text(
                                                    controller
                                                        .notifications[index]
                                                        .body,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 11.sp,
                                                      color: Pallete.greyText,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      })),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            })));
  }
}
