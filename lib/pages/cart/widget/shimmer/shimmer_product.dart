import 'package:flutter/material.dart';
import 'package:tokopemasok/widgets/atoms/shimmer/shimmer_rectangle.dart';

class ShimmerProduct extends StatelessWidget {
  const ShimmerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: [
          ShimmerRectangle(
            width: double.infinity,
            height: 55,
          ),
        ],
      ),
    );
  }
}
