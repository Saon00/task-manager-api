import 'dart:convert';

import 'package:http/http.dart' as http;

class NetWorkUtils {
  // get request
  static Future<dynamic> getMethod(String url) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print("UnAuthorized");
      } else {
        print("Something went wrong!!");
      }
    } catch (e) {
      print(e);
    }
  }

// post request
  static Future<dynamic> postMethod(String url,
      {Map<String, String>? body}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(body));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print("UnAuthorized");
      } else {
        print("Something went wrong!! ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }
}
