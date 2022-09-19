import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momyzdelivery/models/model.order.dart';
import 'package:momyzdelivery/ui/views/orders/view_invoice.dart';
import 'package:momyzdelivery/ui/views/orders/view_order_locationPreview.dart';
import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../complaints/view_choose_type_complaint.dart';
import '../complaints/view_list_complaint2.dart';
import '../complaints/view_make_complaint.dart';
import '../complaints/view_make_complaint2.dart';

class OrderDetails extends StatelessWidget {
  Order order;
  OrderDetails(this.order);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backGroundColor2,
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Pallete.backGroundColor2,
        elevation: 0,
        title: Text(
          'order_detail_title'.tr,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: Pallete.greyColorPrinciple),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 6.h,
            ),
            Center(
              child: Text(
                order.date.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'product_details'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.black),
            ),
            SizedBox(
              height: 12.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: order.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Container(
                    width: 327.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.sp)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 16.w,
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 60.sp,
                              width: 60.sp,
                              child: CachedNetworkImage(
                                  errorWidget: (context, string, val) =>
                                      Image.asset(
                                        'assets/images/cover.png',
                                        height: 25.sp,
                                        width: 25.sp,
                                      ),
                                  placeholder: (context, string) => Image.asset(
                                        'assets/images/cover.png',
                                        height: 25.sp,
                                        width: 25.sp,
                                      ),
                                  imageUrl: order.items[index].image_url),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(order.items[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: Colors.black)),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    width: 120.w,
                                    height: 10.h,
                                    child: Text(
                                      order.items[index].description.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8.sp,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('date'.tr + " : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                        color: Colors.black)),
                                Text(
                                  order.date.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.sp,
                                      color: Pallete.greyColorPrinciple),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 28.w,
                            ),
                            Row(
                              children: [
                                Text('qty'.tr + " : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                        color: Colors.black)),
                                Text(order.items[index].qty.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                        color: Pallete.greyColorPrinciple)),
                              ],
                            ),
                            SizedBox(
                              width: 28.w,
                            ),
                            Row(
                              children: [
                                Text('price'.tr + " : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                        color: Colors.black)),
                                Text(
                                  order.items[index].price.toString() + "₪",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.sp,
                                      color: Pallete.greyColorPrinciple),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ]),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            Text('market'.tr,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Pallete.greyColorPrinciple)),
            SizedBox(
              height: 12.h,
            ),
            order.store == null
                ? Center(
                    child: Text(
                      "store_deleted".tr,
                      style: TextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container(
                    width: 327.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.sp)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 5.w,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30.sp,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    width: 60.sp,
                                    height: 60.sp,
                                    errorWidget: (context, string, val) =>
                                        Image.asset('assets/images/test.png'),
                                    placeholder: (context, string) =>
                                        Image.asset('assets/images/test.png'),
                                    imageUrl: order.store!.image_url),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(order.store!.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        color: Colors.black)),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 100.w,
                                              child: Text(
                                                order.store!.address,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 10.sp,
                                                  color: Pallete
                                                      .greyColorPrinciple,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6.w,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/location.svg',
                                              height: 12.sp,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          order.store!.phone,
                                          style: GoogleFonts.poppins(
                                            fontSize: 10.sp,
                                            color: Pallete.greyColorPrinciple,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/phone.svg',
                                          height: 12.sp,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    )),
            SizedBox(
              height: 12.h,
            ),
            Text('sended_to'.tr,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Pallete.greyColorPrinciple)),
            SizedBox(
              height: 12.h,
            ),
            order.user == null
                ? Center(
                    child: Text(
                    "user_deleted".tr,
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ))
                : Container(
                    width: 327.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.sp)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 5.w,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30.sp,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                    width: 60.sp,
                                    height: 60.sp,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, string, val) =>
                                        Image.asset('assets/images/test.png'),
                                    placeholder: (context, string) =>
                                        Image.asset('assets/images/test.png'),
                                    imageUrl: order.user!.image_url),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(order.user!.username.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        color: Colors.black)),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              order.address.toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                                color:
                                                    Pallete.greyColorPrinciple,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6.w,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/location.svg',
                                              height: 12.sp,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          order.user!.phone.toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 10.sp,
                                            color: Pallete.greyColorPrinciple,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/phone.svg',
                                          height: 12.sp,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    )),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                'delivery_address'.tr,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            InkWell(
                onTap: () {
                  Get.to(ViewOrderLocation(order));
                },
                child: Image.asset('assets/images/Frame 56.png')),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(Invoice(order));
                  },
                  child: Row(
                    children: [
                      Text(
                        'open_invoice'.tr,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Pallete.pinkColorPrinciple,
                          fontWeight: FontWeight.w600,
                          height: 1,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
          ],
        ),
        ),
      ),
    );
  }
}
