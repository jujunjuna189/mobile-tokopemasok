import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tokopemasok/utils/theme/theme.dart';

class Config {
  static String appDate = '2023-01-01';
  static void easyLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = ThemeApp.color.white
      ..indicatorColor = ThemeApp.color.primary
      ..textColor = ThemeApp.color.primary
      ..maskColor = const Color.fromARGB(98, 6, 26, 59)
      ..textStyle = TextStyle(fontWeight: FontWeight.w700, color: ThemeApp.color.muted)
      ..maskType = EasyLoadingMaskType.custom;
  }
}
