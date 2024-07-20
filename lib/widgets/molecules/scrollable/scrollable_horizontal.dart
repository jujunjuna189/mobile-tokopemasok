import 'package:flutter/material.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class ScrollableHorizontal extends StatelessWidget {
  const ScrollableHorizontal(
      {super.key, this.width = 0, this.height = 0, this.indicatorWidth = 0, this.percentage = 0});

  final double width;
  final double height;
  final double indicatorWidth;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(color: ThemeApp.color.mutedLight, borderRadius: BorderRadius.circular(10)),
            ),
            Positioned(
              left: (percentage / 100) * (width - indicatorWidth),
              child: Container(
                width: indicatorWidth,
                height: height,
                decoration: BoxDecoration(color: ThemeApp.color.primary, borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
