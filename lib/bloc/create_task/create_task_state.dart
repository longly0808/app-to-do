import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/model.dart';

class CreateTaskSuccess extends BaseState{
  TaskModel? taskModel;

  CreateTaskSuccess({this.taskModel});
}