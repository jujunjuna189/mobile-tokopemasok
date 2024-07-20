import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class Button extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color? textColor;
  final Color? color;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;
  final double? minWidth;
  const Button(
      {Key? key,
      this.onPressed,
      required this.text,
      this.textColor,
      this.color,
      this.paddingLeft,
      this.paddingRight,
      this.paddingTop,
      this.paddingBottom,
      this.minWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? ThemeApp.color.primary,
          elevation: 0,
          minimumSize: Size(minWidth ?? 0, 20),
          padding: EdgeInsets.only(
              left: paddingLeft ?? 2.h,
              right: paddingRight ?? 2.h,
              top: paddingTop ?? 1.5.h,
              bottom: paddingBottom ?? 1.5.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textColor ?? ThemeApp.color.white),
        ));
  }
}
