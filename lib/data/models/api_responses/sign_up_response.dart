import 'base_response.dart';

class SignUpResponse extends BaseResponse<dynamic, String> {
  SignUpResponse._({
    dynamic data,
    required String message,
    required int statusCode,
  }) : super(
    data: data,
    message: message,
    statusCode: statusCode,
  );

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse._(
    data: json['data'],
    message: json['message'],
    statusCode: json['status'],
  );
}