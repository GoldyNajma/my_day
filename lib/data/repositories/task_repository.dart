import 'package:my_day/data/models/request_body/create_new_task_request_body.dart';
import 'package:my_day/data/services/task_remote_service.dart';

class TaskRepository {
  TaskRepository._();

  static final instance = TaskRepository._();

  final _service = TaskRemoteService.instance;

  Future createNewTask(CreateNewTaskRequestBody requestBody) async {
    try {
      return await _service.createNewTask(requestBody);
    } catch (e) {
      return Future.error(e);
    }
  }
}