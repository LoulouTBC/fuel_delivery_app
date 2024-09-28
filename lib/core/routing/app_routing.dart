import 'package:flutter/material.dart';
import 'package:fuel_delivery_app/Features/login/ui/login_screen.dart';
import 'package:fuel_delivery_app/core/routing/routes.dart';

import '../../Features/home/ui/home_screen.dart';

class AppRouting {
  Route generteRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
