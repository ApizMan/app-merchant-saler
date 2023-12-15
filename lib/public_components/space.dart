import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class Space extends StatelessWidget {
  double? height, width;

  Space({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
