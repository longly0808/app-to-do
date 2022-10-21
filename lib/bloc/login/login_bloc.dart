import 'package:easy_localization/easy_localization.dart';
import 'package:to_do_list/config/config.dart';
import 'package:to_do_list/core/bloc/base_cubit.dart';
import 'package:to_do_list/core/bloc/base_state.dart';

import '../../service/share_preferences/user_preferences.dart';
import 'login_state.dart';

class LoginBloc extends BaseCubit {
  final UserPreferences _sharePreferences;

  LoginBloc(this._sharePreferences) : super(InitialState());

  @override
  void initState() {
    super.initState();
  }

  Future<void> checkLogin(
      {required String email, required String password}) async {
    if (email == Config.email_default && password == Config.password_default) {
      _sharePreferences.setStatusLogin(true);
      Config.token = 'c4b9502135b216725419897ac58c79b68db1ec57';
      emit(LoginSuccess());
      return;
    } else {
      emit(
          LoadedState(null, null, errorMessage: tr('invalid_login')));
      return;
    }
  }
}
