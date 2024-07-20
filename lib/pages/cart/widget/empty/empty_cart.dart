import 'package:flutter/material.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/atoms/arrow/arrow_back.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const ArrowBack(
              title: 'Pesanan',
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pesanan Belum Ada!!",
                        style: ThemeApp.font.bold.copyWith(fontSize: 18),
                      ),
                      Text(
                        "Pesanan masih kosong, Pilih produk kebutuhan anda tekan dan pesan",
                        textAlign: TextAlign.center,
                        style: ThemeApp.font.regular.copyWith(fontSize: 11, color: ThemeApp.color.muted),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
