import 'package:to_do_list/core/bloc/base_state.dart';

import '../../config/config.dart';

class LoginSuccess extends BaseState{
  final String? token;
  LoginSuccess({this.token});



}