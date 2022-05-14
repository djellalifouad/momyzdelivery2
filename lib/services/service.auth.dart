import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:momyzdelivery/constant/server.const.dart';
import 'package:http/http.dart' as http;
import 'package:momyzdelivery/ui/views/toast/toast.message.dart';
import '../models/model.car.dart';
import '../models/model.settings.dart';
import '../models/model.user.dart';
import '../ui/views/profile/view_settings.dart';
import 'package:get/get.dart' as getx;

class AuthService {
  static Future<SettigsModel?> getSettings(String token) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.get(
      Uri.parse(baseUrl + "settings"),
      headers: headers,
    );
    Map<String, dynamic> map = json.decode(response.body);
    print('response settigs');
    print(map);
    if (response.statusCode == 200) {
      return SettigsModel.fromMap(map['settings']);
    } else {
      return null;
    }
  }

  static Future<bool> Login({
    required String country_code,
    required String phone,
  }) async {
    String? token = await FirebaseMessaging.instance.getToken();
    Dio dio = Dio();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    };
    print('/login');
    print({
      'fcm_token': token,
      'phone': phone,
      'country_code': country_code,
    });
    http.Response response =
        await http.post(Uri.parse(baseUrl + "login"), headers: headers, body: {
      'fcm_token': token.toString(),
      'phone': phone,
      'country_code': country_code,
    });
    print({
      'fcm_token': "token",
      'phone': phone,
      'country_code': country_code,
    });
    print("response get profile ");
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('/login response');
      Map<String, dynamic> map = json.decode(response.body);
      print(response.body);
      print(map['access_token']);
      final box = GetStorage();
      box.remove('token');
      box.write('token', map['access_token']);
      return true;
    } else {
      return false;
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
      print(e.response!.statusCode);

      if (e.response!.statusCode == 404) {
        return false;
      }
      if (e.response!.statusCode == 422) {
        Map<String, dynamic> map = json.decode(e.response.toString());
        if (map["account"] == "Store") {
          showMessage("account_store".tr);
        } else if (map["account"] == "User") {
          showMessage("account_user".tr);
        }
        return true;
      }
    }
    return false;
  }

  static Future<Car?> updateCarInformation2({
    required String token,
    required String name,
    required String model,
    required String car_number,
    required File? car_registration_certificate_image,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseUrl + 'profile/car/update'),
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    request.headers.addAll(headers);
    request.fields.addAll({
      "name": name,
      "model": model,
      "car_number": car_number,
    });
    if (car_registration_certificate_image != null) {
      request.files.add(http.MultipartFile(
        'car_registration_certificate_image',
        car_registration_certificate_image.readAsBytes().asStream(),
        car_registration_certificate_image.lengthSync(),
        filename: car_registration_certificate_image.path,
      ));
    }
    http.StreamedResponse streamedResponse = await request.send();
    var responsed = await http.Response.fromStream(streamedResponse);
    print(responsed.body);
    print(responsed.statusCode);
    if (responsed.statusCode == 201) {
      Map<String, dynamic> map = json.decode(responsed.body);
      return Car.fromMap(map['data']['car']);
    } else {
      return null;
    }
  }

  static Future<dynamic> updateCarInformation({
    required String token,
    required String name,
    required String model,
    required String car_number,
    required File car_registration_certificate_image,
    required List<File> images,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseUrl + 'profile/car/add'),
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    request.headers.addAll(headers);
    request.fields.addAll({
      "name": name,
      "model": model,
      "car_number": car_number,
    });
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
    request.files.add(http.MultipartFile(
      'car_registration_certificate_image',
      car_registration_certificate_image.readAsBytes().asStream(),
      car_registration_certificate_image.lengthSync(),
      filename: car_registration_certificate_image.path,
    ));
    print('hre');
    http.StreamedResponse streamedResponse = await request.send();
    var responsed = await http.Response.fromStream(streamedResponse);
    print(responsed.body);
    print(responsed.statusCode);
    if (responsed.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Driver?> updatePersonalInformation({
    required String token,
    required File? personal_id_image,
    required File? driving_licence_image,
    required String personal_id,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseUrl + 'profile/personal-info'),
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    print(headers);
    request.headers.addAll(headers);
    if (personal_id_image != null) {
      request.files.add(
        http.MultipartFile(
          'personal_id_image',
          personal_id_image.readAsBytes().asStream(),
          personal_id_image.lengthSync(),
          filename: personal_id_image.path,
        ),
      );
    }
    if (driving_licence_image != null) {
      request.files.add(
        http.MultipartFile(
          'driving_licence_image',
          driving_licence_image.readAsBytes().asStream(),
          driving_licence_image.lengthSync(),
          filename: driving_licence_image.path,
        ),
      );
    }

    request.fields.addAll({"personal_id": personal_id});
    print(request.files);
    print(request.fields);
    request.headers.addAll(headers);
    print("head");
    print(request.headers);
    http.StreamedResponse streamedResponse = await request.send();
    var responsed = await http.Response.fromStream(streamedResponse);
    print(responsed.body);
    print(headers);
    print(streamedResponse.statusCode);
    print(responsed.body);
    if (responsed.statusCode == 202) {
      Map<String, dynamic> map = json.decode(responsed.body);
      return Driver.fromMap(map['data']['driver']);
    } else {
      return null;
    }
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
    String? token = await FirebaseMessaging.instance.getToken();
    try {
      print({
        'phone': phone,
        'country_code': country_code,
        'fcm_token': token,
        'lon': lon,
        'lat': lat,
        'name': name,
      });
      print(
        {
          'phone': phone,
          'country_code': country_code,
          'fcm_token': token,
          'lon': lon,
          'lat': lat,
          'express_delivery': express_delivery,
          'name': name,
        },
      );
      result = await dio.post(baseUrl + "register",
          data: {
            'phone': phone,
            'country_code': country_code,
            'fcm_token': token,
            'lon': lon,
            'lat': lat,
            'express_delivery': express_delivery,
            'name': name,
          },
          options: Options(headers: {
            HttpHeaders.acceptHeader: "application/json",
          }));
      print("/register");
      Map<String, dynamic> map = result.data;
      print(map['access_token']);
      final box = GetStorage();
      box.write('token', map['access_token']);
      return true;
    } on DioError catch (e) {
      return null;
    } finally {}
  }
}
