import 'request_body.dart';

class SignInRequestBody implements RequestBody {
  final String email;
  final String password;

  SignInRequestBody({
    required this.email, 
    required this.password,
  });

  @override
  Map<String, String> toJson() => {
    'email': this.email,
    'password': this.password,
  };
}