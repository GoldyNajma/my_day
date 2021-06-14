import 'package:my_day/data/models/request_body/sign_up_request_body.dart';
import 'package:my_day/data/repositories/auth_repository.dart';

class SignUpViewModel {
  static final SignUpViewModel instance = SignUpViewModel._();
  AuthRepository _authRepository = AuthRepository.instance;

  SignUpViewModel._();

  Future<String> signUp(SignUpRequestBody requestBody) async {
    return await _authRepository.signUp(requestBody);
  }
}