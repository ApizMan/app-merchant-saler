import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/resources/resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_merchant_saler/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if the token and merchant ID are stored in SharedPreferences
  final token = await LoginResources.getToken();
  final merchantId = await LoginResources.getMerchantId();
  final merchantSeq = await LoginResources.getMerchantSeq();
  final merchantName = await LoginResources.getMerchantName();

  // Check if all values are not null before printing
  if (token != null && merchantId != null && merchantSeq != null) {
    if (kDebugMode) {
      print("Token: $token");
      print("Merchant ID: $merchantId");
      print("Merchant Sequence: $merchantSeq");
      print("Merchant Name: $merchantName");
    }
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
      ),
      home: token != null && merchantId != null
          ? const Dashboard()
          : const Login(),
    ),
  );
}
