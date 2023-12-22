import 'dart:async';

import 'package:app_merchant_saler/helpers/validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StoreProfileFormBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final phoneNum = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final email = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  final address = TextFieldBloc(
    validators: [
      InputValidator.required,
    ],
  );

  StoreProfileFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        name,
        phoneNum,
        email,
        address,
      ],
    );
  }

  @override
  FutureOr<void> onSubmitting() {
    emitSuccess(successResponse: 'Profile Successfully Updated');
  }
}
