import 'package:app_merchant_saler/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<void> saveTokenAndMerchantId(
      String token, String merchantId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyToken, token);
    prefs.setString(keyMerchantId, merchantId);
  }
}
