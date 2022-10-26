import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:to_do_list/bloc/bloc.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/view/theme_model.dart';
import 'package:to_do_list/page/screen/home_screen.dart';
import 'package:to_do_list/style/my_theme.dart';

import 'dependencies.dart';
import 'utility/utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppDependencies.initialize();
  initApp();

  runApp(
    EasyLocalization(
      supportedLocales: LocalizationHelper.supportedLocale,
      startLocale: LocalizationHelper.supportedLocale.first,
      fallbackLocale: LocalizationHelper.supportedLocale.first,
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

Future<void> initApp() async {
  // EasyLoading.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tr('to_do_list'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? taske;
  final bloc = AppDependencies.injector.get<ThemeBloc>();
  @override
  void initState() {
    bloc.loadTheme();
    // TODO: implement initState
    super.initState();
    // getStatusLogin();
  }

  // Future<void> getStatusLogin()async {
  //   final sharedPreferences =AppDependencies.injector.get<UserPreferences>();
  //   taske =await sharedPreferences.getStatusLogin();
  //   getStatusLogin();
  //   print(taske);
  // }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<ThemeBloc, BaseState>(
        buildWhen: (previous, current) {
          if(previous is InitialState){
            return true;
          }
          if(previous is LoadedState && current is LoadedState){
            final modelP = previous.model as ThemeModel;
            final modelC = current.model as ThemeModel;
            if(modelP.isLightMode != modelC.isLightMode){
              return true;
            }
            else{
              return false;
            }
          }
          else{
            return false;
          }
        } ,
        builder: (BuildContext context, state) {
          if (state is LoadedState) {
            ThemeModel model = state.model;
            bool statusTheme = model.isLightMode;
            return MaterialApp(
              theme: statusTheme ? MyTheme.lightTheme() : MyTheme.darkTheme(),
              darkTheme:statusTheme? MyTheme.darkTheme() : MyTheme.lightTheme(),
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(),
              home: const Scaffold(
                body: SafeArea(child: HomeScreen()
                    // , LoginPage(),
                    ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
