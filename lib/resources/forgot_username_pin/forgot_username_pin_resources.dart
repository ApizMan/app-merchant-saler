import 'dart:convert';

import 'package:app_merchant_saler/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ForgotUsernamePinResources {
  static Future sendTempPIN({
    required String prefix,
    required Object body,
  }) async {
    var response = await http.post(
      Uri.parse('$baseURL$prefix'),
      body: body,
      headers: {
        'Accept': 'application/json',
      },
    );
    return json.decode(response.body);
  }

  static Future updatePIN({
    required String prefix,
    required Object body,
  }) async {
    final token = await ForgotUsernamePinResources.getToken();
    var response = await http.put(
      Uri.parse('$baseURL$prefix'),
      body: body,
      headers: {
        'Accept': 'application/json',
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
}
