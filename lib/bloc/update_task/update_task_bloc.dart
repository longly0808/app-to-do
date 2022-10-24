import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/service/api/update_task/update_task.dart';
import 'package:to_do_list/model/view/update_task_model.dart';
import 'package:to_do_list/service/service.dart';

import '../../core/bloc/base_cubit.dart';
import '../../model/model.dart';
import '../bloc.dart';

class UpdateTaskBloc extends BaseCubit {
  TaskService _taskService;

  UpdateTaskBloc(this._taskService) : super(InitialState());

  @override
  void initState() {
    UpdateTaskModel updateTaskModel = UpdateTaskModel(taskModel: TaskModel());
    emit(LoadedState(null, updateTaskModel));

    super.initState();
  }

  Future<void> updateState(TaskModel task) async {
    UpdateTaskRequest request = UpdateTaskRequest(
        id: task.id ?? '',
        description: task.description,
        contents: task.content,
        due_datetime: task.toDate,
        is_completed: task.isFinish);
    final response = await _taskService.updateTask(
        updateTaskRequest: request, uidGen: DateTime
        .now()
        .millisecondsSinceEpoch
        .toString());
    if (response.statusCode == 200){
      emit(UpdateTaskSuccess());
    }
    else{
      LoadedState(null,null,errorMessage: response.statusMessage);
    }

  }

  Future<void> showUpdate(bool status) async{
    UpdateTaskModel model = latestLoadedState?.model;
    model.isUpdate = status;
    emit(LoadedState(null, model));
  }

}
