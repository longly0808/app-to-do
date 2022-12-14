import 'package:to_do_list/utility/convert.dart';

class TaskModel {
  String? id;
  String? content;
  String? description;
  String? createAt;
  String? toDate;
  bool? isCompleted;
  String? location;


  TaskModel({
    this.id,
    this.content,
    this.description,
    this.createAt,
    this.toDate,
    this.isCompleted,
    this.location,
  });

   DateTime get getDate => ConvertUtility.convertStringToDateTime(toDate)?? DateTime.now();

}
