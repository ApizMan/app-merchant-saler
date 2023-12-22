import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/screens/claim/components/claim_body.dart';
import 'package:flutter/material.dart';

class Claim extends StatelessWidget {
  const Claim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const CustomBackgroundScreen(
        child: ClaimBody(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: const Text(
        'Claim',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
