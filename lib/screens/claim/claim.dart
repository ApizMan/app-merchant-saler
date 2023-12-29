import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/screens/claim/components/claim_body.dart';
import 'package:app_merchant_saler/screens/screens.dart';
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PdfPage(),
                  ),
                );
              },
              backgroundColor: kPrimaryButtonColor,
              label: const Text(
                "Download Report",
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
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
