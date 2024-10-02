import 'package:fuel_delivery_app/Features/login/data/model/login_request_body.dart';
import 'package:fuel_delivery_app/Features/login/data/model/login_response.dart';
import 'package:fuel_delivery_app/core/networking/api_error_handler.dart';
import 'package:fuel_delivery_app/core/networking/api_result.dart';
import 'package:fuel_delivery_app/core/networking/api_service.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
