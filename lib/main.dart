import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/page/auth/login_page.dart';
import 'package:to_do_list/style/colors.dart';
import 'package:to_do_list/style/my_theme.dart';

import 'dependencies.dart';
import 'utility/utility.dart';

void main() async {
  await EasyLocalization.ensureInitialized();
  await AppDependencies.initialize();
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tr('to_do_list'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme(),
      // darkTheme: MyTheme.darkTheme(),
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SafeArea(
          child: LoginPage(),
        ),
      ),
    );
  }
}
