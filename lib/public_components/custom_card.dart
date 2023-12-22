import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final double? height, width;
  final Widget data, value;
  const CustomCard({
    super.key,
    required this.color,
    this.height,
    this.width,
    required this.data,
    this.value = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: data),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: value,
              ),
            )
          ],
        ),
      ),
    );
  }
}
