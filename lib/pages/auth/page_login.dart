import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/pages/auth/bloc/bloc_login.dart';
import 'package:tokopemasok/routes/route_name.dart';
import 'package:tokopemasok/utils/theme/theme.dart';
import 'package:tokopemasok/widgets/atoms/arrow/arrow_back.dart';
import 'package:tokopemasok/widgets/atoms/button/button.dart';
import 'package:tokopemasok/widgets/atoms/button/button_outline.dart';
import 'package:tokopemasok/widgets/atoms/field/field_password.dart';
import 'package:tokopemasok/widgets/atoms/field/field_text.dart';

class PageLogin extends StatelessWidget {
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    BlocLogin blocLogin = context.read<BlocLogin>();

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
                  "Masuk ke aplikasi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ThemeApp.color.dark),
                ),
                Text(
                  "Tokopemasok",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ThemeApp.color.dark),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Alamat Email"),
                SizedBox(
                  height: 0.5.h,
                ),
                FieldText(
                  onChange: ((value) => blocLogin.onChangeAuth('email', value)),
                  placeHolder: 'contoh@gmail.com',
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                const Text("Kata Sandi"),
                SizedBox(
                  height: 0.5.h,
                ),
                FieldPassword(
                  onChange: ((value) => blocLogin.onChangeAuth('password', value)),
                  placeHolder: 'Masukan kata sandi',
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Lupa kata sandi?',
                      style: TextStyle(
                        color: ThemeApp.color.dark,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      'Reset kata sandi',
                      style: TextStyle(color: ThemeApp.color.primary, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Button(
                  text: "Masuk",
                  minWidth: double.infinity,
                  onPressed: () => blocLogin.onLogin(context),
                ),
                Center(
                  child: Text(
                    'Belum punya akun?',
                    style: TextStyle(
                      color: ThemeApp.color.dark,
                      fontSize: 12,
                    ),
                  ),
                ),
                ButtonOutline(
                  text: "Daftar Sekarang",
                  minWidth: double.infinity,
                  onPressed: () => Navigator.pushNamed(context, RouteName.REGISTER),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Divider(
                  color: ThemeApp.color.mutedLight,
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
