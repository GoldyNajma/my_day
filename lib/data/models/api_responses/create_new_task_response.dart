import 'base_response.dart';

class CreateNewTaskResponse extends BaseResponse<dynamic, String> {
  CreateNewTaskResponse({
    required int statusCode,
    required String message,
    required dynamic data
  }) : super(message: message, statusCode: statusCode, data: data);

  factory CreateNewTaskResponse.fromJson(Map<String, dynamic> json) =>
      CreateNewTaskResponse(
          statusCode: json['status'],
          message: json['message'], data: null);
}