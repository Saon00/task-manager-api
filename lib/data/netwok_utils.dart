import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taskmanager/data/auth_utils.dart';
import 'package:taskmanager/main.dart';
import 'package:taskmanager/ui/auth_screens/login_screen.dart';

class NetWorkUtils {
  // get request
  static Future<dynamic> getMethod(String url,
      {VoidCallback? onUnAuthorize,String? token}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url),
        headers: {"Content-Type": "application/json", 'token': AuthUtils.token ?? ""},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        }else{
          moveToLoginScreen();
        }
      } else {
        log("Something went wrong!!");
      }
    } catch (e) {
      log("$e");
    }
  }

// post request
  static Future<dynamic> postMethod(String url,
      {Map<String, String>? body,
      VoidCallback? onUnAuthorize,
      String? token}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json", 'token': AuthUtils.token ?? ""},
          body: jsonEncode(body));

      // print(response.body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {moveToLoginScreen();}
      } else {
        if (kDebugMode) {
          print("Something went wrong!! ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

 static void moveToLoginScreen() async{
   await AuthUtils.clearData();
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
}
