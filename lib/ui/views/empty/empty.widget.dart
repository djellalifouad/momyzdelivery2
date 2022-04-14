import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Empty extends StatelessWidget {
  String title;
  Empty(this.title);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/empty.svg'),
          SizedBox(
            height: 20.h,
          ),
          Text(
            this.title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.sp),
          )
        ],
      ),
    );
  }
}
