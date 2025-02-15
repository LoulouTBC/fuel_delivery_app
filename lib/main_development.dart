import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel_delivery_app/core/DI/dependency_injection.dart';
import 'package:fuel_delivery_app/core/routing/app_routing.dart';
import 'package:fuel_delivery_app/fuel_go.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(
    FuelGo(
      appRouter: AppRouter(),
    ),
  );
}
