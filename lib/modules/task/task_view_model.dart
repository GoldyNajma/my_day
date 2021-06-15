import 'package:my_day/data/models/all_tasks.dart';
import 'package:my_day/data/models/request_body/create_new_task_request_body.dart';
import 'package:my_day/data/models/request_body/update_task_check_request_body.dart';
import 'package:my_day/data/models/task.dart';
import 'package:my_day/data/repositories/auth_repository.dart';
import 'package:my_day/data/repositories/task_repository.dart';

class TaskViewModel {
  AuthRepository _authRepository = AuthRepository.instance;
  TaskRepository _taskRepository = TaskRepository.instance;

  TaskViewModel._();

  static final instance = TaskViewModel._();

  final _repository = TaskRepository.instance;

  Future createNewTask(CreateNewTaskRequestBody requestBody) async =>
    await _repository.createNewTask(requestBody);

  Future<String> _readAuthorizationToken() async {
    return await _authRepository.readAuthorizationTokenFromLocal();
  }

  Future<AllTasks> getAllTasks(String authorizationToken) async {
    return await _taskRepository.getAllTasks(authorizationToken);
  }

  Future<List<Task>> getAllTasksAsList() async {
    try {
      AllTasks allTasks = await getAllTasks(await _readAuthorizationToken());

      return allTasks.toList();
    } catch (e) {
      return Future.error('$e');
    }
  }

  Future<String> updateCheckTask(int id, UpdateTaskCheckRequestBody requestBody) async {
    print('update check.....');
    try {
      String token = await _readAuthorizationToken();
      
      return await _repository.updateCheckTask(id, requestBody, token);
    } catch (e) {
      return Future.error('$e');
    }
  }
}