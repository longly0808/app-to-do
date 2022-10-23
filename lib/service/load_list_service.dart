import 'package:dio/dio.dart';
import 'package:to_do_list/dependencies.dart';
import '../config/config.dart';

class LoadListService{

  LoadListService();
Future<Response> loadListTask() async{
   Dio dio  = AppDependencies.injector.get<Dio>();
   try{
    dio.options.headers["Authorization"] = "Bearer ${Config.token}";
     return await dio.get(Config.URL_GET_LIST_TASK);
   }catch(e){
     print(e);
     return Response(requestOptions: RequestOptions(path: ''));
   }
}
}