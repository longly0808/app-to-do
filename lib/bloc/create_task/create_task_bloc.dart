import 'package:to_do_list/bloc/bloc.dart';
import 'package:to_do_list/core/bloc/base_cubit.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/model.dart';
import 'package:to_do_list/model/service/api/create_task/create_task.dart';
import 'package:to_do_list/service/service.dart';
import 'package:to_do_list/utility/convert.dart';


class CreateTaskBloc extends BaseCubit {
  TaskService _taskService;

  CreateTaskBloc(this._taskService) : super(InitialState());

  Future<void> createTask(TaskModel task) async {
    CreateTaskRequest createTaskRequest = CreateTaskRequest(
      content: task.content,
      description: task.description,
      due_datetime: task.toDate,
    );
    final response = await _taskService.createNewTask(
      createTaskRequest: createTaskRequest,
      uidGen: DateTime.now().microsecondsSinceEpoch.toString(),
    );
    if(response.statusCode == 200){
      emit(CreateTaskSuccess());
    }
    else{
      emit(LoadedState(null, null,errorMessage: response.statusMessage));
    }
  }
}
