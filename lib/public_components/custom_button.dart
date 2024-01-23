import 'package:app_merchant_saler/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? icon;
  final Widget? label;
  final Color? backgroundColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    this.icon = const SizedBox(),
    required this.label,
    this.backgroundColor = kPrimaryButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon!,
      label: label!,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: backgroundColor, // Text color of the button
        elevation: 1, // Elevation of the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Border radius
        ),
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 10.0), // Padding around the button content
      ),
    );
  }
}
