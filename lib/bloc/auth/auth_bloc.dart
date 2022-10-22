import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/config/config.dart';
import 'package:to_do_list/core/bloc/base_cubit.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/service/auth/user_model.dart';

import '../../model/model.dart';
import '../../service/share_preferences/user_preferences.dart';
import 'auth_state.dart';

class AuthenticationBloc extends BaseCubit {
  final UserPreferences _userPreferences;

  AuthenticationBloc(this._userPreferences) : super(InitialState());

  @override
  void initState() {
    checkDisplayingScreen();
    super.initState();
  }
  Future<void> checkDisplayingScreen() async{
    AuthModel authModel = AuthModel();
    final sharePreferences =await _userPreferences.getInstance();
   bool status = sharePreferences.getBool(Config.statusLogin)?? false;
    if(status){
          emit(LoadedState(null, authModel));
    }
    else{
      emit(AuthFailure());
    }
  }
  Future<void> changeTheme(bool status) async{
    AuthModel authModel = AuthModel();
    authModel.isLightTheme = status;
    emit(LoadedState(null, authModel));

  }

}
