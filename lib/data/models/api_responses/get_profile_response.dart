import 'package:my_day/data/models/api_responses/base_response.dart';
import 'package:my_day/data/models/user.dart';

class GetProfileResponse extends BaseResponse<User, String> {
  GetProfileResponse._({
    required User data,
    required String message,
    required int statusCode,
  }) : super(
    data: data,
    message: message,
    statusCode: statusCode,
  );
  
  factory GetProfileResponse.fromJson(Map<String, dynamic> json) => GetProfileResponse._(
    data: User.fromJson(json['data']),
    message: json['message'], 
    statusCode: json['status'],
  );
}