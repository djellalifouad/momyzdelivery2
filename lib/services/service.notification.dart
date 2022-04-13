import 'dart:convert';

import 'package:momyzdelivery/constant/server.const.dart';
import 'package:momyzdelivery/ui/views/notifications/view_notification.dart';

import '../models/model.notification.dart';
import '../models/model.order.dart';
import '../ui/views/orders/view_orders.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  static Future<Map<String, dynamic>> getNotification(
      String token, String page) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };

    http.Response response = await http.get(
      Uri.parse(baseUrl + "notifications?per_page=10&page=${page}"),
      headers: headers,
    );
    print("response get notifications ");
    print(response.body);
    List<Notification> notificationList = [];
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < responseData['data'].length; i++) {
        notificationList.add(Notification.fromMap(responseData['data'][i]));
      }
      return {
        'success': true,
        'notifications': notificationList.toList(),
        'isMore': responseData['links']['next'] == null ? false : true,
      };
    }
    return {
      'success': false,
    };
  }
}
