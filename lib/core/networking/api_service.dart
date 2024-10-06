import 'package:fuel_delivery_app/Features/login/data/model/login_request_body.dart';
import 'package:fuel_delivery_app/Features/login/data/model/login_response.dart';
import 'package:fuel_delivery_app/Features/signup/data/models/signup_request_body.dart';
import 'package:fuel_delivery_app/Features/signup/data/models/signup_response_body.dart';
import 'package:fuel_delivery_app/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginString)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @POST(ApiConstants.signUpString)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
}
