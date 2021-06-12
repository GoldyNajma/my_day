class Task {
  final int id;
  final String title;
  final String description;
  final bool checked;

  Task({
    required this.id, 
    required this.title, 
    required this.description,
    required this.checked,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    checked: json['checked'],
  );
}