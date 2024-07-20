import 'package:flutter/material.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class FieldSearch extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChange;
  final double? padding;
  final String? placeHolder;
  final bool border;
  const FieldSearch({Key? key, this.controller, this.onChange, this.padding, this.placeHolder, this.border = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: padding ?? 7),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        onChanged: ((value) => onChange != null ? onChange!(value) : {}),
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: placeHolder ?? '',
          hintStyle: ThemeApp.font.regular,
          contentPadding: const EdgeInsets.all(0),
          isDense: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.transparent,
          prefix: const Padding(padding: EdgeInsets.all(0)),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
