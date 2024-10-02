import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_delivery_app/Features/login/logic/cubit/login_cubit.dart';
import 'package:fuel_delivery_app/Features/login/ui/login_screen.dart';
import 'package:fuel_delivery_app/core/DI/dependency_injection.dart';
import 'package:fuel_delivery_app/core/routing/routes.dart';

import '../../Features/home/ui/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      // case Routes.signUpScreen:
      //   return MaterialPageRoute(builder: (_) => SignUpScreen());

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
