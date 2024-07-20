import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/widgets/atoms/shimmer/shimmer_rectangle.dart';

class ShimmerProduct extends StatelessWidget {
  const ShimmerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
      ),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 2, bottom: 4),
            child: SizedBox(
              width: 47.w,
              child: ShimmerRectangle(
                width: double.infinity,
                height: 28.h,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 2, bottom: 4),
            child: SizedBox(
              width: 47.w,
              child: ShimmerRectangle(
                width: double.infinity,
                height: 28.h,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 2, bottom: 4),
            child: SizedBox(
              width: 47.w,
              child: ShimmerRectangle(
                width: double.infinity,
                height: 28.h,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 2, bottom: 4),
            child: SizedBox(
              width: 47.w,
              child: ShimmerRectangle(
                width: double.infinity,
                height: 28.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
