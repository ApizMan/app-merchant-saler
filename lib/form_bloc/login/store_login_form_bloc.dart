import 'dart:async';

import 'package:app_merchant_saler/helpers/validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StoreLoginFormBloc extends FormBloc<String, String> {
  final username = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final pin = TextFieldBloc(
    validators: [
      InputValidator.required,
      InputValidator.pin,
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

  @override
  FutureOr<void> onSubmitting() {}
}
