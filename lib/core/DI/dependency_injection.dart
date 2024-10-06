import 'package:dio/dio.dart';
import 'package:fuel_delivery_app/Features/login/data/repos/login_repo.dart';
import 'package:fuel_delivery_app/Features/login/logic/cubit/login_cubit.dart';
import 'package:fuel_delivery_app/Features/signup/data/repos/signup_repo.dart';
import 'package:fuel_delivery_app/Features/signup/logic/cubit/signup_cubit.dart';
import 'package:fuel_delivery_app/core/networking/api_service.dart';
import 'package:fuel_delivery_app/core/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & Api service
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  //signup
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerLazySingleton<SignupCubit>(() => SignupCubit(getIt()));
}
