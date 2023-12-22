import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/screens/forgot_username_pin/components/forgot_username_pin_body.dart';
import 'package:flutter/material.dart';

class ForgotUsernamePin extends StatelessWidget {
  const ForgotUsernamePin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const CustomBackgroundScreen(
        child: ForgotUsernamePinBody(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: const Text(
        'Forgot Username/ID',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
