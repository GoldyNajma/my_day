import 'package:my_day/data/models/user.dart';

class Task {
  final int id;
  final String title;
  final String description;
  final bool checked;
  final bool shared;
  final List<User>? sharedUsers;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.checked,
      required this.shared,
      this.sharedUsers});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      checked: json['checked'],
      shared: json['shared'],
      sharedUsers:
          List.from(json['shared_users'].map((user) => User.fromJson(user))));
}
