import 'dart:convert';

import 'package:app_merchant_saler/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileResources {
  static Future updateProfile({
    required String prefix,
    required Object body,
  }) async {
    try {
      final token = await ProfileResources.getToken();
      final seq = await ProfileResources.getMarchSeq();
      var response = await http.put(
        Uri.parse('$baseURL$prefix/$seq'),
        body: body,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      return json.decode(response.body);
    } catch (e) {
      e.toString();
    }
  }

  static Future getProfile({
    required String prefix,
  }) async {
    try {
      final token = await ProfileResources.getToken();
      final seq = await ProfileResources.getMarchSeq();
      var response = await http.get(
        Uri.parse('$baseURL$prefix/$seq'),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      return json.decode(response.body);
    } catch (e) {
      e.toString();
    }
  }

  // Share Preferences
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyToken);
  }

  static Future<int?> getMarchSeq() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(keyMerchantSeq);
  }
}
