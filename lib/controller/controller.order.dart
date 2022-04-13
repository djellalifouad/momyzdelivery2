import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/models/model.order.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/services/service.orders.dart';

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
    Map<String, dynamic> map =
        await OrderService.getOrders(token, page.toString());
    isGettingNextPage = false;
    isGettingOrder = false;
    if (map['success']) {
      orders.addAll(map['orders']);
      isMore = map['isMore'];
      page++;
    }
    update();
  }
}
