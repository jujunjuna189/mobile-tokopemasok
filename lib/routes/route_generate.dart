import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokopemasok/pages/auth/bloc/bloc_login.dart';
import 'package:tokopemasok/pages/auth/bloc/bloc_register.dart';
import 'package:tokopemasok/pages/auth/page_login.dart';
import 'package:tokopemasok/pages/auth/page_register.dart';
import 'package:tokopemasok/pages/board/bloc/bloc_board.dart';
import 'package:tokopemasok/pages/board/page_board.dart';
import 'package:tokopemasok/pages/onboarding/bloc/bloc_onboarding.dart';
import 'package:tokopemasok/pages/onboarding/page_onboarding.dart';
import 'package:tokopemasok/pages/cart/bloc/bloc_cart.dart';
import 'package:tokopemasok/pages/cart/page_cart.dart';
import 'package:tokopemasok/pages/order/bloc/bloc_order.dart';
import 'package:tokopemasok/pages/order/page_order.dart';
import 'package:tokopemasok/routes/route_name.dart';

class RouteGenerate {
  static Route onRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteName.INITIAL:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => BlocOnboarding(),
            child: const PageOnboarding(),
          ),
        );
      case RouteName.LOGIN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => BlocLogin(),
            child: const PageLogin(),
          ),
        );
      case RouteName.REGISTER:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => BlocRegister(),
            child: const PageRegister(),
          ),
        );
      case RouteName.BOARD:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => BlocBoard(),
            child: const PageBoard(),
          ),
        );
      case RouteName.CART:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => BlocCart(),
            child: const PageCart(),
          ),
        );
      case RouteName.ORDER:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => BlocOrder(arguments: args is String ? args : ""),
            child: const PageOrder(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => _errorRoute());
    }
  }

  static List<dynamic> pageProvider(BuildContext context) {
    List<dynamic> providers = [
      // initial onboading provider
      BlocProvider(create: (context) => BlocOnboarding()),
      // initial main provider
      BlocProvider(create: (context) => BlocBoard()),
    ];

    return providers;
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  }
}
