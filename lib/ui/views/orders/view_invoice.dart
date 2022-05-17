import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/models/model.order.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/component_button.dart';

class Invoice extends StatefulWidget {
  Order order;
  Invoice(this.order);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  bool showList = false;
  @override
  Widget build(BuildContext context) {
    String deliveryType = "";
    if (widget.order.delivery_type == 1) {
      deliveryType = "normal_delivery".tr;
    } else if (widget.order.delivery_type == 2) {
      deliveryType = "express_delivery".tr;
    } else {
      deliveryType = "booked_delivery".tr;
    }
    return GetBuilder<SplashController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Pallete.pinkColorPrinciple,
        appBar: AppBar(
          backgroundColor: Pallete.pinkColorPrinciple,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'invoice_title'.tr,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: 46.h,
          ),
          Stack(
            children: [
              Center(
                child: Container(
                  width: 327.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(26.sp),
                    child: Column(children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('order_number'.tr,
                                  style: TextStyle(
                                      color: Pallete.greyColorPrinciple,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400)),
                              Text(widget.order.id.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SvgPicture.asset('assets/icons/Line.svg')
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('date'.tr,
                                  style: TextStyle(
                                      color: Pallete.greyColorPrinciple,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400)),
                              Text(widget.order.date,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SvgPicture.asset('assets/icons/Line.svg')
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('products'.tr,
                                  style: TextStyle(
                                      color: Pallete.greyColorPrinciple,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400)),
                              InkWell(
                                onTap: () {
                                  showList = !showList;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 30.sp,
                                  width: 30.sp,
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0.sp),
                                    child: SvgPicture.asset(
                                      !showList
                                          ? 'assets/icons/ArrowBack.svg'
                                          : 'assets/icons/arrowLeft.svg',
                                      height: 15.sp,
                                      width: 15.sp,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          showList
                              ? Container(
                                  height: 25.h * widget.order.items.length,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: widget.order.items.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  widget
                                                      .order.items[index].name,
                                                  style: TextStyle(
                                                      color: Pallete
                                                          .greyColorPrinciple,
                                                      fontSize: 11.sp),
                                                ),
                                                Text(
                                                  widget.order.items[index].qty
                                                          .toString() +
                                                      "×",
                                                  style: TextStyle(
                                                      color: Pallete
                                                          .greyColorPrinciple,
                                                      fontSize: 11.sp),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                          ],
                                        );
                                      }),
                                )
                              : Container(),
                          SizedBox(
                            height: 10.h,
                          ),
                          SvgPicture.asset('assets/icons/Line.svg')
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('market'.tr,
                                  style: TextStyle(
                                      color: Pallete.greyColorPrinciple,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                  widget.order.store == null
                                      ? "store_deleted".tr
                                      : widget.order.store!.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SvgPicture.asset('assets/icons/Line.svg')
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('delivery2'.tr,
                                  style: TextStyle(
                                      color: Pallete.greyColorPrinciple,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400)),
                              Text(deliveryType,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SvgPicture.asset('assets/icons/Line.svg')
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('delivery3'.tr,
                                  style: TextStyle(
                                      color: Pallete.greyColorPrinciple,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400)),
                              Text(controller.v!.car!.model,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SvgPicture.asset('assets/icons/Line.svg')
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        color: Pallete.pinkColorPrinciple,
                        height: 1.h,
                        width: 0.8.sw,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('delivery_price2'.tr,
                                  style: TextStyle(
                                      color: Pallete.greyColorPrinciple,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400)),
                              Text(widget.order.shipping.toString() + "₪",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SvgPicture.asset('assets/icons/Line.svg')
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('tax'.tr,
                                  style: TextStyle(
                                      color: Pallete.greyColorPrinciple,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400)),
                              Text(widget.order.value_added_tax + "₪",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 161, 201, 1),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SvgPicture.asset('assets/icons/Line.svg')
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('total'.tr,
                                  style: TextStyle(
                                      color: Pallete.greyColorPrinciple,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400)),
                              Text(widget.order.total.toString() + "₪",
                                  style: TextStyle(
                                      color: Color.fromRGBO(249, 72, 146, 1),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          SizedBox(
                            height: 21.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      )
                    ]),
                  ),
                ),
              ),
              Positioned(
                  top: 95.h,
                  left: 15.w,
                  child: Container(
                    height: 24.sp,
                    width: 24.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Pallete.pinkColorPrinciple,
                    ),
                  )),
              Positioned(
                  top: 95.h,
                  right: 15.w,
                  child: Container(
                    height: 24.sp,
                    width: 24.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Pallete.pinkColorPrinciple,
                    ),
                  )),
            ],
          )
        ]),
      );
    });
  }
}
