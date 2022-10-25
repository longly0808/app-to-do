import 'package:to_do_list/model/model.dart';

class UpdateTaskModel{
  bool isUpdate;
  TaskModel taskModel;

  UpdateTaskModel({this.isUpdate = false,required this.taskModel});
}
class UpdateTaskParam{}