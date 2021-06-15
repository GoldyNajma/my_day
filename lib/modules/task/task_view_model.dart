import 'package:my_day/data/models/request_body/create_new_task_request_body.dart';
import 'package:my_day/data/repositories/task_repository.dart';

class TaskViewModel {
  TaskViewModel._();

  static final instance = TaskViewModel._();

  final _repository = TaskRepository.instance;

  Future createNewTask(CreateNewTaskRequestBody requestBody) async =>
    await _repository.createNewTask(requestBody);

}