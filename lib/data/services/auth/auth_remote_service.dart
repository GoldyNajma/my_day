import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_day/common/app_exceptions.dart';
import 'package:my_day/common/constants.dart' as constants;
import 'package:my_day/data/models/api_responses/sign_in_response.dart';
import 'package:my_day/data/models/authorization_token.dart';
import 'package:my_day/data/services/api_service.dart';
import 'package:my_day/data/models/api_responses/sign_up_response.dart';
import 'package:my_day/data/models/request_body/sign_in_request_body.dart';
import 'package:my_day/data/models/request_body/sign_up_request_body.dart';

class AuthRemoteService {
  static final AuthRemoteService instance = AuthRemoteService._();
  final ApiService _apiService = ApiService.instance;

  AuthRemoteService._();

  Future<String> signUp(SignUpRequestBody requestBody) async {
    var response = await _apiService.httpPost(
      endPoint: constants.signUpEndPoint, 
      body: requestBody,
    );
    
    if (response is http.Response) {
      var responseBody;
      
      try {
        responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      } on FormatException {
        if (response.statusCode == 500) {
          throw ServerException('Possible reason: email already registered.');
        } else {
          throw NoDataException('Server returned no data');
        }
      }

      if (response.statusCode == 200) {
        SignUpResponse signUpResponse = SignUpResponse.fromJson(responseBody);

        return signUpResponse.message;
      } else if (response.statusCode == 409) {
        throw InvalidInputException();
      } else {
        throw ServerException(response.reasonPhrase);
      }
    } else if (response is String && response == constants.noInternetConnectionError) {
      throw NoInternetException();
    } else {
      throw UnexpectedErrorException();
    }
  }

  Future<AuthorizationToken> signIn(SignInRequestBody requestBody) async {
    var response = await _apiService.httpPost(
      endPoint: constants.signInEndPoint, 
      body: requestBody,
    );
    
    if (response is http.Response) {
      var responseBody;
      
      try {
        responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      } on FormatException {
        if (response.statusCode == 500) {
          throw ServerException();
        } else {
          throw NoDataException('Server returned no data');
        }
      }

      if (response.statusCode == 200 || response.statusCode == 401) {
        SignInResponse signInResponse = SignInResponse.fromJson(responseBody);

        if (signInResponse.statusCode == 200) {
          return signInResponse.data!;
        } else {
          throw UnauthorizedException(signInResponse.message);
        }
      } else if (response.statusCode == 409) {
        throw InvalidInputException();
      } else {
        throw ServerException(response.reasonPhrase);
      }
    } else if (response is String && response == constants.noInternetConnectionError) {
      throw NoInternetException();
    } else {
      throw UnexpectedErrorException();
    }
  }
}