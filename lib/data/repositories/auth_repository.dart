import 'package:my_day/data/services/auth/auth_remote_service.dart';
import 'package:my_day/data/models/request_body/sign_up_request_body.dart';

class AuthRepository {
  static final AuthRepository instance = AuthRepository._();
  AuthRemoteService _authRemoteService = AuthRemoteService.instance;

  AuthRepository._();

  Future<String> signUp(SignUpRequestBody requestBody) async {
    try {
      return await _authRemoteService.signUp(requestBody);
    } catch (e) {
      return Future.error('$e');
    } 
  }
}