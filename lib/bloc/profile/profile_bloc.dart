import 'package:to_do_list/core/bloc/base_cubit.dart';
import 'package:to_do_list/core/bloc/base_state.dart';

import '../../config/config.dart';
import '../../service/share_preferences/user_preferences.dart';
import '../bloc.dart';

class ProfileBloc extends BaseCubit{
  UserPreferences _userPreferences;
  ProfileBloc(this._userPreferences):super(InitialState());

  Future<void> signOut() async{
    final sharePreferences =await _userPreferences.getInstance();
    sharePreferences.setBool(Config.statusLogin,false);
    emit(LogOut());
  }
}