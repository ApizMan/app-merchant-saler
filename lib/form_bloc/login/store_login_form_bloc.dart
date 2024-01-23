import 'dart:async';
import 'dart:io';

import 'package:app_merchant_saler/helpers/share_preferences_helper.dart';
import 'package:app_merchant_saler/helpers/validators.dart';
import 'package:app_merchant_saler/models/login_model.dart';
import 'package:app_merchant_saler/resources/login/login_error_resources.dart';
import 'package:app_merchant_saler/resources/resources.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StoreLoginFormBloc extends FormBloc<String, String> {
  final LoginModel loginModel = LoginModel();

  final username = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final pin = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  StoreLoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        username,
        pin,
      ],
    );
  }

  String getDeviceName() {
    if (Platform.isAndroid) {
      return 'Android Device';
    } else if (Platform.isIOS) {
      return 'iOS Device';
    } else {
      // Fallback for other platforms
      return 'Unknown Device';
    }
  }

  @override
  FutureOr<void> onSubmitting() async {
    loginModel.merchantId = username.value;
    loginModel.merchantPin = pin.value;

    String deviceName = getDeviceName();
    loginModel.deviceName = deviceName;

    // Inside the onSubmitting method
    final response = await LoginResources.loginToken(
      prefix: 'login',
      body: {
        "merchantid": loginModel.merchantId,
        "merchant_pin": loginModel.merchantPin,
        "device_name": loginModel.deviceName,
      },
    );

    LoginErrorResources validationResult =
        LoginErrorResources.fromJson(response);

    if (validationResult.errors.isNotEmpty) {
      // Handle validation errors, for example, you can emit an error state
      emitFailure(failureResponse: validationResult.errors.toString());
    } else {
      // No validation errors, proceed with success
      emitSuccess(successResponse: "Successfully Login");
      SharedPreferencesHelper.saveTokenAndMerchantId(
        response['token'],
        response['merchantid'],
        response['merchant_seq'],
      );
    }
  }
}
