import 'dart:convert';

import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/resources/resources.dart';
import 'package:http/http.dart' as http;

class CouponQrResources {
  static Future QRScan({
    required String prefix,
    required Object body,
  }) async {
    try {
      final token = await ProfileResources.getToken();
      var response = await http.put(
        Uri.parse('$baseURL$prefix'),
        body: body,
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
