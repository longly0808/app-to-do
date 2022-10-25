import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/bloc.dart';
import 'package:to_do_list/config/config.dart';
import 'package:to_do_list/core/bloc/base_state.dart';
import 'package:to_do_list/model/view/list_task_model.dart';
import 'package:to_do_list/page/screen/home_screen.dart';
import 'package:to_do_list/utility/convert.dart';
import 'package:to_do_list/widget/base_cubit_stateful_widget.dart';
import '../../constant.dart';
import '../../model/model.dart';
import '../../style/style.dart';
import '../../widget/item_task.dart';
import 'profile_screen.dart';
import 'task_detail_screen.dart';
import 'create_task_screen.dart';

class ListTaskScreen extends BaseCubitStatefulWidget {
  const ListTaskScreen({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<ListTaskScreen> createState() => _ListTaskScreenState();
}

class _ListTaskScreenState
    extends BaseCubitStateFulWidgetState<ListTaskBloc, ListTaskScreen> {
  @override
  void initState() {
    Config.token = widget.token;
    bloc.loadListTask();
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
        create: (context) => bloc,
        child: Scaffold(
          body: SafeArea(
            child: BlocConsumer<ListTaskBloc, BaseState>(
              listener: (BuildContext context, state) {},
              builder: (context, state) {
                if (state is LoadedState) {
                  final model = state.model;
                  return _homeBody(context, model, theme);
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ));
  }

  Widget _homeBody(BuildContext context, ListTaskModel model, ThemeData theme) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimens.size50),
              ),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return CreateTaskScreen(
                  title: 'work from home',
                  description: 'do something',
                  date: DateTime.now());
            },
          ).then(
            (value) {
              if (value == true) {
                bloc.loadListTask();
              }
            },
          );
        },
        backgroundColor: theme.colorScheme.primary,
        child: Icon(
          Icons.add,
          color: theme.colorScheme.onSecondary,
          size: Dimens.size40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.size16),
        child: Column(
          children: [
            _rowLogoAndSetting(theme),
            const SizedBox(
              height: Dimens.size32,
            ),
            _rowTittleList(theme),
            const SizedBox(
              height: Dimens.size16,
            ),
            Expanded(
              child: _listTask(context, theme, model.tasks ?? []),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowLogoAndSetting(ThemeData theme) {
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
          onSelected: (int select) => selectedSettings(select),
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
                  tr('log_out_upcase'),
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
        ),
      ],
    );
  }

  void selectedSettings(int selected) {
    switch (selected) {
      case 0:
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
        break;
    }
  }

  Widget _rowTittleList(ThemeData theme) {
    return Row(
      children: [
        Image.asset(
          Constants.icon_list,
          fit: BoxFit.cover,
          color: theme.colorScheme.primary,
          height: Dimens.size30,
        ),
        const SizedBox(
          width: Dimens.size16,
        ),
        Image.asset(
          Constants.logo_oneline,
          fit: BoxFit.cover,
          color: theme.colorScheme.primary,
          height: Dimens.size30,
        ),
        const Spacer(),
        Image.asset(
          Constants.icon_filter,
          fit: BoxFit.cover,
          color: theme.colorScheme.primary,
          height: Dimens.size30,
        ),
      ],
    );
  }

  Widget _listTask(
      BuildContext context, ThemeData theme, List<TaskModel> tasks) {
    return ListView.builder(
        reverse: true,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final item = tasks[index];

          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetail(task: item),
                  ),
                ).then((value) {if(value == true){
                  bloc.loadListTask();
                }});
              },
              child: ItemTask(
                title: item.content ?? '',
                description: item.description ?? '',
                dateTime: ConvertUtility.convertStringToDateTime(item.toDate)?? DateTime.now(),
                colorCard: theme.colorScheme.primary
                    .withOpacity(index % 2 != 0 ? 0.5 : 1),
                isShowIconClock: index % 2 == 0 ? true : false,
              ));
        });
  }
}
