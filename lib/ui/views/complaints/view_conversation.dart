import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momyzdelivery/controller/controller.comments.dart';
import 'package:momyzdelivery/models/model.ticket.dart';

import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Conversation extends StatefulWidget {
  Ticket ticket;
  Conversation(this.ticket);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  final controller = Get.put(CommentController());
  @override
  void initState() {
    controller.getComments(widget.ticket.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<CommentController>(builder: (context2) {
        if (controller.isMakingComment) {
          return SizedBox(
            height: 25.sp,
            width: 25.sp,
            child: Center(
              child: SizedBox(
                height: 25.sp,
                width: 25.sp,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: controller.image != null ? 145.h : 97.h,
              child: Column(
                children: [
                  controller.image != null
                      ? Container(
                          height: 50.h,
                          child: Row(children: [
                            if (controller.image != null)
                              Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Stack(
                                  children: [
                                    Image.file(
                                      controller.image,
                                      height: 30.sp,
                                      width: 30.sp,
                                    ),
                                    Positioned(
                                      top: 4.sp,
                                      right: 4.sp,
                                      child: InkWell(
                                        onTap: () {
                                          controller.deleteImage();
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          size: 8.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            else
                              Container()
                          ]),
                          decoration: BoxDecoration(color: Colors.white),
                        )
                      : Container(),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 90.h,
                    child: TextFormField(
                      controller: controller.textEditingController,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 15.sp,
                          maxWidth: 60.sp,
                        ),
                        suffixIconConstraints: BoxConstraints(
                          maxHeight: 15.sp,
                          maxWidth: 60.sp,
                        ),
                        prefixIcon: InkWell(
                          onTap: () {
                            controller.getImage();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 25.w, left: 10.w),
                            child: SvgPicture.asset('assets/icons/pined.svg'),
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.sendComment(widget.ticket.id.toString());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 10.w),
                            child: SvgPicture.asset(
                              'assets/icons/Send.svg',
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(252, 250, 250, 1),
                        hintText: 'write_your_message'.tr,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Pallete.pinkColorPrinciple),
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      backgroundColor: Pallete.backGroundColor2,
      appBar: AppBar(
        backgroundColor: Pallete.backGroundColor2,
        centerTitle: true,
        elevation: 0,
        title: Text(
          widget.ticket.title,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<CommentController>(builder: (context) {
                return Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.comments.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                                alignment:
                                    controller.comments[index].sender == "admin"
                                        ? Alignment.topRight
                                        : Alignment.topLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: controller
                                                  .comments[index].sender ==
                                              "admin"
                                          ? Color.fromRGBO(249, 72, 146, 0.15)
                                          : Color.fromRGBO(235, 236, 240, 1),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.sp),
                                    child: Text(
                                      controller.comments[index].message,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                )),
                            Builder(
                              builder: (context) {
                                if (controller
                                    .comments[index].image_url.isNotEmpty) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Align(
                                        alignment:
                                            controller.comments[index].sender ==
                                                    "admin"
                                                ? Alignment.topRight
                                                : Alignment.topLeft,
                                        child: CachedNetworkImage(
                                            height: 100.sp,
                                            width: 100.sp,
                                            imageUrl: controller
                                                .comments[index].image_url),
                                      )
                                    ],
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
