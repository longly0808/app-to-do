import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/bloc/bloc.dart';

import '../../config/config.dart';
import '../../core/bloc/base_state.dart';
import '../../service/share_preferences/user_preferences.dart';

import '../../core/bloc/base_cubit.dart';

class LoginBloc extends BaseCubit{
  final UserPreferences _userPreferences;
  LoginBloc(this._userPreferences) : super(InitialState());

  Future<void> checkLogin(
      {required String email, required String password}) async {
    if (email == Config.email_default && password == Config.password_default) {
      SharedPreferences sharedPreferences =await _userPreferences.getInstance();
      sharedPreferences.setBool(Config.statusLogin, true);
      emit(LoginSuccess(token:'c4b9502135b216725419897ac58c79b68db1ec57' ));
      return;
    } else {
      emit(
          LoadedState(null, null, errorMessage: tr('invalid_login')));
      return;
    }
  }
}