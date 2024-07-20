import 'package:flutter/material.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class ButtonRounded extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final Widget? content;
  final Color? textColor;
  final Color? color;
  const ButtonRounded({Key? key, this.onPressed, this.text, this.content, this.textColor, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? ThemeApp.color.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: content ??
          Text(
            text ?? "",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor ?? ThemeApp.color.white,
            ),
          ),
    );
  }
}
