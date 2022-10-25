import 'package:json_annotation/json_annotation.dart';
part 'delete_task.g.dart';

@JsonSerializable()
class DeleteTaskReQuest{
  String? id;
  DeleteTaskReQuest({this.id});

  factory DeleteTaskReQuest.fromJson(Map<String,dynamic> json)=> _$DeleteTaskReQuestFromJson(json);
  Map<String,dynamic> toJson()=> _$DeleteTaskReQuestToJson(this);

}