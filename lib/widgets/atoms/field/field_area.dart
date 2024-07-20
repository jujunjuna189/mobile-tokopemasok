import 'package:flutter/material.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class FieldArea extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChange;
  final Color? color;
  final EdgeInsets? padding;
  final String? placeHolder;
  final bool border;
  final Color? borderColor;
  final int maxLines;
  const FieldArea({
    Key? key,
    this.controller,
    this.onChange,
    this.color,
    this.padding,
    this.placeHolder,
    this.border = true,
    this.borderColor,
    this.maxLines = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: color ?? ThemeApp.color.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(width: 1, color: borderColor ?? ThemeApp.color.primary)),
      child: TextField(
        controller: controller,
        onChanged: ((value) => onChange!(value)),
        maxLines: maxLines,
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: placeHolder ?? '',
          hintStyle: TextStyle(fontSize: 12, color: ThemeApp.color.mutedLight),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
