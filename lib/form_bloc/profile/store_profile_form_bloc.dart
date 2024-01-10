import 'dart:async';

import 'package:app_merchant_saler/helpers/validators.dart';
import 'package:app_merchant_saler/models/merchant_seq_model.dart';
import 'package:app_merchant_saler/resources/resources.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StoreProfileFormBloc extends FormBloc<String, String> {
  final MerchantSeqModel merchantSeqModel;

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

  StoreProfileFormBloc({required this.merchantSeqModel}) {
    name.updateValue(merchantSeqModel.merchantPic!);
    phoneNum.updateValue(merchantSeqModel.merchantContact!);
    email.updateValue(merchantSeqModel.merchantEmail!);
    address.updateValue(merchantSeqModel.merchantAddress!);
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
  FutureOr<void> onSubmitting() async {
    merchantSeqModel.merchantContact = phoneNum.value;
    merchantSeqModel.merchantAddress = address.value;
    merchantSeqModel.merchantPic = name.value;
    if (merchantSeqModel.merchantEmail == email.value) {
      emitFailure(
          failureResponse: 'The merchant email has already been taken.');
      return;
    } else {
      merchantSeqModel.merchantEmail = email.value;
    }

    // Inside the onSubmitting method
    final response = await ProfileResources.updateProfile(
      prefix: 'merchant-update-info',
      body: {
        "merchant_contact": merchantSeqModel.merchantContact.toString(),
        "merchant_address": merchantSeqModel.merchantAddress.toString(),
        "merchant_pic": merchantSeqModel.merchantPic.toString(),
        "merchant_email": merchantSeqModel.merchantEmail.toString(),
      },
    );

    ProfileErrorResources validationResult =
        ProfileErrorResources.fromJson(response);

    if (validationResult.errors.isNotEmpty) {
      // Handle validation errors, for example, you can emit an error state
      emitFailure(failureResponse: validationResult.errors.toString());
    } else {
      // No validation errors, proceed with success
      emitSuccess(successResponse: "Merchant info updated successfully");
    }
  }
}
