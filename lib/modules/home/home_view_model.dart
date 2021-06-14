import 'package:my_day/data/models/user.dart';
import 'package:my_day/data/repositories/auth_repository.dart';
import 'package:my_day/data/repositories/user_repository.dart';

class HomeViewModel {
  static final HomeViewModel instance = HomeViewModel._();
  final UserRepository _userRepository = UserRepository.instance;
  final AuthRepository _authRepository = AuthRepository.instance;

  HomeViewModel._();

  Future<User> _getProfile() async {
    print('Getting profile from remote');
    return await _userRepository.getProfile(await readAuthorizationToken());
  }

  Future<void> _saveUserToLocal(User user) async {
    return await _userRepository.saveUserToLocal(user);
  }

  Future<User> _getUserFromLocal() async {
    print('Getting user from local');
    return await _userRepository.getUserFromLocal();
  }

  Future<String> readAuthorizationToken() async {
    return await _authRepository.readAuthorizationTokenFromLocal();
  }

  Future<User> getUserProfile() async {
    try {
      return await _getUserFromLocal();
    } catch (e) {
      try {
        User user = await _getProfile();

        _saveUserToLocal(user);
        
        return user;
      } catch (e) {
        return Future.error('$e');
      }
    }
  }

  Future<String> signOut() async {
    try {
      String message = await _authRepository.signOut(await readAuthorizationToken());
      
      await _authRepository.removeAuthorizationTokenFromLocal();
      await _userRepository.removeUserFromLocal();

      return message;
    } catch (e) {
      return Future.error('$e');
    }
  }
}