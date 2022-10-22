import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/bloc.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/page/auth/login_page.dart';
import 'package:to_do_list/page/screen/list_task_screen.dart';
import 'package:to_do_list/widget/base_cubit_stateful_widget.dart';

class HomeScreen extends BaseCubitStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState
    extends BaseCubitStateFulWidgetState<AuthenticationBloc, HomeScreen> {
  DateTime? _dateTime;
  bool isLogOut = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _dateTime = DateTime.now();
    super.initState();
  }





  @override
  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<AuthenticationBloc, BaseState>(
        listener: (BuildContext context, state) {
          // if (state is AuthFailure) {
          //   Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => LoginPage()))
          //       .then((value) {
          //     if (value == true) {
          //       bloc.checkDisplayingScreen();
          //     }
          //   });
          // }
        },
        builder: (BuildContext context, Object? state) {
          if(state is AuthFailure){
            return const LoginPage();
          }
          if (state is LoadedState) {

            return const ListTaskScreen(token:'c4b9502135b216725419897ac58c79b68db1ec57' ,);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
