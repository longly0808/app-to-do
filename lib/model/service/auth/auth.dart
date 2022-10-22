import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Auth {
  String? id;
  String? name;
  int? commentCount;
  int? order;
  String? color;
  bool? isShared;
  bool? isFavorite;
  String? parentId;
  bool? isInboxProject;
  bool? isTeamInbox;
  String? viewStyle;
  String? url;
}