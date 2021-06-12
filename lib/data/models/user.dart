class User {
  final int id;
  final String name;
  final String email;
  final String? fcmToken;

  User({
    required this.id, 
    required this.name, 
    required this.email, 
    this.fcmToken, 
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    fcmToken: json['fcm_token'],
  );

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'name': this.name,
    'email': this.email,
    'fcm_token': this.fcmToken,
  };
}