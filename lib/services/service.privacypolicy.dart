import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constant/server.const.dart';

class PrivacyPolicyService {
  static Future<String> getPrivacy() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
    };
    http.Response response =
        await http.get(Uri.parse(baseUrl + "privacy-policy"), headers: headers);
    Map<String, dynamic> map = json.decode(response.body);
    print(response); 
    if (response.statusCode == 200) {
      return map['privacy_policy'].toString();
    } else {
      return "";
    }
  }
}
