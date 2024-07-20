import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/widgets/atoms/shimmer/shimmer_rectangle.dart';

class ShimmerInformationOrder extends StatelessWidget {
  const ShimmerInformationOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerRectangle(
            width: 25.w,
            height: 10,
          ),
          const SizedBox(
            height: 2,
          ),
          const ShimmerRectangle(
            width: double.infinity,
            height: 10,
          ),
          const SizedBox(
            height: 5,
          ),
          ShimmerRectangle(
            width: 25.w,
            height: 10,
          ),
          const SizedBox(
            height: 2,
          ),
          const ShimmerRectangle(
            width: double.infinity,
            height: 10,
          ),
        ],
      ),
    );
  }
}
