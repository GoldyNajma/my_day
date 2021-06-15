import 'package:my_day/data/models/request_body/request_body.dart';

class CreateNewTaskRequestBody implements RequestBody {
  final String title;
  final String description;

  CreateNewTaskRequestBody({required this.title, required this.description});

  @override
  Map<String, dynamic> toJson() =>
      {'title': this.title, 'description': this.description};
}
