import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_delivery_app/Features/signup/data/repos/signup_repo.dart';
import 'package:fuel_delivery_app/Features/signup/logic/cubit/signup_state.dart';
import 'package:fuel_delivery_app/core/networking/api_error_model.dart';

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
      // emit(SignUpState.error(error: error.apiErrorModel.data.email ?? ''));
      emit(SignUpState.error(error: _collectFieldErrors(error.apiErrorModel.data!)));
    });
  }

  String _collectFieldErrors(ErrorData errorData) {
  // List to hold all field error messages
  List<String> errorMessages = [];

  // Check if the name field has errors and add them
  if (errorData.name != null && errorData.name!.isNotEmpty) {
    errorMessages.add("Name: ${errorData.name!.join(', ')}");
  }

  // Check if the phone field has errors and add them
  if (errorData.phone != null && errorData.phone!.isNotEmpty) {
    errorMessages.add("Phone: ${errorData.phone!.join(', ')}");
  }

  // Check if the gender field has errors and add them
  if (errorData.gender != null && errorData.gender!.isNotEmpty) {
    errorMessages.add("Gender: ${errorData.gender!.join(', ')}");
  }

  // Check if the password field has errors and add them
  if (errorData.password != null && errorData.password!.isNotEmpty) {
    errorMessages.add("Password: ${errorData.password!.join(', ')}");
  }

  // Check if the email field has errors and add them
  if (errorData.email != null && errorData.email!.isNotEmpty) {
    errorMessages.add("Email: ${errorData.email!.join(', ')}");
  }

  // Join all collected errors into a single string
  return errorMessages.isNotEmpty ? errorMessages.join('\n') : 'Unknown error';
}
}