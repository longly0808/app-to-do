import 'package:json_annotation/json_annotation.dart';
part 'update_task.g.dart';

@JsonSerializable()
class UpdateTaskResponse {}

@JsonSerializable()
class UpdateTaskRequest {
  String id;
  @JsonKey(includeIfNull: false)
  String? content;
  @JsonKey(includeIfNull: false)
  String? description;
  @JsonKey(includeIfNull: false)
  bool? is_completed;
  @JsonKey(includeIfNull: false)
  String? due_datetime;

  UpdateTaskRequest({
    required this.id,
    this.content,
    this.description,
    this.is_completed,
    this.due_datetime,
  });

  factory UpdateTaskRequest.fromJson(Map<String, dynamic> json) => _$UpdateTaskRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTaskRequestToJson(this);
}
