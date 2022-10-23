// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      json['id'] as String?,
      json['assigner_id'] as String?,
      json['assignee_id'] as String?,
      json['project_id'] as String?,
      json['section_id'] as String?,
      json['parent_id'] as String?,
      json['order'] as int?,
      json['content'] as String?,
      json['description'] as String?,
      json['is_completed'] as bool?,
      (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['priority'] as int?,
      json['comment_count'] as int?,
      json['creator_id'] as String?,
      json['created_at'] as String?,
      json['due'] == null
          ? null
          : Due.formJson(json['due'] as Map<String, dynamic>),
      json['url'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'assigner_id': instance.assigner_id,
      'assignee_id': instance.assignee_id,
      'project_id': instance.project_id,
      'section_id': instance.section_id,
      'parent_id': instance.parent_id,
      'order': instance.order,
      'content': instance.content,
      'description': instance.description,
      'is_completed': instance.is_completed,
      'labels': instance.labels,
      'priority': instance.priority,
      'comment_count': instance.comment_count,
      'creator_id': instance.creator_id,
      'created_at': instance.created_at,
      'due': instance.due,
      'url': instance.url,
    };

Due _$DueFromJson(Map<String, dynamic> json) => Due(
      json['date'] as String?,
      json['string'] as String?,
      json['lang'] as String?,
      json['is_recurring'] as bool?,
    );

Map<String, dynamic> _$DueToJson(Due instance) => <String, dynamic>{
      'date': instance.date,
      'string': instance.string,
      'lang': instance.lang,
      'is_recurring': instance.is_recurring,
    };
