import 'package:json_annotation/json_annotation.dart';
part 'update_task.g.dark';

class UpdateTaskResponse {}

@JsonSerializable()
class UpdateTaskRequest {
  String? contents;
  String? description;
  bool? is_completed;
  String? due_datetime;

  UpdateTaskRequest({
    this.contents,
    this.description,
    this.is_completed,
    this.due_datetime,
  });
}
