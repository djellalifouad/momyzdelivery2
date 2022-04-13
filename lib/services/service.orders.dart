import 'dart:convert';

import 'package:momyzdelivery/constant/server.const.dart';

import '../models/model.order.dart';
import '../ui/views/orders/view_orders.dart';
import 'package:http/http.dart' as http;

class OrderService {
  static Future<Map<String, dynamic>> getOrders(
      String token, String page) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };

    http.Response response = await http.get(
      Uri.parse(baseUrl + "orders?page=${page}"),
      headers: headers,
    );
    print("response get order ");
    print(response.body);
    List<Order> orderList = [];
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < responseData['data'].length; i++) {
        orderList.add(Order.fromMap(responseData['data'][i]));
      }
      return {
        'success': true,
        'orders': orderList,
        'isMore': responseData['links']['next'] == null ? false : true,
      };
    }
    return {
      'success': false,
    };
  }

  static Future<bool> acceptOrder(String id, String token) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.get(
      Uri.parse(baseUrl + "orders/${id}/accept"),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> declineOrder(String id, String token) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.get(
      Uri.parse(baseUrl + "orders/${id}/decline"),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
