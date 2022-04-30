import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/models/model.order.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/services/service.orders.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/pallete.const.dart';
import '../ui/views/components/component_button.dart';
import '../ui/views/orders/view_filter.dart';

class OrderController extends GetxController {
  ScrollController scrollController1 = ScrollController();
  _scrollListener1() {
    if (scrollController1.offset >=
            scrollController1.position.maxScrollExtent &&
        !scrollController1.position.outOfRange) {
      getOrders();
    }
  }

  List<Order> orders = [];
  bool isGettingOrders = false;
  var box;
  String token = "";
  int page = 1;
  @override
  onInit() {
    scrollController1.addListener(_scrollListener1);
    box = GetStorage();
    token = box.read('token').toString();
  }

  bool isMore = false;

  bool isGettingOrder = false;
  updateIsGettingOrder() {
    isGettingOrder = !isGettingOrder;
    update();
  }

  bool isGettingNextPage = false;

  updateIsGettingNextPage() {
    isGettingNextPage = !isGettingNextPage;
  }

  getOrders() async {
    if (orders.isNotEmpty && !isMore) {
      return;
    }
    if (orders.isNotEmpty) {
      updateIsGettingNextPage();
    }
    token = box.read('token').toString();
    if (orders.isEmpty) {
      updateIsGettingOrder();
    }
    int delivery = 3;
    if (delivery_type == "express_delivery".tr) {
      delivery = 2;
    } else if (delivery_type == "normal_delivery".tr) {
      delivery = 1;
    }
    Map<String, dynamic> map = isFilterActivated
        ? await OrderService.getOrdersFiltred(
            token, page.toString(), delivery, minPrice, maxPrice)
        : await OrderService.getOrders(token, page.toString());
    isGettingNextPage = false;
    isGettingOrder = false;
    if (map['success']) {
      orders.addAll(map['orders']);
      isMore = map['isMore'];
      page++;
    }
    update();
  }

  RangeValues range = RangeValues(0, 100);

  double minPrice = 0;
  double maxPrice = 100;

  getOrdersFirst() async {
    orders.clear();
    page = 1;
    isMore = false;
    update();
    if (orders.isNotEmpty && !isMore) {
      return;
    }
    if (orders.isNotEmpty) {
      updateIsGettingNextPage();
    }
    token = box.read('token').toString();
    if (orders.isEmpty) {
      updateIsGettingOrder();
    }
    int delivery = 3;
    if (delivery_type == "express_delivery".tr) {
      delivery = 2;
    } else if (delivery_type == "normal_delivery".tr) {
      delivery = 1;
    }
    Map<String, dynamic> map = isFilterActivated
        ? await OrderService.getOrdersFiltred(
            token, page.toString(), delivery, minPrice, maxPrice)
        : await OrderService.getOrders(token, page.toString());
    isGettingNextPage = false;
    isGettingOrder = false;
    if (map['success']) {
      orders.addAll(map['orders']);
      isMore = map['isMore'];
      page++;
    }
    update();
  }

  String delivery_type = "express_delivery".tr;
  showFilterOrderBottomSheet() {
    Get.bottomSheet(FilterView(), enableDrag: false, useRootNavigator: false);
  }

  updateDeliveryType(String del) {
    delivery_type = del;
    update();
  }
  updateRange(double min, double max) {
    range = RangeValues(min, max);
    minPrice = min.toDouble();
    maxPrice = max.toDouble();
    update();
  }
  bool isFilterActivated = false;
  activateFilter() {
    isFilterActivated = true;
    page = 1;
    Get.back();
    getOrdersFirst();
    update();
  }
  desactivateFilter() {
    isFilterActivated = false;
    Get.back();
    page = 1;
    getOrdersFirst();
    update();
  }
}
