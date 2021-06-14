import 'package:my_day/data/models/user.dart';
import 'package:my_day/data/services/user/user_local_service.dart';
import 'package:my_day/data/services/user/user_remote_service.dart';

class UserRepository {
  static final UserRepository instance = UserRepository._();
  UserRemoteService _userRemoteService = UserRemoteService.instance;
  UserLocalService _userLocalService = UserLocalService.instance;

  UserRepository._();

  Future<User> getProfile(String authorizationToken) async {
    try {
      return await _userRemoteService.getProfile(authorizationToken);
    } catch (e) {
      return Future.error('$e');
    }
  }

  Future<User> getUserFromLocal() async {
    try {
      return await _userLocalService.readUser();
    } catch (e) {
      return Future.error('$e');
    } 
  }

  Future<void> saveUserToLocal(User user) async {
    try {
      return await _userLocalService.saveUser(user);
    } catch (e) {
      return Future.error('$e');
    }
  }

  Future<void> removeUserFromLocal() async {
    try {
      return await _userLocalService.removeUser();
    } catch (e) {
      return Future.error('$e');
    }
  }
}