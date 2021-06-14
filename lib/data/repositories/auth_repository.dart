import 'package:my_day/data/models/authorization_token.dart';
import 'package:my_day/data/models/request_body/sign_in_request_body.dart';
import 'package:my_day/data/services/auth/auth_local_service.dart';
import 'package:my_day/data/services/auth/auth_remote_service.dart';
import 'package:my_day/data/models/request_body/sign_up_request_body.dart';

class AuthRepository {
  static final AuthRepository instance = AuthRepository._();
  AuthRemoteService _authRemoteService = AuthRemoteService.instance;
  AuthLocalService _authLocalService = AuthLocalService.instance;

  AuthRepository._();

  Future<String> signUp(SignUpRequestBody requestBody) async {
    try {
      return await _authRemoteService.signUp(requestBody);
    } catch (e) {
      return Future.error('$e');
    } 
  }

  Future<AuthorizationToken> signIn(SignInRequestBody requestBody) async {
    try {
      return await _authRemoteService.signIn(requestBody);
    } catch (e) {
      return Future.error('$e');
    }
  }

  Future<String> signOut(String authorizationToken) async {
    try {
      return await _authRemoteService.signOut(authorizationToken);
    } catch (e) {
      return Future.error('$e');
    } 
  }

  Future<void> saveAuthorizationTokenToLocal(String authorizationToken) async {
    try {
      return await _authLocalService.setAuthorizationToken(authorizationToken);
    } catch (e) {
      return Future.error('$e');
    }
  }

  Future<String> readAuthorizationTokenFromLocal() async {
    try {
      return await _authLocalService.getAuthorizationToken();
    } catch (e) {
      return Future.error('$e');
    }
  }

  Future<void> removeAuthorizationTokenFromLocal() async {
    try {
      return await _authLocalService.removeAuthorizationToken();
    } catch (e) {
      return Future.error('$e');
    }
  }
}