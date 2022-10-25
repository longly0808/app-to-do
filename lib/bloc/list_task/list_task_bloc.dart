import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:to_do_list/core/bloc/base_cubit.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/common.dart';
import 'package:to_do_list/model/service/api/task.dart';
import 'package:to_do_list/model/view/list_task_model.dart';
import 'package:to_do_list/service/service.dart';

class ListTaskBloc extends BaseCubit {
  UserPreferences _userPreferences;
  TaskService _listTaskService;

  ListTaskBloc(this._userPreferences, this._listTaskService)
      : super(InitialState());

  @override
  void initState() {
    // ListTaskModel listTaskModel = ListTaskModel(tasks: []);
    // emit(LoadedState(null, listTaskModel));

    super.initState();
  }

  Future<void> loadListTask() async {
    ListTaskModel listTaskModel = ListTaskModel(tasks: []);
    showLoading();
    Response response = await _listTaskService.loadListTask();
    if (response.statusCode == 200) {
      List<Task> list = [];
      list = (response.data as List).map((e) => Task.fromJson(e)).toList();
      listTaskModel.tasks = list
          .map((e) => TaskModel()
            ..id  = e.id
            ..content = e.content
            ..description = e.description
            ..toDate = e.due?.datetime
            ..createAt = e.created_at
            ..isCompleted = e.is_completed)
          .toList();

      dismissLoading();
      emit(LoadedState(null, listTaskModel));
      return;
    } else {
      dismissLoading();
      emit(
        LoadedState(null, ListTaskModel(),
            errorMessage: response.statusMessage),
      );
    }
  }
}
