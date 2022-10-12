import 'package:get_it/get_it.dart';
import 'package:to_do_list/service/service.dart';


class AppDependencies{
  AppDependencies._();
  static GetIt get injector => GetIt.I;

  static Future initialize()  async{
    ServiceDependencies.init(injector);
  }
}