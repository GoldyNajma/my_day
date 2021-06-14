class AuthorizationToken {
  final String accessToken;
  final String tokenType;

  AuthorizationToken({
    required this.accessToken, 
    required this.tokenType,
  });

  factory AuthorizationToken.fromJson(Map<String, dynamic> json) => AuthorizationToken(
    accessToken: json['access_token'],
    tokenType: json['token_type'],
  );

  Map<String, dynamic> toJson() => {
    'access_token': this.accessToken,
    'token_type': this.tokenType,
  };

  @override
  String toString() => '$tokenType $accessToken';
}