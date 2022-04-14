import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/models/model.ticket.dart';
import 'package:momyzdelivery/services/service.profile.dart';

class TicketController extends GetxController {
  var box = GetStorage();
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();
  bool isMore1 = true;
  bool isMore2 = true;
  _scrollListener1() {
    if (scrollController1.offset >=
            scrollController1.position.maxScrollExtent &&
        !scrollController1.position.outOfRange) {
      getTicket1();
    }
  }

  _scrollListener2() {
    print("scrolling");
    if (scrollController2.offset >=
            scrollController2.position.maxScrollExtent &&
        !scrollController2.position.outOfRange) {
      getTicket2();
    }
  }

  bool isSending = false;
  List<Ticket> tickets1 = [];
  List<Ticket> tickets2 = [];
  int page1 = 1;
  int page2 = 1;
  String token = "";
  bool isGetting1 = false;
  bool isGetting2 = false;
  @override
  void onInit() {
    box = GetStorage();
    token = box.read('token').toString();
    scrollController1.addListener(_scrollListener1);
    scrollController2.addListener(_scrollListener2);
    super.onInit();
  }

  updateIsGetting1() {
    isGetting1 = !isGetting1;
    update();
  }

  updateIsGetting2() {
    isGetting2 = !isGetting2;
    update();
  }

  bool isOpen = true;
  updateIsOpen() {
    isOpen = !isOpen;
    update();
  }

  getFirst() {
    print("wow");
    isMore1 = true;
    isMore2 = true;
    tickets1.clear();
    tickets2.clear();
    page1 = 1;
    page2 = 1;
    isGetting1 = false;
    isGetting2 = false;
    getTicket1();
    getTicket2();
    update();
  }

  getTicket1() async {
    if (!isMore1) {
      return;
    }
    String token = box.read('token').toString();
    if (page1 == 1) {
      updateIsGetting1();
    }
    Map<String, dynamic> map = await ProfileService.getTicets(page1, token, 1);
    if (page1 == 1) {
      updateIsGetting1();
    }
    if (map['success']) {
      tickets1.addAll(map['tickets']);
      if (map['isMore']) {
        page1++;
      }
      isMore1 = map['isMore'];
    } else {}
    update();
  }

  getTicket2() async {
    if (!isMore2) {
      return;
    }
    String token = box.read('token').toString();
    if (page2 == 1) {
      updateIsGetting2();
    }
    Map<String, dynamic> map = await ProfileService.getTicets(page2, token, 2);
    if (page2 == 1) {
      updateIsGetting2();
    }
    if (map['success']) {
      tickets2.addAll(map['tickets']);
      isMore2 = map['isMore'];
      if (map['isMore']) {
        page2++;
        update();
      }
    } else {}
  }
}
