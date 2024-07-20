import 'package:flutter/material.dart';
import 'package:tokopemasok/widgets/atoms/shimmer/shimmer_rectangle.dart';

class ShimmerOrder extends StatelessWidget {
  const ShimmerOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: Column(
        children: [
          ShimmerRectangle(
            width: double.infinity,
            height: 60,
          ),
          SizedBox(
            height: 5,
          ),
          ShimmerRectangle(
            width: double.infinity,
            height: 60,
          ),
          SizedBox(
            height: 5,
          ),
          ShimmerRectangle(
            width: double.infinity,
            height: 60,
          ),
        ],
      ),
    );
  }
}
