import 'package:flutter/material.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class FieldText extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChange;
  final double? padding;
  final String? placeHolder;
  final bool border;
  const FieldText({Key? key, this.controller, this.onChange, this.padding, this.placeHolder, this.border = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: const BoxConstraints(minHeight: 10),
      child: TextField(
        controller: controller,
        onChanged: ((value) => onChange != null ? onChange!(value) : {}),
        keyboardType: TextInputType.text,
        style: ThemeApp.font.regular.copyWith(fontSize: 12),
        decoration: InputDecoration(
          hintText: placeHolder ?? '',
          hintStyle: ThemeApp.font.regular.copyWith(fontSize: 12, color: ThemeApp.color.muted),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: ThemeApp.color.white,
        ),
      ),
    );
  }
}
