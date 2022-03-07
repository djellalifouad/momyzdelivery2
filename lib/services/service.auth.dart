import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:momyzdelivery/constant/server.const.dart';

import '../models/model.user.dart';

class AuthService {
  static Future<dynamic> Login({
    required String country_code,
    required String phone,
  }) async {
    String token = await FirebaseMessaging.instance.getToken().toString();
    Dio dio = Dio();
    Response<dynamic> result = await dio.post(
      baseUrl + "login",
      data: {
        'fcm_token': token,
        'phone': phone,
        'country_code': country_code,
      },
    );
    if (result.statusCode == 200) {
      Map<String, dynamic> map = json.decode(result.data);
      return Driver.fromMap(map);
    } else {
      return null;
    }
  }

  static Future<bool> phoneCheck({
    required String country_code,
    required String phone,
  }) async {
    Dio dio = Dio();
    try {
      Response<dynamic> result = await dio.post(
        baseUrl + "phone-check",
        data: {
          'phone': phone,
          'country_code': country_code,
        },
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
        }),
      );
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        return false;
      } else {
        return true;
      }
    }
    return true;
  }

  static Future<dynamic> register({
    required String name,
    required int express_delivery,
    required double lat,
    required double lon,
    required String country_code,
    required String phone,
  }) async {
    Response<dynamic> result;
    Dio dio = Dio();
    String token = await FirebaseMessaging.instance.getToken().toString();
    try {
      result = await dio.post(baseUrl + "login",
          data: {
            'phone': phone,
            'country_code': country_code,
            'fcm_token': token,
            'lon': lon,
            'lat': lat,
            'name': name,
          },
          options: Options(headers: {
            HttpHeaders.acceptHeader: "application/json",
          }));
    } on DioError catch (e) {
      return null;
    }
    print("/register");
    print(result.data);
  }
}
