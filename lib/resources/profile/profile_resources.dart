import 'dart:convert';

import 'package:app_merchant_saler/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileResources {
  static Future updateProfile({
    required String prefix,
    required Object body,
    required String merchantSeq,
  }) async {
    try {
      final token = await ProfileResources.getToken();
      var response = await http.put(
        Uri.parse('$baseURL$prefix/$merchantSeq'),
        body: body,
        headers: {
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
}
