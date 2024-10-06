import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel_delivery_app/core/routing/routes.dart';
import 'package:fuel_delivery_app/core/theming/colors.dart';

import 'core/routing/app_routing.dart';

class FuelGo extends StatelessWidget {
  const FuelGo({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Doc App',
          theme: ThemeData(
            primaryColor: ColorsManager.mainBlue,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.signUpScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
