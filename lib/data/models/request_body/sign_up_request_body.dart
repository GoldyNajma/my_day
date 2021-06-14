import 'request_body.dart';

class SignUpRequestBody implements RequestBody {
  final String username;
  final String email;
  final String password;

  SignUpRequestBody({
    required this.username, 
    required this.email, 
    required this.password,
  });

  @override
  Map<String, String> toJson() => {
    'username': this.username,
    'email': this.email,
    'password': this.password,
  };
}