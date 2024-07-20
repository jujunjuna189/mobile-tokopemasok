import 'package:flutter/material.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class EmptyProduct extends StatelessWidget {
  const EmptyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          "Tidak Ada Data",
          style: ThemeApp.font.medium.copyWith(fontSize: 16, color: ThemeApp.color.mutedLight),
        ),
        Text(
          "Produk Tidak Tersedia",
          style: ThemeApp.font.medium.copyWith(fontSize: 12, color: ThemeApp.color.mutedLight),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
