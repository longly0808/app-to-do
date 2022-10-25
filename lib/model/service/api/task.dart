import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  String? id;
  String? assigner_id;
  String? assignee_id;
  String? project_id;
  String? section_id;
  String? parent_id;
  int? order;
  String? content;
  String? description;
  bool? is_completed;
  List<String>? labels;
  int? priority;
  int? comment_count;
  String? creator_id;
  String? created_at;
  Due? due;
  String? url;


  Task(
      this.id,
      this.assigner_id,
      this.assignee_id,
      this.project_id,
      this.section_id,
      this.parent_id,
      this.order,
      this.content,
      this.description,
      this.is_completed,
      this.labels,
      this.priority,
      this.comment_count,
      this.creator_id,
      this.created_at,
      this.due,
      this.url);

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@JsonSerializable()
class Due {
  String? date;
  String? string;
  String? timezone;
  bool? is_recurring;
  String? datetime;


  Due(this.date, this.string, this.timezone, this.is_recurring, this.datetime);

  factory Due.fromJson(Map<String, dynamic> json) => _$DueFromJson(json);

  Map<String, dynamic> toJson() => _$DueToJson(this);
}
