import 'package:flutter/material.dart';
import 'package:tokopemasok/routes/route_name.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/atoms/button/button.dart';
import 'package:tokopemasok/widgets/atoms/button/button_outline.dart';

class Prepare extends StatelessWidget {
  const Prepare({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/logo/logo_transparent.png',
              ),
            ),
          ),
          Text(
            "Selamat Datang di Tokopemasok",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ThemeApp.color.dark),
          ),
          const Text("Masuk akun atau jelajahi fitur menariknya"),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Button(
              text: "Masuk",
              minWidth: double.infinity,
              onPressed: () => Navigator.pushNamed(context, RouteName.LOGIN),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonOutline(
              text: "Jelajahi",
              minWidth: double.infinity,
              onPressed: () => Navigator.pushNamed(context, RouteName.BOARD),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
