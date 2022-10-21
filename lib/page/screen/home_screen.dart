import 'package:flutter/material.dart';
import 'package:to_do_list/config/config.dart';
import 'package:to_do_list/constant.dart';
import 'package:to_do_list/page/screen/task_detail.dart';
import 'package:to_do_list/page/screen/task_new.dart';
import 'package:to_do_list/style/style.dart';
import 'package:to_do_list/widget/commons/border_text_input.dart';
import 'package:to_do_list/widget/commons/custom_textfield.dart';
import 'package:to_do_list/widget/item_task.dart';
import 'package:to_do_list/widget/widget.dart';

import '../../model/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _dateTime;

  @override
  void initState() {
    _dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final text = Config.token;
    print('$text');
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
        InkWell(
          onTap: () {},
          child: Image.asset(
            Constants.icon_settings,
            fit: BoxFit.cover,
            color: theme.primaryColorDark,
            height: Dimens.size20,
          ),
        )
      ],
    );
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const TaskDetail()));

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
