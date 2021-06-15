import 'package:my_day/data/models/all_tasks.dart';
import 'package:my_day/data/models/api_responses/base_response.dart';

class GetAllTasksResponse extends BaseResponse<AllTasks, String> {
  GetAllTasksResponse._({
    required AllTasks data,
    required String message,
    required int statusCode,
  }) : super(
    data: data,
    message: message,
    statusCode: statusCode,
  );
  
  factory GetAllTasksResponse.fromJson(Map<String, dynamic> json) => GetAllTasksResponse._(
    data: AllTasks.fromJson(json['data']),
    message: json['message'], 
    statusCode: json['status'],
  );
}