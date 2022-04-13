import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momyzdelivery/ui/views/orders/view_order_details.dart';

import '../../../constant/pallete.const.dart';
import 'package:get/get.dart';

import '../../../controller/controller.order.dart';

class Orders extends StatefulWidget {
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final controller = Get.put(OrderController());
  @override
  void initState() {
    controller.getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Pallete.backGroundColor2,
            appBar: AppBar(
              backgroundColor: Pallete.backGroundColor2,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "orders".tr,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              leading: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(5.sp),
                    child: SvgPicture.asset(
                      'assets/icons/Filter.svg',
                      height: 10.sp,
                      width: 10.sp,
                    ),
                  )),
            ),
            body: GetBuilder<OrderController>(builder: (context) {
              return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: controller.isGettingOrder
                          ? CircularProgressIndicator()
                          : ListView.builder(
                              controller: controller.scrollController1,
                              itemCount: controller.orders.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    new OrderDetails(controller
                                                        .orders[index])));
                                      },
                                      child: Container(
                                        width: 327.w,
                                        height: 188.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.sp),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 7.w,
                                            vertical: 15.h,
                                          ),
                                          child: Column(children: [
                                            Row(
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl: controller
                                                      .orders[index]
                                                      .store
                                                      .image_url,
                                                  height: 42.sp,
                                                  width: 42.sp,
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 260.w,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            controller
                                                                .orders[index]
                                                                .store
                                                                .username,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14.sp,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 79.w,
                                                            height: 24.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Pallete
                                                                  .pinkColorPrinciple,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.r),
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                              controller
                                                                  .orders[index]
                                                                  .date,
                                                              style: TextStyle(
                                                                fontSize: 10.sp,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Text(
                                                      controller.orders.length
                                                          .toString(),
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
                                            SizedBox(
                                              height: 19.h,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 200.w,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              right: 5.w,
                                                            ),
                                                            child: Container(
                                                              height: 20.sp,
                                                              width: 20.sp,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.r),
                                                                color: Pallete
                                                                    .pinkColorPrinciple,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(3.5
                                                                            .sp),
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/icons/Group.svg'),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 16.w,
                                                          ),
                                                          Text(
                                                            'market'.tr + " :",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10.sp,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 6.w,
                                                          ),
                                                          Text(
                                                            controller
                                                                .orders[index]
                                                                .name
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 10.sp,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 12.h,
                                                    ),
                                                    Container(
                                                      width: 200.w,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              right: 5.w,
                                                            ),
                                                            child: Container(
                                                              height: 20.sp,
                                                              width: 20.sp,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.r),
                                                                color: Pallete
                                                                    .pinkColorPrinciple,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(3.5
                                                                            .sp),
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/icons/Money.svg'),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 16.w,
                                                          ),
                                                          Text(
                                                            'delivery_price2'
                                                                    .tr +
                                                                " :",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10.sp,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 6.w,
                                                          ),
                                                          Text(
                                                            controller
                                                                .orders[index]
                                                                .shipping
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 10.sp,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 12.h,
                                                    ),
                                                    Container(
                                                      width: 200.w,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              right: 5.w,
                                                            ),
                                                            child: Container(
                                                              height: 20.sp,
                                                              width: 20.sp,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.r),
                                                                color: Pallete
                                                                    .pinkColorPrinciple,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(3.5
                                                                            .sp),
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/icons/Delivery Truck.svg'),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 16.w,
                                                          ),
                                                          Text(
                                                            'delivery_type'.tr +
                                                                " :",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10.sp,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 6.w,
                                                          ),
                                                          Text(
                                                            controller
                                                                .orders[index]
                                                                .delivery_type
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 10.sp,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SvgPicture.asset(
                                                    'assets/icons/Frame.svg'),
                                              ],
                                            )
                                          ]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    index == controller.orders.length - 1
                                        ? SizedBox(
                                            height: 60.h,
                                          )
                                        : Container(),
                                    controller.isGettingNextPage
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : Container()
                                  ],
                                );
                              },
                            )));
            })));
  }
}
