import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';
import 'package:tokopemasok/config/config.dart';
import 'package:tokopemasok/routes/route_generate.dart';
import 'package:tokopemasok/routes/route_name.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Config.easyLoading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String initial = RouteName.INITIAL;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [...RouteGenerate.pageProvider(context)],
        child: MaterialApp(
          title: const String.fromEnvironment("APP_NAME"),
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            scaffoldBackgroundColor: Colors.white,
            bottomSheetTheme: const BottomSheetThemeData(
              surfaceTintColor: Colors.white,
            ),
            useMaterial3: true,
          ),
          initialRoute: initial,
          onGenerateRoute: RouteGenerate.onRoute,
        ),
      );
    });
  }
}
