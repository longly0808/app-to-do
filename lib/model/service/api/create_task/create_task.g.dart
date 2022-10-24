// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTaskResponse _$CreateTaskResponseFromJson(Map<String, dynamic> json) =>
    CreateTaskResponse();

Map<String, dynamic> _$CreateTaskResponseToJson(CreateTaskResponse instance) =>
    <String, dynamic>{};

CreateTaskRequest _$CreateTaskRequestFromJson(Map<String, dynamic> json) =>
    CreateTaskRequest(
      content: json['content'] as String?,
      description: json['description'] as String?,
      due_datetime: json['due_datetime'] as String?,
    );

Map<String, dynamic> _$CreateTaskRequestToJson(CreateTaskRequest instance) =>
    <String, dynamic>{
      'content': instance.content,
      'description': instance.description,
      'due_datetime': instance.due_datetime,
    };
