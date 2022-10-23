import '../../../model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'list_task_response.g.dart';

@JsonSerializable()
class ListTaskResponse {
  List<Task> task;

  ListTaskResponse(this.task);
  factory ListTaskResponse.fromJson(Map<String,dynamic> json)=> _$ListTaskResponseFromJson(json);
  Map<String, dynamic> toJson()=> _$ListTaskResponseToJson(this);
}