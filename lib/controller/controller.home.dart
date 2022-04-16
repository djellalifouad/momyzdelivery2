import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/constant/pallete.const.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/models/model.order.dart';
import 'package:momyzdelivery/models/model.user.dart';
import 'package:momyzdelivery/services/service.orders.dart';
import 'package:momyzdelivery/services/service.profile.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui/views/components/component_button.dart';
import '../ui/views/confirmOrder/view_confirmOrder1.dart';
import '../ui/views/confirmOrder/view_confirmOrder2.dart';

class HomeController extends GetxController {
  final splashController = Get.find<SplashController>();
  bool isProcessing = false;
  String token = "";
  var box;
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
  }

  updateLocation() async {
    if (isProcessing) {
      return;
    }
    isProcessing = true;
    token = box.read('token').toString();
    Driver? v = await ProfileService.updateOnlineState(token);
    isProcessing = false;
    if (v == null) {
      showMessage('error'.tr);
      return;
    } else {
      v!.car = splashController.v!.car;
      splashController.updateDriver(v);
      showMessage('success'.tr);
      update();
    }
  }

  showBottomOrder(String id) async {
    Order? order = await OrderService.previewOrder(id, token);
    Get.bottomSheet(
        Container(
          decoration: BoxDecoration(
              color: Colors.white, // or some other color
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0.r),
                  topRight: Radius.circular(16.0.r))),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/Ellipse 10 .svg'),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'taked_from'.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Pallete.greyText),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/Ellipse 12.svg'),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      order!.store.address,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                SvgPicture.asset('assets/icons/Ellipse 13.svg'),
                SizedBox(
                  height: 5.h,
                ),
                SvgPicture.asset('assets/icons/Ellipse 14.svg'),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/Ellipse 15.svg'),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'to'.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Pallete.greyText),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Text(
                    order.address,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('store_name'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Pallete.greyText)),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          order.store.name.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 66.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'order_qty'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Pallete.greyText),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          order.items.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('special_information'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Pallete.greyText)),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      order.delivery_type.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17.h,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        order.shipping.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text('delivery_price'.tr),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ButtonComponent("accept_order".tr, () async {
                  bool val = await OrderService.acceptOrder(id, token);
                  if (val) {
                    Get.back();
                    showBottomOrder2(order);
                  }
                }),
                SizedBox(
                  height: 22.h,
                ),
                InkWell(
                  onTap: () async {
                    bool val = await OrderService.declineOrder(id, token);
                    if (val) {
                      Get.back();
                    } else {}
                  },
                  child: Center(
                    child: Text(
                      "decline_order".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: Color.fromRGBO(235, 87, 87, 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        useRootNavigator: false);
  }

  bool hide = false;

  showBottomOrder2(Order? order) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            color: Colors.white, // or some other color
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0.r),
                topRight: Radius.circular(16.0.r))),
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'delivery_information'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                      showBottomOrder3(order);
                    },
                    child: Icon(
                      Icons.clear,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/Ellipse 10 .svg'),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'order_place'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Pallete.greyText),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: SvgPicture.asset(
                  'assets/icons/Ellipse 12.svg',
                  height: 3.sp,
                  width: 3.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: SvgPicture.asset(
                  'assets/icons/Ellipse 12.svg',
                  height: 3.sp,
                  width: 3.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/Location2.svg'),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    order!.store.address.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Pallete.greyText),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: double.infinity,
                height: 0.5.h,
                color: Pallete.greyColorPrinciple,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/Ellipse 10 .svg'),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    order.store.address,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Pallete.greyText),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: SvgPicture.asset(
                  'assets/icons/Ellipse 12.svg',
                  height: 3.sp,
                  width: 3.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: SvgPicture.asset(
                  'assets/icons/Ellipse 12.svg',
                  height: 3.sp,
                  width: 3.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/Location2.svg'),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    order.user.address,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Pallete.greyText),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              ButtonComponent("order_delivered".tr, () {
                Get.to(ConfirmOrder2(order));
              }),
              SizedBox(
                height: 22.h,
              ),
            ],
          ),
        ),
      ),
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    );
  }

  showBottomOrder3(Order? order) {
    Get.bottomSheet(Container(
      height: 60.h,
      width: 1.sw,
      decoration: BoxDecoration(
          color: Colors.white, // or some other color
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0.r),
              topRight: Radius.circular(16.0.r))),
      child: Center(
        child: InkWell(
            onTap: () {
              Get.back();
              showBottomOrder2(order);
            },
            child: SvgPicture.asset('assets/icons/hide.svg')),
      ),
    ));
  }
}
