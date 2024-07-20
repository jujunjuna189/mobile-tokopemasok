import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {required this.mobile,
      required this.tablet,
      required this.desktop,
      super.key});

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static bool isMobile(BuildContext context) =>
      SizerUtil.deviceType == DeviceType.mobile &&
      SizerUtil.deviceType != DeviceType.tablet;

  static bool isTablet(BuildContext context) =>
      SizerUtil.deviceType != DeviceType.mobile &&
      SizerUtil.deviceType == DeviceType.tablet;

  static bool isDesktop(BuildContext context) =>
      SizerUtil.deviceType != DeviceType.mobile &&
      SizerUtil.deviceType != DeviceType.tablet;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          debugPrint("isMobile: ${isMobile(context)}");
          debugPrint("isTablet: ${isTablet(context)}");
          debugPrint("isDesktop: ${isDesktop(context)}");

          // if (isTablet(context)) {
          //   SystemChrome.setPreferredOrientations([
          //     DeviceOrientation.landscapeLeft,
          //     DeviceOrientation.landscapeRight,
          //   ]);
          // }

          return isDesktop(context)
              ? desktop
              : isTablet(context)
                  ? tablet
                  : mobile;
        },
      );
}
