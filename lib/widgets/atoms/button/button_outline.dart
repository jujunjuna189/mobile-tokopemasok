import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class ButtonOutline extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;
  final double? minWidth;
  final double? minHeight;
  const ButtonOutline(
      {Key? key,
      this.onPressed,
      required this.text,
      this.textColor,
      this.color,
      this.borderColor,
      this.paddingLeft,
      this.paddingRight,
      this.paddingTop,
      this.paddingBottom,
      this.minWidth,
      this.minHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (() {
          onPressed!();
        }),
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.transparent,
          elevation: 0,
          minimumSize: Size(minWidth ?? 0, minHeight ?? 20),
          padding: EdgeInsets.only(
              left: paddingLeft ?? 2.h,
              right: paddingRight ?? 2.h,
              top: paddingTop ?? 1.5.h,
              bottom: paddingBottom ?? 1.5.h),
          side: BorderSide(width: 1, color: borderColor ?? ThemeApp.color.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textColor ?? ThemeApp.color.primary),
        ));
  }
}
