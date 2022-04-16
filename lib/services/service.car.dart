import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:momyzdelivery/models/model.car.dart';
import '../constant/server.const.dart';

class CarService {
  static Future<Car?> deleteCarImage(String token, String id) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };
    http.Response response = await http.delete(
      Uri.parse(baseUrl + "profile/car/images/${id}"),
      headers: headers,
    );
    print("response /profile/car/images/${id}");
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body); 
      return Car.fromMap(map['data']['car']);
    } else {
      return null;
    }
  }

  static Future<bool> addCardImage(String token, File image) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${token}",
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseUrl + 'profile/car/images'),
    );
    request.headers.addAll(headers);
    request.files.add(
      http.MultipartFile(
        'image',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename: image.path,
      ),
    );
    http.StreamedResponse streamedResponse = await request.send();
    var responsed = await http.Response.fromStream(streamedResponse);
    print(streamedResponse.statusCode);
    if (responsed.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Car?> addCarImage(File? image, String token) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseUrl + 'profile/car/images'),
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
      'Authorization': "Bearer ${token}",
    };
    if (image != null) {
      request.files.add(http.MultipartFile(
        'image',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename: image.path,
      ));
    }
    request.headers.addAll(headers);
    http.StreamedResponse streamedResponse = await request.send();
    var responsed = await http.Response.fromStream(streamedResponse);
    print('response update profilePicture');
    print(responsed.body);
    print(responsed.statusCode);
    if (responsed.statusCode == 201) {
      Map<String, dynamic> map = json.decode(responsed.body);
      return Car.fromMap(map['data']['car']);
    } else {
      return null;
    }
  }
}
