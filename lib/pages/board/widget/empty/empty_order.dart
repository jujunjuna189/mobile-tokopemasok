import 'package:flutter/material.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({super.key, this.text = ''});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 5, top: 15, left: 15, right: 15),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: ThemeApp.color.mutedLight),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tidak ada data $text",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "Data $text belum ada!",
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
                  color: ThemeApp.color.muted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
