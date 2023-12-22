import 'dart:async';

import 'package:app_merchant_saler/helpers/validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StoreForgotUsernamePin extends FormBloc<String, String> {
  final merchantId = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final merchantPhone = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  StoreForgotUsernamePin() {
    addFieldBlocs(
      fieldBlocs: [
        merchantId,
        merchantPhone,
      ],
    );
  }

  @override
  FutureOr<void> onSubmitting() {
    emitSuccess(successResponse: "Reset Successfully");
  }
}
