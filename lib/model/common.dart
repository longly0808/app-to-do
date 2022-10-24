import 'package:to_do_list/utility/convert.dart';

class TaskModel {
  String? id;
  String? content;
  String? description;
  String? createAt;
  String? toDate;
  bool? isFinish;

  TaskModel({
    this.id,
    this.content,
    this.description,
    this.createAt,
    this.toDate,
    this.isFinish,
  });

   DateTime get getDate => ConvertUtility.convertStringToDateTime(toDate)?? DateTime.now();

}
