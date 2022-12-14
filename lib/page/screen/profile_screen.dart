import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/bloc.dart';

import 'package:to_do_list/constant.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/page/screen/task_detail_screen.dart';
import 'package:to_do_list/style/style.dart';
import 'package:to_do_list/widget/widget.dart';

import '../../widget/base_cubit_stateful_widget.dart';
import 'home_screen.dart';

class ProfileScreen extends BaseCubitStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState
    extends BaseCubitStateFulWidgetState<ProfileBloc, ProfileScreen> {
  Widget _rowLogoAndSetting(ThemeData theme, BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Constants.logo_oneline,
          fit: BoxFit.cover,
          color: theme.colorScheme.primary.withOpacity(0.5),
          height: Dimens.size20,
        ),
        const Spacer(),
        PopupMenuButton(
          onSelected: (int select) => selectedSettings(select, context),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 0,
                child: Text(
                  tr('theme'),
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Text(
                  tr('home'),
                ),
              ),
            ];
          },
          icon: Image.asset(
            Constants.icon_settings,
            fit: BoxFit.cover,
            color: theme.primaryColorDark,
            height: Dimens.size20,
          ),
        )
      ],
    );
  }

  void selectedSettings(int selected, BuildContext context) {
    switch (selected) {
      case 0:
        break;
      case 1:
        Navigator.pop(context);
        break;
    }
  }

  Widget _rowFullName(ThemeData theme) {
    return Row(
      children: [
        Text(
          'Full Name',
          style: theme.textTheme.bodyText2!
              .copyWith(color: theme.primaryColorDark),
        ),
        const Spacer(),
        Text(
          'Lys Long',
          style: theme.textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _rowEmail(ThemeData theme) {
    return Row(
      children: [
        Text(
          'Email',
          style: theme.textTheme.bodyText2!
              .copyWith(color: theme.primaryColorDark),
        ),
        const Spacer(),
        Text(
          'Long@gmail.com',
          style: theme.textTheme.bodyText2!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _rowPassword(ThemeData theme) {
    return Row(
      children: [
        Text(
          'Password',
          style: theme.textTheme.bodyText2!
              .copyWith(color: theme.primaryColorDark),
        ),
        const Spacer(),
        Text(
          'Change Password',
          style: theme.textTheme.bodyText2!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (BuildContext context) => bloc,
          child: BlocConsumer<ProfileBloc,BaseState>(
            builder: (BuildContext context, state) {
              return Padding(
                padding: const EdgeInsets.all(Dimens.size32),
                child: Column(
                  children: [
                    _rowLogoAndSetting(theme, context),
                    const SizedBox(
                      height: Dimens.heigh150,
                    ),
                    Image.asset(
                      Constants.profile_image,
                      height: Dimens.size200,
                    ),
                    const SizedBox(
                      height: Dimens.size32,
                    ),
                    _rowFullName(theme),
                    const SizedBox(
                      height: Dimens.size18,
                    ),
                    _rowEmail(theme),
                    const SizedBox(
                      height: Dimens.size16,
                    ),
                    _rowPassword(theme),
                    const SizedBox(
                      height: Dimens.size16,
                    ),
                    CustomButton(
                        textColors: theme.colorScheme.onSecondary,
                        text: tr('log_out'),
                        onclick: () {
                         bloc.signOut();
                        }),
                  ],
                ),
              );
            },
            listener: (BuildContext context, Object? state) {
              if(state is LogOut){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomeScreen()), (route) => false);
              }
            },
          ),
        ),
      ),
    );
  }
}
