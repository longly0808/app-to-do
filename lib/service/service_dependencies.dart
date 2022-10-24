import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list/service/auth_service.dart';
import 'package:to_do_list/service/service.dart';

class ServiceDependencies {
  static void init(GetIt injector){
    injector.registerFactory<Dio>(() => Dio());
    injector.registerLazySingleton<AuthService>(()=> AuthService());
    injector.registerLazySingleton<UserPreferences>(() => UserPreferences());
    injector.registerLazySingleton<TaskService>(() => TaskService());
  }
}