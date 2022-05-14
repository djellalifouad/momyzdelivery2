import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constant/server.const.dart';

class TermsOfUseService {
  static Future<String> getTermrs() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      "X-Requested-With": "XMLHttpRequest",
    };
    http.Response response =
        await http.get(Uri.parse(baseUrl + "terms-of-use"), headers: headers);
    Map<String, dynamic> map = json.decode(response.body);
    print(response);
    if (response.statusCode == 200) {
      return map['driver_terms_of_use'].toString();
    } else {
      return ""; 
    }
  }
}
