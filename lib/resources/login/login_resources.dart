import 'dart:convert';

import 'package:app_merchant_saler/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginResources {
  static Future loginToken({
    required String prefix,
    required Object body,
  }) async {
    var response = await http.post(
      Uri.parse('$baseURL$prefix'),
      body: body,
    );
    return json.decode(response.body);
  }

  static Future logout({
    required String prefix,
  }) async {
    final token = await LoginResources.getToken();
    var response = await http.post(
      Uri.parse('$baseURL$prefix'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return json.decode(response.body);
  }

// Share Preferences
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyToken);
  }

  static Future<String?> getMerchantId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyMerchantId);
  }

  static Future<int?> getMerchantSeq() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(keyMerchantSeq);
  }

  static Future<String?> getMerchantName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyMerchantName);
  }
}
