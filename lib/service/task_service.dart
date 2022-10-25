import 'package:dio/dio.dart';
import 'package:to_do_list/dependencies.dart';
import 'package:to_do_list/model/service/api/update_task/update_task.dart';
import '../config/config.dart';
import '../model/service/api/create_task/create_task.dart';

class TaskService {
  TaskService();

  Future<Response> loadListTask() async {
    Dio dio = AppDependencies.injector.get<Dio>();
    try {
      dio.options.headers["Authorization"] = "Bearer ${Config.token}";
      return await dio.get(Config.BASEURL);
    } catch (e) {
      print(e);
      return Response(requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> createNewTask({
    required CreateTaskRequest createTaskRequest,
    required String uidGen,
  }) async {
    Dio dio = AppDependencies.injector.get<Dio>();
    try {
      dio.options
        ..headers["Authorization"] = "Bearer ${Config.token}"
        ..headers["Content-Type"] = "application/json"
        ..headers["X-Request-Id"] = uidGen;
      final response = await dio.post(Config.BASEURL,
          data: createTaskRequest.toJson());
      return response;
    } catch (e) {
      return Response(requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> updateTask({
    required UpdateTaskRequest updateTaskRequest,
    required String uidGen,
  }) async {
    Dio dio = AppDependencies.injector.get<Dio>();
    try {
      dio.options
        ..headers["Authorization"] = "Bearer ${Config.token}"
        ..headers["Content-Type"] = "application/json"
        ..headers["X-Request-Id"] = uidGen;
      var json = updateTaskRequest.toJson();
      final response =await  dio.post("${Config.BASEURL}/${updateTaskRequest.id}",data: json);

      return response;
    } catch (e) {
      return Response(requestOptions: RequestOptions(path: ''));
    }
  }
  Future<Response> deleteTask({required String idTask}) async {
    Dio dio = AppDependencies.injector.get<Dio>();
    try {
      dio.options.headers["Authorization"] = "Bearer ${Config.token}";
      final response = dio.post("${Config.BASEURL}/$idTask");
      return response;
    } catch (e) {
      return Response(requestOptions: RequestOptions(path:''));
    }
  }
}
