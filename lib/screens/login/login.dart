import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/screens/forgot_username_pin/forgot_username_pin.dart';
import 'package:app_merchant_saler/screens/login/components/login_body.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundScreen(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LoginBody(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgotUsernamePin()));
                  },
                  child: const Text(
                    "Forgot Username/PIN?",
                    style: TextStyle(
                      color: kPrimaryButtonColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}