import 'package:flutter/material.dart';
import 'package:tokopemasok/routes/route_name.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/atoms/button/button.dart';

class ScreenNoAuth extends StatelessWidget {
  const ScreenNoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Masuk Dengan Akun?",
                  style: ThemeApp.font.bold.copyWith(fontSize: 18),
                ),
                Text(
                  "Fitur belum tersedia, fitur akan terbuka saat anda masuk dengan akun",
                  textAlign: TextAlign.center,
                  style: ThemeApp.font.regular.copyWith(color: ThemeApp.color.muted),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      text: "Masuk Akun",
                      paddingTop: 8,
                      paddingBottom: 8,
                      onPressed: () => Navigator.of(context).pushNamed(RouteName.LOGIN),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
