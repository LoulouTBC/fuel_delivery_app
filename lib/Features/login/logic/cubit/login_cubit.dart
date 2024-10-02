import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_delivery_app/Features/login/data/model/login_request_body.dart';
import 'package:fuel_delivery_app/Features/login/data/model/login_response.dart';
import 'package:fuel_delivery_app/Features/login/data/repos/login_repo.dart';
import 'package:fuel_delivery_app/Features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);

    response.when(success: (LoginResponse) {
      emit(LoginState.success(LoginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
