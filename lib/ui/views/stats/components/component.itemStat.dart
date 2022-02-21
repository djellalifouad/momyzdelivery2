import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constant/pallete.const.dart';
import 'package:get/get.dart';

class ItemStat extends StatelessWidget {
  String title;
  String value;

  ItemStat({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 17.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Pallete.greyText,
            ),
          ),
          Text(
            this.value.toString(),
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: title != 'available _to_withdrawal'.tr
                  ? Colors.black
                  : Pallete.greyText,
            ),
          ),
        ],
      ),
    );
  }
}
