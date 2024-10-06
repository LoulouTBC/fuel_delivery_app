import 'package:fuel_delivery_app/Features/signup/data/models/signup_request_body.dart';
import 'package:fuel_delivery_app/Features/signup/data/models/signup_response_body.dart';
import 'package:fuel_delivery_app/core/networking/api_error_handler.dart';
import 'package:fuel_delivery_app/core/networking/api_result.dart';
import 'package:fuel_delivery_app/core/networking/api_service.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
