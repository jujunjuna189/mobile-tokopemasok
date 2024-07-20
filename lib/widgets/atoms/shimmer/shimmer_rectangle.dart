import 'package:flutter/material.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class ShimmerRectangle extends StatelessWidget {
  final double height;
  final double width;

  const ShimmerRectangle({super.key, this.height = 0, this.width = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: ThemeApp.color.mutedLight,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
