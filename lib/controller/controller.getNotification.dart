import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/models/model.notification.dart';
import 'package:momyzdelivery/models/model.order.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/services/service.notification.dart';
import 'package:momyzdelivery/services/service.orders.dart';
import 'package:momyzdelivery/ui/views/orders/view_order_details.dart';
import 'package:momyzdelivery/ui/views/profile/view_profile.dart';

class NotificationController extends GetxController {
  ScrollController scrollController1 = ScrollController();
  _scrollListener1() {
    if (scrollController1.offset >=
            scrollController1.position.maxScrollExtent &&
        !scrollController1.position.outOfRange) {
      getNotifcations();
    }
  }

  List<NotificationModel> notifications = [];
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
  bool isGettingNotification = false;
  updateIsGettingOrder() {
    isGettingNotification = !isGettingNotification;
    update();
  }

  bool isGettingNextPage = false;
  updateIsGettingNextPage() {
    isGettingNextPage = !isGettingNextPage;
  }

  getNotifcations() async {
    if (notifications.isNotEmpty && !isMore) {
      return;
    }
    if (notifications.isNotEmpty) {
      updateIsGettingNextPage();
    }
    token = box.read('token').toString();
    if (notifications.isEmpty) {
      updateIsGettingOrder();
    }
    Map<String, dynamic> map =
        await NotificationService.getNotification(token, page.toString());
    isGettingNextPage = false;
    isGettingNotification = false;
    print(map['notifications']);
    if (map['success']) {
      notifications.addAll(map['notifications']);
      isMore = map['isMore'];
      page++;
    }
    update();
  }

  getNotifcationsFirst() async {
    notifications.clear();
    isGettingNotification = true;
    page = 1;
    update();
    if (notifications.isNotEmpty && !isMore) {
      return;
    }
    if (notifications.isNotEmpty) {
      updateIsGettingNextPage();
    }
    token = box.read('token').toString();
    Map<String, dynamic> map =
        await NotificationService.getNotification(token, page.toString());
    isGettingNextPage = false;
    isGettingNotification = false;
    print(map['notifications']);
    if (map['success']) {
      notifications.addAll(map['notifications']);
      isMore = map['isMore'];
      page++;
    }
    update();
  }

  navigateNotication(NotificationModel notificationModel) async {
    token = box.read('token').toString();
    if (notificationModel.route == "home") {
      return;
    } else if (notificationModel.route == "order") {
      Order? order = await OrderService.previewOrder2(
          notificationModel.order_id.toString(), token);
      if (order != null) {
        Get.to(OrderDetails(order));
      }
    }
  }
}
