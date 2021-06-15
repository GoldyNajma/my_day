import 'dart:convert';

import 'package:my_day/common/app_exceptions.dart';
import 'package:my_day/data/models/user.dart';
import 'package:my_day/data/services/local_service.dart';

class UserLocalService {
  final String _userKey = 'my_day_user';
  final LocalService _localService = LocalService.instance;

  static final UserLocalService instance = UserLocalService._();

  UserLocalService._();

  Future<void> saveUser(User user) async {
    String userJsonString = jsonEncode(user.toJson());
    bool success = await _localService.setString(_userKey, userJsonString);

    if (!success) {
      throw CacheException('Failed to cache user');
    }
  }

  Future<void> removeUser() async {
    bool success = await _localService.remove(_userKey);

    if (!success) {
      throw RemoveDataException('Failed to remove cached user');
    }
  }

  Future<User> readUser() async {
    try {
      String? userJsonString = await _localService.getString(_userKey);

      if (userJsonString == null) {
        throw NoDataException();
      } else {
        return User.fromJson(jsonDecode(userJsonString));
      }
    } catch (e) {
      if (e is NoDataException) {
        throw e;
      }
      throw UnexpectedErrorException();
    }
  }
}