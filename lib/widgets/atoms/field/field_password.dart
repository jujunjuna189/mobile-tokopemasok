import 'package:flutter/material.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class FieldPassword extends StatefulWidget {
  final TextEditingController? controller;
  final Function? onChange;
  final String? placeHolder;

  const FieldPassword({Key? key, this.controller, this.placeHolder, this.onChange}) : super(key: key);

  @override
  State<FieldPassword> createState() => _FieldPasswordState();
}

class _FieldPasswordState extends State<FieldPassword> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: ((value) => widget.onChange != null ? widget.onChange!(value) : {}),
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isObscure,
        enableSuggestions: false,
        autocorrect: false,
        style: ThemeApp.font.regular.copyWith(fontSize: 12),
        decoration: InputDecoration(
          hintText: widget.placeHolder ?? '',
          hintStyle: ThemeApp.font.regular.copyWith(fontSize: 12, color: ThemeApp.color.muted),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: ThemeApp.color.white,
          suffixIcon: GestureDetector(
              onTap: (() {
                setState(() {
                  _isObscure = _isObscure ? false : true;
                });
              }),
              child: _isObscure
                  ? Icon(
                      Icons.visibility_off,
                      size: 20,
                      color: ThemeApp.color.primary,
                    )
                  : Icon(
                      Icons.visibility,
                      size: 20,
                      color: ThemeApp.color.primary,
                    )),
        ),
      ),
    );
  }
}
