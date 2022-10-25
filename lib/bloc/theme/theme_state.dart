import 'package:to_do_list/core/bloc/base_state.dart';
class ChangeMode extends BaseState{
  bool? isLightMode;
  ChangeMode({this.isLightMode});
}