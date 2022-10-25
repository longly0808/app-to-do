import 'package:to_do_list/bloc/bloc.dart';
import 'package:to_do_list/core/bloc/base_cubit.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/model.dart';
import 'package:to_do_list/service/service.dart';

class DeleteTaskBloc extends BaseCubit{
  TaskService _taskService;
  DeleteTaskBloc(this._taskService):super(InitialState());

  Future<void> deleteTask({required String idTask})async{
    DeleteTaskReQuest request = DeleteTaskReQuest(id: idTask);
    final response =await _taskService.deleteTask(request: request);
    if(response.statusCode == 204){
      emit(DeletetaskSuccess());
    }
    else{
      emit(LoadedState(null, null,errorMessage: response.statusMessage));
    }
  }
}