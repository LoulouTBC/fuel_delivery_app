import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_delivery_app/Features/signup/data/repos/signup_repo.dart';
import 'package:fuel_delivery_app/Features/signup/logic/cubit/signup_state.dart';

import '../../data/models/signup_request_body.dart';

class SignupCubit extends Cubit<SignUpState> {
  final SignUpRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignUpState.loading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(success: (signupResponse) {
      emit(SignUpState.success(signupResponse));
    }, failure: (error) {
      emit(SignUpState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}