import 'package:flutter/material.dart';

const baseURL = 'http://10.61.67.185:8000/api/';

const kPrimaryColor = Color.fromRGBO(59, 214, 204, 1);
const kWhiteColor = Colors.white;
const kGrey = Colors.grey;
const kBlack = Colors.black;
const kPrimaryButtonColor = Color.fromRGBO(67, 56, 202, 1);
const kRedColor = Colors.red;

const String keyToken = 'token';
const String keyMerchantId = 'merchantid';
const String keyMerchantSeq = 'merchant_seq';
const String keyMerchantName = 'merchant_name';

class DialogType {
  static const int info = 1;
  static const int danger = 2;
  static const int warning = 3;
  static const int success = 4;
}

// Success
const kBgSuccess = kPrimaryColor;
const kTextSuccess = Color.fromRGBO(236, 253, 245, 1.0);

// Danger
const kBgDanger = Color.fromRGBO(153, 27, 27, 1.0);
const kTextDanger = Color.fromRGBO(254, 242, 242, 1.0);

// Warning
const kBgWarning = Color.fromRGBO(188, 139, 20, 6);
const kTextWarning = Color.fromRGBO(255, 251, 235, 1.0);

// Info
const kBgInfo = kPrimaryColor;
const kTextInfo = Color.fromRGBO(236, 253, 245, 1.0);
