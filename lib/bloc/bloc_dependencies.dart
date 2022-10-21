import 'package:get_it/get_it.dart';
import 'package:to_do_list/bloc/login/login_bloc.dart';

class BlocDependencies {
  static init(GetIt injector){
    injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));
  }
}