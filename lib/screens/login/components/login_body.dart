import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage('assets/images/logo.png'),
        ),
        Space(height: 80.0),
        CustomTextfield(
          controller: usernameController,
          labelText: 'Username',
          hintText: 'Username',
        ),
        Space(height: 10.0),
        CustomTextfield(
          password: true,
          controller: passwordController,
          obscureText: true,
          labelText: 'PIN',
          hintText: 'pin',
        ),
        Space(height: 50.0),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            onPressed: () {},
            label: const Text("Login",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ],
    );
  }
}
