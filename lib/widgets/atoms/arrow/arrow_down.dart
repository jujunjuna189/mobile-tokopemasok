import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class ArrowDown extends StatelessWidget {
  final String? title;
  final Color? color;

  const ArrowDown({Key? key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).pop();
      }),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: ThemeApp.color.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: color ?? ThemeApp.color.white,
              size: 15.sp,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 2.w,
                ),
                Flexible(
                  child: Text(
                    title ?? "",
                    style: ThemeApp.font.semiBold.copyWith(color: color ?? ThemeApp.color.primary, fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
    );
  }
}
