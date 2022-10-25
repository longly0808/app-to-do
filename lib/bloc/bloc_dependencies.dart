import 'package:get_it/get_it.dart';
import 'package:to_do_list/bloc/bloc.dart';

import 'auth/auth_bloc.dart';




class BlocDependencies {
  static init(GetIt injector){
    injector.registerFactory<AuthenticationBloc>(() => AuthenticationBloc(injector()));
    injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));
    injector.registerFactory<ListTaskBloc>(() => ListTaskBloc(injector(),injector()));
    injector.registerFactory<ProfileBloc>(() => ProfileBloc(injector()));
    injector.registerFactory<CreateTaskBloc>(() => CreateTaskBloc(injector()));
    injector.registerFactory<UpdateTaskBloc>(() => UpdateTaskBloc(injector()));
    injector.registerFactory<DeleteTaskBloc>(() => DeleteTaskBloc(injector()));
    injector.registerFactory<ThemeBloc>(() => ThemeBloc(injector()));
  }
}