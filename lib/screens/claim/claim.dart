import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/resources/resources.dart';
import 'package:app_merchant_saler/screens/claim/components/claim_body.dart';
import 'package:app_merchant_saler/screens/screens.dart';
import 'package:flutter/material.dart';

class Claim extends StatefulWidget {
  const Claim({super.key});

  @override
  State<Claim> createState() => _ClaimState();
}

class _ClaimState extends State<Claim> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DashboardResources.merchantRedeemed(prefix: 'merchant-redeemed'),
      builder: (context, redeem) {
        if (redeem.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: LoadingDialog(),
          );
        } else if (redeem.hasError) {
          return Text('Error: ${redeem.error}');
        } else {
          List<dynamic> redeemedList = redeem.data['merchant_redeemed'];
          return Scaffold(
            appBar: _buildAppBar(context),
            body: CustomBackgroundScreen(
              child: ClaimBody(redeemedList: redeemedList),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PdfPage(
                            redeemedList: redeemedList,
                          ),
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
      },
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
