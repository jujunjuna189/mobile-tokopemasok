import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class ArrowBack extends StatelessWidget {
  final String? title;
  final Color? color;

  const ArrowBack({Key? key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        ModalRoute.of(context)!.isFirst ? exit(0) : Navigator.of(context).pop();
      }),
      child: Padding(
        padding: EdgeInsets.only(bottom: 2.5.w, top: 2.5.w, left: 2.5.w, right: 2.5.w),
        child: Row(
          children: [
            Transform.flip(
              child: Icon(
                Icons.arrow_back,
                color: color ?? ThemeApp.color.dark,
                size: 12.sp,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              title ?? "",
              style: TextStyle(color: color ?? ThemeApp.color.dark, fontSize: 11.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
