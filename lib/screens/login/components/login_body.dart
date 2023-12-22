import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/form_bloc/login/store_login_form_bloc.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  StoreLoginFormBloc? storeLoginFormBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreLoginFormBloc(),
      child: Builder(builder: (context) {
        storeLoginFormBloc = BlocProvider.of<StoreLoginFormBloc>(context);
        return FormBlocListener<StoreLoginFormBloc, String, String>(
          onSubmitting: (context, state) {
            LoadingDialog.show(context);
          },
          onSubmissionFailed: (context, state) => LoadingDialog.hide(context),
          onSuccess: (context, state) {
            LoadingDialog.hide(context);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Dashboard()));
            Fluttertoast.showToast(
              msg: state.successResponse!,
              fontSize: 14,
            );
          },
          onFailure: (context, state) {
            LoadingDialog.hide(context);
            Fluttertoast.showToast(
              msg: 'Username/Pin is wrong',
              fontSize: 14,
            );
          },
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/logo.png'),
              ),
              Space(height: 50.0),
              CustomTextfield(
                textFieldBloc: storeLoginFormBloc!.username,
                labelText: 'Username',
                hintText: 'Key-in your Username here',
              ),
              CustomTextfield(
                password: true,
                textFieldBloc: storeLoginFormBloc!.pin,
                obscureText: true,
                labelText: 'PIN',
                hintText: 'Key-in your PIN here',
              ),
              Space(height: 50.0),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {
                    storeLoginFormBloc?.submit();
                  },
                  label: const Text("Login",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
