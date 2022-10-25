// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTaskResponse _$UpdateTaskResponseFromJson(Map<String, dynamic> json) =>
    UpdateTaskResponse();

Map<String, dynamic> _$UpdateTaskResponseToJson(UpdateTaskResponse instance) =>
    <String, dynamic>{};

UpdateTaskRequest _$UpdateTaskRequestFromJson(Map<String, dynamic> json) =>
    UpdateTaskRequest(
      id: json['id'] as String,
      content: json['content'] as String?,
      description: json['description'] as String?,
      is_completed: json['is_completed'] as bool?,
      due_datetime: json['due_datetime'] as String?,
    );

Map<String, dynamic> _$UpdateTaskRequestToJson(UpdateTaskRequest instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('description', instance.description);
  writeNotNull('is_completed', instance.is_completed);
  writeNotNull('due_datetime', instance.due_datetime);
  return val;
}
