import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class HelpAdmin extends StatelessWidget {
  const HelpAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
        color: ThemeApp.color.light,
      ),
      child: Row(
        children: [
          Icon(
            Icons.headphones_outlined,
            color: ThemeApp.color.dark,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pusat",
                style: TextStyle(color: ThemeApp.color.dark, fontSize: 5.sp),
              ),
              Text(
                "Bantuan",
                style: TextStyle(color: ThemeApp.color.dark, fontSize: 5.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
