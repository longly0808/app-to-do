import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list/service/auth_service.dart';

class ServiceDependencies {
  static void init(GetIt injector){
    injector.registerLazySingleton<AuthService>(()=> AuthService());
    injector.registerFactory<Dio>(() => Dio());
  }
}