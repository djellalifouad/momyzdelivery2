import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:momyzdelivery/controller/controller.splash.dart';
import 'package:momyzdelivery/controller/controller.transactions.dart';
import 'package:momyzdelivery/ui/views/confirmOrder/view_confirmOrder2.dart';
import 'package:momyzdelivery/ui/views/stats/view_withdrawal.dart';
import '../../../constant/pallete.const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../components/component_button.dart';
import '../components/component_textField.dart';
import '../empty/empty.widget.dart';
import '../wait_view.dart';
import 'components/component.itemStat.dart';

class StateUser extends StatefulWidget {
  @override
  State<StateUser> createState() => _StateUserState();
}

class _StateUserState extends State<StateUser> {
  TransactionController transactionController =
      Get.put(TransactionController());
  List<Widget> images = [];

  @override
  void initState() {
    transactionController.getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(builder: (transactionController) {
      return GetBuilder<SplashController>(builder: (controller) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(245, 246, 250, 1),
          appBar: AppBar(
              backgroundColor: Color.fromRGBO(245, 246, 250, 1),
              centerTitle: true,
              title: Text(
                "my_benifit".tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              elevation: 0,
              leading: Container(),
              actions: [
                Padding(
                  padding: Get.locale!.countryCode == "US"
                      ? EdgeInsets.only(
                          right: 15.w,
                        )
                      : EdgeInsets.only(
                          left: 15.w,
                        ),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      )),
                ),
              ]),
          body: Builder(builder: (context) {
            if (transactionController.isGettingTransactions) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 26.h,
                        ),
                        Center(
                          child: Text(
                            " \$ ${controller.v!.wallet}".toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.w600,
                              color: Pallete.pinkColorPrinciple,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: Text(
                            "my_benifit_month".tr,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 70.w,
                            ),
                            child: ButtonComponent('withdrawal'.tr, () {
                              Get.to(Withdrawal());
                            })),
                        /*
                              SizedBox(
                                height: 32.h,
                              ),
                              Text(
                                'stats'.tr,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Column(
                                children: [
                                  ItemStat(
                                    title: 'my_benifit_month'.tr,
                                    value: "527.12\$",
                                  ),
                                  ItemStat(
                                    title: 'avg_benifit'.tr,
                                    value: "527.12\$",
                                  ),
                                  ItemStat(
                                    title: 'sum_order'.tr,
                                    value: "527.12\$",
                                  ),
                                  ItemStat(
                                    title: 'available _to_withdrawal'.tr,
                                    value: "527.12\$",
                                  ),
                                  ItemStat(
                                    title: 'withdrawal2'.tr,
                                    value: "527.12\$",
                                  ),
                                ],
                              ),
                              Text(
                                'total'.tr,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Column(
                                children: [
                                  ItemStat(
                                    title: 'totalDistance'.tr,
                                    value: "527km",
                                  ),
                                  ItemStat(
                                    title: 'totalTime'.tr,
                                    value: "4h30min",
                                  ),
                                ],
                              ),
                            */
                      ]),
                ),
                SizedBox(
                  height: 5.h,
                ),
                /* Container(
                  width: 1.sw,
                  height: 60.h,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(242, 242, 242, 1)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            SvgPicture.asset('assets/icons/Chart.svg'),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'stats'.tr,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Pallete.greyText,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                              color: Color.fromRGBO(130, 130, 130, 1),
                              size: 15.sp,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        )
                      ]),
                ),
                */
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                  ),
                  child: Align(
                    alignment: GetStorage().read("lang").toString() != "en"
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Text(
                      'my_trans'.tr,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: transactionController.transactions.isEmpty
                      ? Empty("no_withdrawal".tr)
                      : Stack(
                          children: [
                            RefreshIndicator(
                              onRefresh: () async {
                                transactionController.getTransactionsFirst();
                              },
                              child: ListView.builder(
                                itemCount:
                                    transactionController.transactions.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 12.h, left: 24.w, right: 24.w),
                                    child: Container(
                                      height: 70.h,
                                      width: 327.w,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 14.w),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    transactionController
                                                            .transactions[index]
                                                            .created_at
                                                            .substring(11, 16) +
                                                        " " +
                                                        transactionController
                                                            .transactions[index]
                                                            .created_at
                                                            .substring(0, 10),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 10.sp,
                                                        color:
                                                            Pallete.greyText),
                                                  ),
                                                  Text(
                                                    transactionController
                                                                .transactions[
                                                                    index]
                                                                .model_type ==
                                                            "WITHDRAWAL"
                                                        ? "withdrawal_type2".tr
                                                        : "withdrawal_type1".tr,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14.sp,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 14.w),
                                              child: Text(
                                                  transactionController
                                                              .transactions[
                                                                  index]
                                                              .model_type ==
                                                          "WITHDRAWAL"
                                                      ? transactionController
                                                              .transactions[
                                                                  index]
                                                              .amount +
                                                          " -"
                                                      : transactionController
                                                              .transactions[
                                                                  index]
                                                              .amount +
                                                          " +",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14.sp,
                                                      color: transactionController
                                                                  .transactions[
                                                                      index]
                                                                  .model_type !=
                                                              "WITHDRAWAL"
                                                          ? Color.fromRGBO(
                                                              33,
                                                              150,
                                                              83,
                                                              1,
                                                            )
                                                          : Color.fromRGBO(
                                                              235, 87, 87, 1))),
                                            )
                                          ]),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                )
              ],
            );
          }),
        );
      });
    });
  }
}
