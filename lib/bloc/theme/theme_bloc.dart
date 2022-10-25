import 'package:to_do_list/config/config.dart';
import 'package:to_do_list/core/bloc/base_cubit.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/view/theme_model.dart';
import 'package:to_do_list/service/service.dart';

class ThemeBloc extends BaseCubit{
  UserPreferences _userPreferences;
  ThemeBloc(this._userPreferences):super(InitialState());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> loadTheme() async{
    ThemeModel themeModel = ThemeModel();
    var sharePreference = await _userPreferences.getInstance();
    bool? statusTheme =  sharePreference.getBool(Config.lightMode);
    themeModel.isLightMode = statusTheme?? true;

      emit(LoadedState(null, themeModel));
  }
  Future<void> changeTheme(bool status)async{
    ThemeModel model = ThemeModel();
    model.isLightMode = status;
    var sharePreference = await _userPreferences.getInstance();
    model.isLightMode =    await sharePreference.setBool(Config.lightMode, status);;
    emit(LoadedState(null, model));
  }
}