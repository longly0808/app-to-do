import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:to_do_list/core/bloc/base_cubit.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/common.dart';
import 'package:to_do_list/model/service/api/task.dart';
import 'package:to_do_list/model/view/list_task_model.dart';
import 'package:to_do_list/service/service.dart';

import '../../config/config.dart';

class ListTaskBloc extends BaseCubit {
  UserPreferences _userPreferences;
  TaskService _listTaskService;
  late final sharePre;

  ListTaskBloc(this._userPreferences, this._listTaskService)
      : super(InitialState());

  @override
  void initState() {
    // ListTaskModel listTaskModel = ListTaskModel(tasks: []);
    // emit(LoadedState(null, listTaskModel));

    super.initState();
  }

  Future<void> loadListTask({bool? updateLocation}) async {
    ListTaskModel listTaskModel = ListTaskModel(tasks: []);
    sharePre= await _userPreferences.getInstance();
    listTaskModel.isLightMode = await sharePre.getBool(Config.lightMode) ?? true;
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
            ..isCompleted = e.is_completed
            ..location = e.due?.timezone)
          .toList();

      dismissLoading();
      if(updateLocation?? false){
        listTaskModel.location = listTaskModel.tasks?.last.location;
      }
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
  Future<bool> getTheme() async{
    ListTaskModel listTaskModel = latestLoadedState?.model;
    bool status = await  sharePre.getBool(Config.lightMode) ?? true;
    listTaskModel.isLightMode = status;
    emit(LoadedState(null, listTaskModel));
    return listTaskModel.isLightMode?? true;

  }


}
