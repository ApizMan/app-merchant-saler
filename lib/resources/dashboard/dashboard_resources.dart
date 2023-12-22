import 'dart:convert';

import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/resources/resources.dart';
import 'package:http/http.dart' as http;

class DashboardResources {
  static Future merchantRedeemed({
    required String prefix,
  }) async {
    final token = await LoginResources.getToken();
    var response = await http.get(
      Uri.parse('$baseURL$prefix'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    return json.decode(response.body);
  }
}
