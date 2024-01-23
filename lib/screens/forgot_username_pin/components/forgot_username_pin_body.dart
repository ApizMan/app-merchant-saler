import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/form_bloc/forget_username_pin/store_temp_pin_form_bloc.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ForgotUsernamePinBody extends StatefulWidget {
  const ForgotUsernamePinBody({super.key});

  @override
  State<ForgotUsernamePinBody> createState() => _ForgotUsernamePinBodyState();
}

class _ForgotUsernamePinBodyState extends State<ForgotUsernamePinBody> {
  StoreTempPinFormBloc? storeTempPinFormBloc;
  bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocProvider(
          create: (context) => StoreTempPinFormBloc(),
          child: Builder(builder: (context) {
            storeTempPinFormBloc =
                BlocProvider.of<StoreTempPinFormBloc>(context);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Space(height: 30.0),
                FormBlocListener<StoreTempPinFormBloc, String, String>(
                  onSubmitting: (context, state) {
                    LoadingDialog.show(context);
                  },
                  onSubmissionFailed: (context, state) =>
                      LoadingDialog.hide(context),
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);
                    CustomDialog.show(
                      context,
                      icon: Icons.email,
                      dialogType: DialogType.success,
                      title: state.successResponse,
                      btnOkText: 'OK',
                      btnOkOnPress: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    );
                  },
                  onFailure: (context, state) {
                    LoadingDialog.hide(context);
                    CustomDialog.show(
                      context,
                      icon: Icons.warning,
                      dialogType: DialogType.danger,
                      title: state.failureResponse,
                      btnCancelText: 'OK',
                      btnCancelOnPress: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    );
                  },
                  child: Column(
                    children: [
                      CustomTextfield(
                        textFieldBloc: storeTempPinFormBloc!.merchantId,
                        labelText: 'Merchant ID',
                        hintText: 'Key-in Your Merchant ID at here',
                      ),
                      Space(
                        height: 10.0,
                      ),
                      const Text(
                        'The Temp PIN will be sent one-time only.',
                        style: TextStyle(
                          color: kRedColor,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          onPressed: isButtonDisabled
                              ? null
                              : () async {
                                  if (storeTempPinFormBloc!
                                      .merchantId.value.isNotEmpty) {
                                    // Disable the button after click
                                    setState(() {
                                      isButtonDisabled = true;
                                    });
                                    // Your button action
                                    storeTempPinFormBloc?.submit();
                                  }
                                  storeTempPinFormBloc!.merchantId.validate();
                                },
                          label: const Text(
                            'Send Temp PIN',
                          ),
                          backgroundColor: kGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                Space(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(252, 249, 240, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: const Icon(
                        Icons.error_outline,
                        color: Colors.yellow,
                      ),
                    ),
                    Space(
                      width: 20.0,
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NOTE:',
                            style: TextStyle(
                              color: kRedColor,
                            ),
                          ),
                          Text(
                            'Please login your account using this temporary PIN. Change your PIN number on your profile.',
                            style: TextStyle(
                              color: kRedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
