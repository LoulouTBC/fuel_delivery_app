import 'package:flutter/material.dart';
import 'package:fuel_delivery_app/core/DI/dependency_injection.dart';
import 'package:fuel_delivery_app/core/routing/app_routing.dart';
import 'package:fuel_delivery_app/fuel_go.dart';

void main() {
  setupGetIt();
  runApp(
    FuelGo(
      appRouter: AppRouter(),
    ),
  );
}
