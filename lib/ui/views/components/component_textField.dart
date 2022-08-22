import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../constant/pallete.const.dart';

class TextFormFieldComponent extends StatefulWidget {
  String title;
  String icon;
  String icon2;
  TextEditingController textEditingController;
  final String? Function(String?)? validator;
  TextFormFieldComponent({
    required this.title,
    required this.icon,
    required this.icon2,
    required this.validator,
    required this.textEditingController,
  });

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  List<String> numberTypes = ['number'.tr + ' ' + 'IBAN'.tr, 'ammount'.tr];
  bool obscureText = false;

  @override
  void initState() {
    if (mounted) {
      obscureText = ('password'.tr == this.widget.title) ||
          ('confirm_password'.tr == this.widget.title) ||
          ('enter_new_password2'.tr == this.widget.title) ||
          ('enter_new_password'.tr == this.widget.title);
      setState(() {});
    }
    super.initState();
  }

  updateObscure() {
    obscureText = !obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: widget.textEditingController,
      validator: widget.validator,
      
      keyboardType: numberTypes.contains(widget.title) & Platform.isAndroid
          ? TextInputType.number
          : TextInputType.text,
      readOnly: widget.icon2.isNotEmpty,
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints(
          maxHeight: 15.sp,
          maxWidth: widget.title.isNotEmpty ? 45.sp : 30.sp,
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 35.sp,
          maxWidth: widget.title.isNotEmpty ? 65.sp : 30.sp,
        ),
        
        prefixIcon: widget.icon.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(
                  right: 15.w,
                  left: 10.w,
                ),
                child: SvgPicture.asset(
                  widget.icon,
                ),
              )
            : Container(),
        suffixIcon: Builder(builder: (context) {
          if (widget.title == "password".tr ||
              'confirm_password'.tr == this.widget.title ||
              'enter_new_password2'.tr == this.widget.title ||
              'enter_new_password'.tr == this.widget.title) {
            return InkWell(
              onTap: () {
                updateObscure();
              },
              child: Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Icon(
                    obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    color: Colors.grey,
                    size: 20.sp,
                  )),
            );
          }
          return widget.icon2.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 15.w,
                  ),
                  child: PopupMenuButton<String>(
                    icon: SvgPicture.asset(
                      widget.icon2,
                    ),
                    onSelected: (String value) {
                      widget.textEditingController.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return ["normaDelivery".tr, "fastDelivery".tr]
                          .map<PopupMenuItem<String>>((String value) {
                        return new PopupMenuItem(
                            child: new Text(value), value: value);
                      }).toList();
                    },
                  ),
                )
              : Container();
        }),
        filled: true,
        fillColor: Color.fromRGBO(252, 250, 250, 1),
        hintText: widget.title,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Pallete.pinkColorPrinciple),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(189, 189, 189, 1)),
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
    );
  }
}
