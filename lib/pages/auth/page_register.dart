import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/routes/route_name.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/atoms/arrow/arrow_back.dart';
import 'package:tokopemasok/widgets/atoms/button/button.dart';
import 'package:tokopemasok/widgets/atoms/field/field_password.dart';
import 'package:tokopemasok/widgets/atoms/field/field_text.dart';

class PageRegister extends StatelessWidget {
  const PageRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const ArrowBack(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daftar Tokopemasok",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ThemeApp.color.dark),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Nama Lengkap"),
                SizedBox(
                  height: 0.5.h,
                ),
                const FieldText(
                  placeHolder: 'Masukan Nama Lenkap',
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                const Text("Alamat Email"),
                SizedBox(
                  height: 0.5.h,
                ),
                const FieldText(
                  placeHolder: 'contoh@gmail.com',
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                const Text("Kata Sandi"),
                SizedBox(
                  height: 0.5.h,
                ),
                const FieldPassword(
                  placeHolder: 'Masukan kata sandi',
                ),
                SizedBox(
                  height: 3.h,
                ),
                Button(
                  text: "Daftar Sekarang",
                  minWidth: double.infinity,
                  onPressed: () => Navigator.pushNamed(context, RouteName.BOARD),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Divider(
                  color: ThemeApp.color.light,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Butuh bantuan?',
                      style: TextStyle(
                        color: ThemeApp.color.dark,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      'Hubungi kami di',
                      style: TextStyle(
                        color: ThemeApp.color.dark,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      'Layanan Pelanggan',
                      style: TextStyle(
                        color: ThemeApp.color.primary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
