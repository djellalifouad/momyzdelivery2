import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/pallete.const.dart';
import '../../../controller/controller.order.dart';
import '../components/component_button.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return Container(
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
                    'delivery_price'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Colors.black),
                  ),
                  Text(
                    "${controller.minPrice == null ? '0' : controller.minPrice.toStringAsFixed(2)}₪ - ${controller.maxPrice == null ? '0' : controller.maxPrice.toStringAsFixed(2)}₪",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        color: Pallete.greyText),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              RangeSlider(
                  min: 0,
                  max: 100,
                  activeColor: Pallete.pinkColorPrinciple,
                  values: controller.range,
                  inactiveColor: Color.fromRGBO(232, 226, 226, 1),
                  onChanged: (values) {
                    controller.updateRange(values.start, values.end);
                  }),
              Text(
                'delivery_type'.tr,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.updateDeliveryType('express_delivery'.tr);
                    },
                    child: Container(
                      width: 88.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          color:
                              controller.delivery_type == 'express_delivery'.tr
                                  ? Pallete.pinkColorPrinciple
                                  : Colors.white,
                          border:
                              controller.delivery_type != 'express_delivery'.tr
                                  ? Border.all(width: 1.sp, color: Colors.black)
                                  : null,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Center(
                          child: Text(
                        'express_delivery'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: controller.delivery_type ==
                                    'express_delivery'.tr
                                ? Colors.white
                                : Colors.black),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      controller.updateDeliveryType('normal_delivery'.tr);
                    },
                    child: Container(
                      width: 88.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          color:
                              controller.delivery_type == 'normal_delivery'.tr
                                  ? Pallete.pinkColorPrinciple
                                  : Colors.white,
                          border:
                              controller.delivery_type != 'normal_delivery'.tr
                                  ? Border.all(width: 1.sp, color: Colors.black)
                                  : null,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Center(
                          child: Text(
                        'normal_delivery'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color:
                                controller.delivery_type == 'normal_delivery'.tr
                                    ? Colors.white
                                    : Colors.black),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      controller.updateDeliveryType('program_delivery'.tr);
                    },
                    child: Container(
                      width: 88.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          color:
                              controller.delivery_type == 'program_delivery'.tr
                                  ? Pallete.pinkColorPrinciple
                                  : Colors.white,
                          border:
                              controller.delivery_type != 'program_delivery'.tr
                                  ? Border.all(width: 1.sp, color: Colors.black)
                                  : null,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Center(
                          child: Text(
                        'program_delivery'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: controller.delivery_type ==
                                    'program_delivery'.tr
                                ? Colors.white
                                : Colors.black),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              ButtonComponent("confirm".tr, () async {
                controller.activateFilter();
              }),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  controller.desactivateFilter();
                },
                child: Center(
                  child: Text(
                    'delete_filter'.tr,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: Color.fromRGBO(235, 87, 87, 1)),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
