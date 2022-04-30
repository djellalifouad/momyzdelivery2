import 'dart:convert';
import 'dart:io';

import 'package:momyzdelivery/constant/server.const.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';

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

  static Future<Map<String, dynamic>> getOrdersFiltred(String token,
      String page, int delivery_type, double minPrice, double maxPrice) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.get(
      Uri.parse(baseUrl +
          "orders?page=${page}&delivery_type=${delivery_type}&price[min]=${minPrice}&price[max]=${maxPrice}"),
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
    print("response declive");
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
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
    print('response accept order');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Order?> previewOrder(String id, String token) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.get(
      Uri.parse(baseUrl + "orders/${id}/preview"),
      headers: headers,
    );
    print('response priview Order');
    Map<String, dynamic> map = json.decode(response.body);
    if (response.statusCode == 200) {
      return Order.fromMap(map['data']);
    } else {
      return null;
    }
  }

  static Future<bool> sendCode(String id, String token) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.get(
      Uri.parse(baseUrl + "orders/${id}/code/send"),
      headers: headers,
    );
    print("enter");
    print("response sendCode");
    showMessage(response.body);
    print(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> arrive(String id, String token, String code) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };

    http.Response response = await http.post(
      Uri.parse(baseUrl + "orders/${id}/arrive"),
      body: {
        "code": code,
      },
      headers: headers,
    );
    print("response arrive");
    print(response.body);
    showMessage(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> sendPictureOrder({
    required String token,
    required String order_id,
    required List<File> images,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseUrl + 'orders/${order_id}/images'),
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    request.headers.addAll(headers);
    for (int i = 0; i < images.length; i++) {
      request.files.add(
        http.MultipartFile(
          'images[${i}]',
          images[i].readAsBytes().asStream(),
          images[i].lengthSync(),
          filename: images[i].path,
        ),
      );
    }
    http.StreamedResponse streamedResponse = await request.send();
    var responsed = await http.Response.fromStream(streamedResponse);
    print("response sendPic");
    print(responsed.body);
    print(responsed.statusCode);
    if (responsed.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
