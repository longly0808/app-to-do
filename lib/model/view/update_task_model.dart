import 'package:to_do_list/model/model.dart';

class UpdateTaskModel{
  bool IsUpdate;
  TaskModel taskModel;

  UpdateTaskModel({required this.IsUpdate, required this.taskModel});
}
class UpdateTaskParam{}