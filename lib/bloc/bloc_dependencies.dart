import 'package:get_it/get_it.dart';
import 'package:to_do_list/bloc/bloc.dart';

import 'auth/auth_bloc.dart';




class BlocDependencies {
  static init(GetIt injector){
    injector.registerFactory<AuthenticationBloc>(() => AuthenticationBloc(injector()));
    injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));
  }
}