import 'dart:async';

import 'package:app_merchant_saler/helpers/validators.dart';
import 'package:app_merchant_saler/resources/forgot_username_pin/forgot_username_pin_error_resources.dart';
import 'package:app_merchant_saler/resources/forgot_username_pin/forgot_username_pin_resources.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StoreTempPinFormBloc extends FormBloc<String, String> {
  final merchantId = TextFieldBloc(validators: [
    InputValidator.required,
  ]);

  StoreTempPinFormBloc() {
    addFieldBloc(fieldBloc: merchantId);
  }

  @override
  FutureOr<void> onSubmitting() async {
    final String merchantID = merchantId.value;
    final response = await ForgotUsernamePinResources.sendTempPIN(
      prefix: 'send-temp-pin',
      body: {
        "merchantid": merchantID,
      },
    );

    ForgotUsernamePinErrorResources validationResult =
        ForgotUsernamePinErrorResources.fromJson(response);
        
    if (validationResult.errors.isNotEmpty) {
      // Handle validation errors, for example, you can emit an error state
      emitFailure(failureResponse: validationResult.errors.toString());
    } else {
      // No validation errors, proceed with success
      emitSuccess(successResponse: response['message'].toString());
    }
  }
}
