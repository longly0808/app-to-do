import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/config/config.dart';
import '../../constant.dart';
import '../../model/service/task.dart';
import '../../style/style.dart';
import '../../widget/item_task.dart';
import 'profile_screen.dart';
import 'task_detail.dart';
import 'task_new.dart';

class ListTaskScreen extends StatefulWidget {
  const ListTaskScreen({Key? key,required this.token}) : super(key: key);
  final String token;

  @override
  State<ListTaskScreen> createState() => _ListTaskScreenState();
}

class _ListTaskScreenState extends State<ListTaskScreen> {
  @override
  void initState() {
    Config.token = widget.token;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return _HomeBody(context);
  }

  Widget _HomeBody(BuildContext context) {
    final theme = Theme.of(context);
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
              return TaskNew();
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
      body: SafeArea(
          child: Padding(
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
                  child: _listTask(context, theme),
                ),
              ],
            ),
          )),
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
        )
        // InkWell(
        //   onTap: () {
        //
        //   },
        //   child: Image.asset(
        //     Constants.icon_settings,
        //     fit: BoxFit.cover,
        //     color: theme.primaryColorDark,
        //     height: Dimens.size20,
        //   ),
        // )
      ],
    );
  }

  void selectedSettings(int selected) {
    switch (selected) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TaskDetail()));

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

  Widget _listTask(BuildContext context, ThemeData theme) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TaskDetail()));
            },
            child: ItemTask(
              colorCard: theme.colorScheme.primary
                  .withOpacity(index % 2 != 0 ? 0.5 : 1),
              isShowIconClock: index % 2 == 0 ? true : false,
              task: Task(
                title: 'aa',
                id: index,
                created_time: DateTime.now(),
                description: 'djwiqojdioqwjiodjwio',
              ),
            ),
          );
        });
  }
}
