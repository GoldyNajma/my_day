import 'package:my_day/data/models/authorization_token.dart';
import 'package:my_day/data/models/request_body/sign_in_request_body.dart';
import 'package:my_day/data/repositories/auth_repository.dart';

class SignInViewModel {
  static final SignInViewModel instance = SignInViewModel._();
  AuthRepository _authRepository = AuthRepository.instance;

  SignInViewModel._();

  Future<AuthorizationToken> signIn(SignInRequestBody requestBody) async {
    return await _authRepository.signIn(requestBody);
  }
  
  Future<void> saveAuthorizationToken(AuthorizationToken authorizationToken) async {
    return await _authRepository.saveAuthorizationTokenToLocal(authorizationToken.toString());
  }
}