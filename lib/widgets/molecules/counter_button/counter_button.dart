import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    this.value = '0',
    this.unit = '',
    this.width = double.infinity,
    this.color,
    this.buttonTextColor,
    this.buttonColor,
    this.buttonSize = 15,
    this.onAdd,
    this.onMin,
  });

  final String value;
  final String unit;
  final double? width;
  final Color? color;
  final Color? buttonTextColor;
  final Color? buttonColor;
  final double? buttonSize;
  final Function()? onAdd;
  final Function()? onMin;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: width ?? 0.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: color ?? ThemeApp.color.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onMin,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: buttonColor ?? ThemeApp.color.secondary,
              ),
              child: Icon(
                Icons.remove,
                size: buttonSize,
                color: ThemeApp.color.white,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          RichText(
            text: TextSpan(
              style: ThemeApp.font.semiBold.copyWith(fontSize: 11.sp, color: ThemeApp.color.dark),
              children: [
                TextSpan(text: value),
                TextSpan(
                  text: unit,
                  style: ThemeApp.font.regular.copyWith(fontSize: 8.sp),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: onAdd,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: buttonColor ?? ThemeApp.color.secondary,
              ),
              child: Icon(
                Icons.add,
                size: buttonSize,
                color: ThemeApp.color.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
