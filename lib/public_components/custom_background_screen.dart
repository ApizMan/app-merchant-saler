import 'package:app_merchant_saler/constant.dart';
import 'package:flutter/material.dart';

class CustomBackgroundScreen extends StatelessWidget {
  final Widget child;
  const CustomBackgroundScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor,
              kPrimaryColor,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
