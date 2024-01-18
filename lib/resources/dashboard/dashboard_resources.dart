import 'dart:convert';

import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/resources/resources.dart';
import 'package:http/http.dart' as http;

class DashboardResources {
  static Future merchantRedeemed({
    required String prefix,
  }) async {
    final todayDate =
        '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day}';
    final token = await LoginResources.getToken();
    var response = await http.post(Uri.parse('$baseURL$prefix'), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    }, body: {
      // "cm_usage_date": "16-01-2024",
      "cm_usage_date": todayDate,
    });
    return json.decode(response.body);
  }

  static Future totalScanToday({
    required String prefix,
  }) async {
    try {
      final token = await LoginResources.getToken();
      var response = await http.get(
        Uri.parse('$baseURL$prefix'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      return json.decode(response.body);
    } catch (e) {
      e.toString();
    }
  }

  static Future totalValueRedeem({
    required String prefix,
  }) async {
    try {
      final token = await LoginResources.getToken();
      var response = await http.get(
        Uri.parse('$baseURL$prefix'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      return json.decode(response.body);
    } catch (e) {
      e.toString();
    }
  }
}
