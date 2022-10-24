import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:to_do_list/core/bloc/base_cubit.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/service/api/task.dart';
import 'package:to_do_list/model/view/list_task_model.dart';
import 'package:to_do_list/service/service.dart';
import 'package:to_do_list/service/share_preferences/user_preferences.dart';

class ListTaskBloc extends BaseCubit{
  UserPreferences _userPreferences;
  TaskService _listTaskService;
  ListTaskBloc(this._userPreferences,this._listTaskService):super(InitialState());

  @override
  void initState() {
    // ListTaskModel listTaskModel = ListTaskModel(tasks: []);
    // emit(LoadedState(null, listTaskModel));
    loadListTask();
    super.initState();
  }
  Future<void> loadListTask() async{
    ListTaskModel listTaskModel = ListTaskModel(tasks: []);
    showLoading();
    Response response  =await _listTaskService.loadListTask() ;
    if(response.statusCode == 200){
      List<Task> list = [] ;
      list =(response.data as List).map((e) => Task.fromJson(e)).toList();
      listTaskModel.tasks?.addAll(list);
      dismissLoading();
      emit(LoadedState(null, listTaskModel));
      return;
    }
    else{
      dismissLoading();
      emit(LoadedState(null, ListTaskModel(),errorMessage: response.statusMessage),);
    }
  }


}