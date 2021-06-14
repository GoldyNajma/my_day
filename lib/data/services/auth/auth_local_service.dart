import 'package:my_day/common/app_exceptions.dart';
import 'package:my_day/data/services/local_service.dart';

class AuthLocalService {
  final String _authorizationTokenKey = 'my_day_authorization_token';
  final LocalService _localService = LocalService.instance;

  static final AuthLocalService instance = AuthLocalService._();

  AuthLocalService._();

  Future<void> setAuthorizationToken(String authorizationToken) async {
    bool success = await _localService.setString(_authorizationTokenKey, authorizationToken);

    if (!success) {
      throw CacheException('Failed to cache authorization token');
    }
  }

  Future<String> getAuthorizationToken() async {
    try {
      String? authorizationToken = 
        await _localService.getString(_authorizationTokenKey);

      if (authorizationToken == null) {
        throw NoDataException();
      } else {
        return authorizationToken;
      }
    } on NoDataException {
      throw UnauthorizedException();
    } catch (e) {
      throw UnexpectedErrorException();
    }
  }

  Future<void> removeAuthorizationToken() async {
    bool success = await _localService.remove(_authorizationTokenKey);

    if (!success) {
      throw RemoveDataException('Failed to remove cached token.');
    }
  }
}