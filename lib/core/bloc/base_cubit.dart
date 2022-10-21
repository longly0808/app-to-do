import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../dependencies.dart';
import 'base_state.dart';

abstract class BaseCubit extends Cubit<BaseState> {
  String? title;
  String? id;

  final StreamController<bool> _loadingController =
      StreamController<bool>.broadcast();

  StreamSink<bool> get loadingSink => _loadingController.sink;
  Stream<bool> get loadingStream => _loadingController.stream;
  BaseCubit(BaseState state) : super(state);
  LoadedState? get latestLoadedState {
    if (state is LoadedState) {
      return state as LoadedState;
    }
    return null;
  }

  void initState() {}

  void didChangeDependencies() {}

  void onResume() {}

  void onPause() {}

  void onDetach() {}

  void onInactive() {}

  void showLoading() => EasyLoading.show();

  Future<void> dismissLoading() async {
    await EasyLoading.dismiss();
  }

  @mustCallSuper
  @override
  Future<void> close() {
    // TODO: implement close
    _loadingController.close();
    return super.close();
  }
}
