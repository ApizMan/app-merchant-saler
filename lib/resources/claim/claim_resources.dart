import 'dart:convert';

import 'package:app_merchant_saler/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ClaimResources {
  static Future filterMonthYear({
    required String prefix,
    required Object body,
  }) async {
    final token = await ClaimResources.getToken();
    var response = await http.post(
      Uri.parse('$baseURL$prefix'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: body,
    );
    return json.decode(response.body);
  }

  // Share Preferences
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyToken);
  }
}