import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/login/login_bloc.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/page/screen/home_screen.dart';
import 'package:to_do_list/utility/utility.dart';
import 'package:to_do_list/widget/base_cubit_stateful_widget.dart';
import '../../bloc/login/login_state.dart';
import '../../config/config.dart';
import '../../constant.dart';
import '../../style/style.dart';
import '../../widget/commons/custom_button.dart';
import '../../widget/commons/custom_textfield.dart';

class LoginPage extends BaseCubitStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState
    extends BaseCubitStateFulWidgetState<LoginBloc, LoginPage> {
  String? _password = '';
  String? _email = '';
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget buildBody(BuildContext context) {
    final text = Config.token;
    print('$text');
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<LoginBloc,BaseState>(
        builder: (context, state) {
          final size = MediaQuery.of(context).size;
          final theme = Theme.of(context);
          return SizedBox(
            width: size.width,
            child:Form(
              key:_formKey ,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width,
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(
                      Dimens.size16,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: MyColors.blackColor,
                        size: Dimens.size20,
                      ),
                    ),
                  ),
                  // Text(tr('to_do_list'), style: theme.textTheme.headline1,)
                  Padding(
                    padding: const EdgeInsets.all(Dimens.size16),
                    child: Image.asset(
                      Constants.logo_intro,
                      fit: BoxFit.cover,
                      color: theme.colorScheme.primary,
                      height: size.height / 3,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(Dimens.size16),
                      child: CustomTextField(
                        isTypePassword: false,
                        hintText: tr('input_user_name',),
                        onChange: (value){
                          _email = value;
                        },
                      ),),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: Dimens.size16),
                    child: CustomTextField(
                      isTypePassword: true,
                      hintText: tr('your_password'),
                      onChange: (value){
                        _password = value;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(
                      Dimens.size16,
                    ),
                    width: size.width,
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        tr('forgot_password'),
                        style: theme.textTheme.headline5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Dimens.size16),
                    child: CustomButton(
                      onclick: () {
                        // var service = AppDependencies.injector.get<AuthService>();
                        // service.LoginAuthentication();
                        if(   _formKey.currentState!.validate()){
                          bloc.checkLogin(email: _email ?? '' ,password: _password ?? '' );
                        }
                      },
                      text: tr('login'),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: Dimens.size16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tr('text_signup'),
                          style: theme.textTheme.headline5,
                        ),
                        const SizedBox(width: Dimens.size8),
                        Flexible(
                          child: InkWell(
                            onTap: () {
                            },
                            child: Text(
                              tr('signup'),
                              style: theme.textTheme.headline5!
                                  .copyWith(color: theme.colorScheme.error),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          );
        },
        listener: (BuildContext context, state) {
          if (state is LoginSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),(Route<dynamic> route) => false
            );
          }
          if(state is LoadedState){
              ToastUtility.showError([state.errorMessage??'']);
          }
        },
      ),
    );
  }
}
