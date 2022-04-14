import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/models/model.order.dart';
import 'package:get/get.dart';
import 'package:momyzdelivery/models/model.withdrawal.dart';
import 'package:momyzdelivery/services/service.orders.dart';
import 'package:momyzdelivery/services/service.profile.dart';

class TransactionController extends GetxController {
  ScrollController scrollController1 = ScrollController();
  _scrollListener1() {
    if (scrollController1.offset >=
            scrollController1.position.maxScrollExtent &&
        !scrollController1.position.outOfRange) {
      getOrders();
    }
  }

  List<Transaction> transactions = [];
  bool isGettingTransactions = false;
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

  updateIsGettingOrder() {
    isGettingTransactions = !isGettingTransactions;
    update();
  }

  bool isGettingNextPage = false;
  updateIsGettingNextPage() {
    isGettingNextPage = !isGettingNextPage;
  }
  getOrders() async {
    if (transactions.isNotEmpty && !isMore) {
      return;
    }
    if (transactions.isNotEmpty) {
      updateIsGettingNextPage();
    }
    token = box.read('token').toString();
    if (transactions.isEmpty) {
      updateIsGettingOrder();
    }
    Map<String, dynamic> map =
        await ProfileService.getTransaction(token, page.toString());
    isGettingNextPage = false;
    isGettingTransactions = false;
    if (map['success']) {
      transactions.addAll(map['transactions']);
      isMore = map['isMore'];
      page++;
    }
    update();
  }

  getTransactionsFirst() async {
    transactions.clear();
    page = 1;
    isMore = false;
    update();
    if (transactions.isNotEmpty && !isMore) {
      return;
    }
    if (transactions.isNotEmpty) {
      updateIsGettingNextPage();
    }
    token = box.read('token').toString();
    if (transactions.isEmpty) {
      updateIsGettingOrder();
    }
    Map<String, dynamic> map =
        await ProfileService.getTransaction(token, page.toString());
    isGettingNextPage = false;
    isGettingTransactions = false;
    if (map['success']) {
      transactions.addAll(map['transactions']);
      isMore = map['isMore'];
      page++;
    }
    update();
  }
}
