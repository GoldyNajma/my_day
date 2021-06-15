import 'package:my_day/data/models/request_body/request_body.dart';

class UpdateTaskCheckRequestBody implements RequestBody {
  final String checked;

  UpdateTaskCheckRequestBody({
    required this.checked,
  });

  @override
  Map<String, String> toJson() => {
    'checked': this.checked,
  };
}