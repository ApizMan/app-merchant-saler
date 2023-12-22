import 'package:app_merchant_saler/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:app_merchant_saler/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if the token and merchant ID are stored in SharedPreferences
  final token = await LoginResources.getToken();
  final merchantId = await LoginResources.getMerchantId();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: token != null && merchantId != null
          ? const Dashboard()
          : const Login(),
    ),
  );
}
