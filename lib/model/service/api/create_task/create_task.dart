import 'package:json_annotation/json_annotation.dart';
part 'create_task.g.dart';

@JsonSerializable()
class CreateTaskResponse {
  CreateTaskResponse();

}
@JsonSerializable()
class CreateTaskRequest{
  String? content;
  String? description;
  String? due_datetime;

  CreateTaskRequest({this.content, this.description, this.due_datetime});
  factory CreateTaskRequest.fromJson(Map<String,dynamic> json) => _$CreateTaskRequestFromJson(json);

  Map<String, dynamic> toJson()=> _$CreateTaskRequestToJson(this);

}