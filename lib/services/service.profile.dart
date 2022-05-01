import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:momyzdelivery/models/model.comment.dart';
import 'package:momyzdelivery/models/model.withdrawal.dart';
import 'package:momyzdelivery/ui/views/stats/view_withdrawal.dart';
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';
import '../constant/server.const.dart';
import 'dart:convert';

import '../models/model.ticket.dart';
import '../models/model.user.dart';

class ProfileService {
  static Future<Map<String, dynamic>> getTicets(
      int page, String token, int status) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    List<Ticket> tickets = [];
    http.Response response = await http.get(
        Uri.parse(baseUrl + "tickets?page=${page}&status=${status}"),
        headers: headers);
    Map<String, dynamic> map = json.decode(response.body);
    print("respinse tocke");
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      for (int i = 0; i < map['data'].length; i++) {
        tickets.add(Ticket.fromMap(map['data'][i]));
      }
      return {
        'success': true,
        'tickets': tickets,
        'isMore': map['links']['next'] == null ? false : true,
      };
    } else {
      return {
        'success': false,
      };
    }
  }

  static Future<Comment?> makeComment(
      String message, File? image, String id, String token) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        baseUrl + 'tickets/${id}/comments',
      ),
    );
    request.headers.addAll(headers);
    request.fields.addAll({
      'message': message,
    });
    if (image != null) {
      request.files.add(
        http.MultipartFile(
          'image',
          image.readAsBytes().asStream(),
          image.lengthSync(),
          filename: image.path,
        ),
      );
    }
    http.StreamedResponse streamedResponse = await request.send();
    var responsed = await http.Response.fromStream(streamedResponse);
    print(streamedResponse.statusCode);
    print("response add tiket");
    print(responsed.body);
    if (responsed.statusCode == 201) {
      Map<String, dynamic> map = json.decode(responsed.body);
      return Comment.fromMap(map['data']);
    } else {
      return null;
    }
  }

  static Future<List<Comment>> getComments(
    int id,
    String token,
  ) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    List<Comment> comments = [];
    http.Response response =
        await http.get(Uri.parse(baseUrl + "tickets/${id}"), headers: headers);
    Map<String, dynamic> map = json.decode(response.body);
    print('response get Comments');
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      for (int i = 0; i < map['ticket']['comments'].length; i++) {
        comments.add(Comment.fromMap(map['ticket']['comments'][i]));
      }
      return comments;
    } else {
      return comments;
    }
  }

  static Future<String> createTicket(
      String token, String title, String message, File? image) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        baseUrl + 'tickets',
      ),
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    request.headers.addAll(headers);
    if (image != null) {
      request.files.add(
        http.MultipartFile(
          'image',
          image.readAsBytes().asStream(),
          image.lengthSync(),
          filename: image.path,
        ),
      );
    }
    request.fields.addAll({
      'title': title,
      'message': message,
    });
    http.StreamedResponse streamedResponse = await request.send();
    var responsed = await http.Response.fromStream(streamedResponse);
    print(streamedResponse.statusCode);
    print("response add tiket");
    print(responsed.body);

    if (responsed.statusCode == 201) {
      return "success";
    } else {
      return "error";
    }
  }

  static Future<Driver?> updateProfilePhone(
      String token, String countryCode, String phone) async {
    print('hre');
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };

    http.Response response = await http
        .put(Uri.parse(baseUrl + "profile/phone"), headers: headers, body: {
      'country_code': countryCode,
      'phone': phone,
    });
    print("response profile/phone ");
    print(response.body);
    print(response.statusCode);
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 202) {
      return Driver.fromMap(responseData['data']['driver']);
    } else {
      return null;
    }
  }

  static Future<Driver?> updateProfileName(String token, String name) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };

    http.Response response =
        await http.put(Uri.parse(baseUrl + "profile"), headers: headers, body: {
      'name': name,
    });
    print("response profile/phone ");
    print(response.body);
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      return Driver.fromMap(responseData['data']['driver']);
    } else {
      return null;
    }
  }

  static Future<Driver?> getProfile(String token) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.get(
      Uri.parse(baseUrl + "profile"),
      headers: headers,
    );
    print("response get profile ");
    print(response.body);

    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 401) {
      return null;
    }
    return Driver.fromMap(responseData['data']['driver']);
  }

  static Future<bool> logout(String token) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.get(
      Uri.parse(baseUrl + "logout"),
      headers: headers,
    );
    print("response get logout ");
    print(response.body);
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> sendDeleteAccount(String token) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.post(
      Uri.parse(baseUrl + "delete-account"),
      headers: headers,
    );
    print("response /delete-account");
    print(response.body);
    if (response.statusCode == 412) {
      return "already_exist";
    }
    if (response.statusCode == 201) {
      return "success";
    } else {
      return "error";
    }
  }

  static Future<Transaction?> makeWithdrawal(
      String token, String iban, String amount, String description) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http
        .post(Uri.parse(baseUrl + "withdrawal"), headers: headers, body: {
      'amount': amount,
      'iban': iban,
      'description': description,
    });
    print('response make withdrawal');
    print(response.body);
    print(response.statusCode);
    Map<String, dynamic> map = json.decode(response.body);
    if (response.statusCode == 422) {
      showMessage(map['message']);
      return null;
    } else {
      return Transaction.fromMap(map['data']['withdrawal']);
    }
  }

  static Future<String?> updateProfilePicture(File image, String token) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseUrl + 'profile/image'),
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    request.files.add(http.MultipartFile(
      'image',
      image.readAsBytes().asStream(),
      image.lengthSync(),
      filename: image.path,
    ));
    request.headers.addAll(headers);
    http.StreamedResponse streamedResponse = await request.send();
    var responsed = await http.Response.fromStream(streamedResponse);
    print('response update profilePicture');

    print(responsed.body);
    print(responsed.statusCode);
    if (responsed.statusCode == 202) {
      Map<String, dynamic> map = json.decode(responsed.body);
      return map['data']['profile']['image_url'];
    } else {
      return null;
    }
  }

  static Future<Driver?> updateOnlineState(String token) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.put(
      Uri.parse(baseUrl + "profile/online-state"),
      headers: headers,
    );
    Map<String, dynamic> map = json.decode(response.body);
    print('response map');
    print(map);
    if (response.statusCode == 200) {
      return Driver.fromMap(map['data']['driver']);
    } else {
      return null;
    }
  }

  static Future<Map<String, dynamic>> getTransaction(
      String token, String page) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.get(
      Uri.parse(baseUrl + "transactions?page=${page}"),
      headers: headers,
    );
    print("response: transactions");
    print(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    List<Transaction> transationList = [];
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < responseData['data'].length; i++) {
        transationList.add(Transaction.fromMap(responseData['data'][i]));
      }
      return {
        'success': true,
        'transactions': transationList,
        'isMore': responseData['links']['next'] == null ? false : true,
      };
    }
    return {
      'success': false,
    };
  }
}
