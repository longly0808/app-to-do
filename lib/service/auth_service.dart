import 'package:dio/dio.dart';
import 'package:to_do_list/config/config.dart';
import 'package:to_do_list/dependencies.dart';
class AuthService{
  Future<void> LoginAuthentication() async{
     Dio dio  = AppDependencies.injector.get<Dio>();
     try{
      dio.options.headers["Authorization"] = "Bearer ${Config.token}";
       Response response =await dio.get(Config.token);

       print('${response.data}');
     }catch(e){
       print(e);
     }
  }
}