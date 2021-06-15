import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_day/common/app_exceptions.dart';
import 'package:my_day/common/constants.dart' as constants;
import 'package:my_day/data/models/all_tasks.dart';
import 'package:my_day/data/models/api_responses/create_new_task_response.dart';
import 'package:my_day/data/models/api_responses/get_all_tasks_response.dart';
import 'package:my_day/data/models/request_body/create_new_task_request_body.dart';
import 'package:my_day/data/services/api_service.dart';

class TaskRemoteService {
  TaskRemoteService._();

  static final instance = TaskRemoteService._();

  final _apiService = ApiService.instance;

  Future createNewTask(CreateNewTaskRequestBody requestBody) async {
    final response = await _apiService.httpPost(
        endPoint: constants.tasksEndPoint, body: requestBody);

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

      if (response.statusCode == 200) {
        final createNewTaskResponse =
            CreateNewTaskResponse.fromJson(responseBody);

        return createNewTaskResponse.message;
      } else if (response.statusCode == 409) {
        throw InvalidInputException();
      } else {
        throw ServerException(response.reasonPhrase);
      }
    }
  }

  Future<AllTasks> getAllTasks(String authorizationToken) async {
    var response = await _apiService.httpGet(
      endPoint: constants.tasksEndPoint, 
      authorization: authorizationToken,
    );
    
    if (response is http.Response) {
      var responseBody;
      
      try {
        responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      } on FormatException {
        if (response.statusCode == 500) {
          throw ServerException(response.reasonPhrase);
        } else {
          throw NoDataException('Server returned no data. ${response.reasonPhrase}');
        }
      }

      if (response.statusCode == 200) {
        GetAllTasksResponse getAllTasksResponse = GetAllTasksResponse.fromJson(responseBody);

        return getAllTasksResponse.data!;
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
