import 'package:my_day/data/models/authorization_token.dart';

import 'base_response.dart';

class SignInResponse extends BaseResponse<AuthorizationToken, String> {
  SignInResponse._({
    AuthorizationToken? data,
    required String message,
    required int statusCode,
  }) : super(
    data: data,
    message: message,
    statusCode: statusCode,
  );

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse._(
    data: json['data'] == null ? null : AuthorizationToken.fromJson(json['data']),
    message: json['message'],
    statusCode: json['status'],
  );
}